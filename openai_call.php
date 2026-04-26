<?php

require_once __DIR__ . "/config.php";

/* Load .env file */
loadEnv(__DIR__ . "/.env");

/**
 * Call OpenRouter Chat Completion API
 */
function callOpenAI(array $messages, string $model = "openrouter/free", float $temperature = 0.2): string
{
    // Make sure your .env has your OpenRouter Key
    $apiKey = getenv("OPENAI_API_KEY");

    if (!$apiKey) {
        return " OPENROUTER_API_KEY not found in .env";
    }

    $payload = [
        "model" => $model,
        "messages" => $messages,
        "temperature" => $temperature
    ];

    // 1. UPDATED: OpenRouter Endpoint
    $ch = curl_init("https://openrouter.ai/api/v1/chat/completions");

    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_HTTPHEADER => [
            "Content-Type: application/json",
            "Authorization: Bearer " . $apiKey,
            // 2. UPDATED: Required OpenRouter Headers
            "HTTP-Referer: https://your-site.com", 
            "X-Title: My AI App"
        ],
        CURLOPT_POSTFIELDS => json_encode($payload),
        CURLOPT_TIMEOUT => 60,

        // DEV FIX FOR WINDOWS SSL
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_SSL_VERIFYHOST => false
    ]);

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        $error = curl_error($ch);
        curl_close($ch);
        return " Curl error: " . $error;
    }

    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    $data = json_decode($response, true);

    // 3. UPDATED: OpenRouter error structure is slightly different but mostly compatible
    if ($httpCode !== 200) {
        return " OpenRouter API error (" . $httpCode . "): " . ($data['error']['message'] ?? 'Unknown error');
    }

    return $data['choices'][0]['message']['content'] ?? " Empty response from OpenRouter";
}
