<?php
session_start();
header('Content-Type: application/json');

require "db.php";
require_once __DIR__ . "/config.php";

require __DIR__ . "/openai_call.php";
require __DIR__ . "/prompt.php";

$isAdmin = isset($_SESSION['user_role']) && $_SESSION['user_role'] === 'admin';


if (isset($_GET['action']) && $_GET['action'] === 'get_prompts') {
    if (!$isAdmin) {
        http_response_code(403);
        echo json_encode(["error" => "Unauthorized: Admin access required"]);
        exit;
    }
    
    $prompts = getActivePrompts($conn);
    echo json_encode($prompts);
    exit; // Stop execution here for this specific action
}


if (isset($_GET['action']) && $_GET['action'] === 'update_prompt') {
    if (!$isAdmin) {
        http_response_code(403);
        echo json_encode(["error" => "Unauthorized"]);
        exit;
    }

    $id = $_POST['id'];
    $newTemplate = $_POST['template'];

    $stmt = $conn->prepare("UPDATE interview_prompt SET prompt_template = ? WHERE pr_seq = ?");
    $stmt->bind_param("si", $newTemplate, $id);
    
    if ($stmt->execute()) {
        echo json_encode(["success" => "Prompt updated"]);
    } else {
        echo json_encode(["error" => "Update failed"]);
    }
    exit;
}

try {
    if (!isset($_SESSION['user_id'])) {
        throw new Exception("Unauthorized");
    }

    $user_id = $_SESSION['user_id'];
   
    $userdata = $_POST['messages'] ?? ''; 

   
    $stmt = $conn->prepare("UPDATE users SET domain = ? WHERE id = ?");
    $stmt->bind_param("si", $userdata, $user_id);
    $stmt->execute();
    $stmt->close();

    
    $vars = [
        "situation" => $userdata, // Use the actual string content
    ];

    $prompts = getActivePrompts($conn);
    
    $history = json_decode($_POST['history'] ?? '[]', true);
    $messages = is_array($history) ? $history : [];

    
    if (empty($messages)) {
        $prompt1 = fillPrompt($prompts[1], $vars);
        // print_r($prompt1);
        addUser($messages, $prompt1);
    } else {
        
        addUser($messages, $userdata);
    }

    // 6. Call AI
    $response = addAssistant($messages);

    if (stripos($response, "error") !== false) {
        throw new Exception("AI Provider Error: " . $response);
    }

    $ins = $conn->prepare("INSERT INTO ai_logs (prompt, ai_response) VALUES (?, ?)");
    $ins->bind_param("ss", $prompt1, $response);
    $ins->execute();

    echo json_encode([
        'answer' => $response,
        'history' => $messages // Send history back to the client to store
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
}
?>