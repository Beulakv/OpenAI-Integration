<?php
// require "db.php";


function getActivePrompts($conn): array
{
    $prompts = [];

    $stmt = $conn->prepare("
        SELECT pr_seq, prompt_template
        FROM interview_prompt
        WHERE pr_status = 1
        ORDER BY pr_seq ASC
    ");

    $stmt->execute();
    $result = $stmt->get_result();

    while ($row = $result->fetch_assoc()) {
        $prompts[(int)$row['pr_seq']] = $row['prompt_template'];
    }

    $stmt->close();

    return $prompts;
}

function addUser(array &$messages, string $content): void
{
    $messages[] = [
        "role" => "user",
        "content" => $content
    ];
}

function addAssistant(array &$messages): string
{
    $response = callOpenAI($messages);

    if (isOpenAIError($response)) {
        throw new Exception($response);
    }

    $messages[] = [
        "role" => "assistant",
        "content" => $response
    ];

    return $response;
}

function isOpenAIError(string $response): bool
{
    return str_starts_with($response, "OpenAI API error")
        || str_starts_with($response, "Curl error")
        || str_contains($response, "not found");
}

function fillPrompt(string $template, array $vars): string
{
    foreach ($vars as $key => $value) {
        // Ensure value is a string
        $valString = is_string($value) ? $value : json_encode($value);
        $template = str_replace("{{" . $key . "}}", $valString, $template);
    }
    return $template;
}
?>