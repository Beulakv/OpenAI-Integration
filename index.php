<?php
session_start();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AI Chat Mini</title>
    <style>
        body { font-family: sans-serif; background: #f4f4f9; display: flex; justify-content: center; padding: 50px; }
        .chat-container { width: 400px; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        textarea { width: 100%; padding: 10px; margin-bottom: 10px; border: 1px solid #ddd; border-radius: 5px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer; }
        #response { margin-top: 20px; padding: 10px; background: #eef; border-radius: 5px; min-height: 50px; line-height: 1.5; }
    </style>
</head>
<body>

<!-- <div class="chat-container">
    <h3>Ask OpenAI</h3>
    <textarea id="userInput" placeholder="Type your question here..." rows="4"></textarea>
    <button onclick="askAI()">Send Request</button>
    <div id="response">Waiting for your question...</div>
</div> -->

    <?php  if (isset($_SESSION['user_role']) && $_SESSION['user_role'] === 'admin'): ?>
    
    <div id="admin-panel">
        <h4>Admin: Edit Prompts</h4>
        <div id="prompt-editor">
            </div>
    </div>
    <?php else : ?>
        <div class="chat-container">
            <h3>Ask OpenAI</h3>
            <textarea id="userInput" rows="14"></textarea>
            <button onclick="askAI()">Send Request</button>
            <div id="response">Waiting...</div>
        </div>
    <?php endif; ?>


<script>
async function askAI() {
    const input = document.getElementById('userInput').value;
    const responseBox = document.getElementById('response');
    
    responseBox.innerText = "Thinking...";

    try {
        // We fetch our OWN php file, not OpenAI directly
        const response = await fetch('api_handler.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },

            body: "messages=" + encodeURIComponent(JSON.stringify(input))
        });

        const data = await response.json();
        responseBox.innerText = data.answer || data.error;
    } catch (err) {
        responseBox.innerText = "Error connecting to server.";
    }
}

async function loadPrompts() {
    const res = await fetch('api_handler.php?action=get_prompts');
    const data = await res.json();
    const container = document.getElementById('prompt-editor');
    
    container.innerHTML = '';
    for (const [id, text] of Object.entries(data)) {
        container.innerHTML += `
            <div style="margin-bottom: 10px;">
                <small>Prompt ID: ${id}</small>
                <textarea id="area-${id}" style="width:100%" rows="15" >${text}</textarea>
                <button onclick="savePrompt(${id})">Save #${id}</button>
            </div>
        `;
    }
}

async function savePrompt(id) {
    const template = document.getElementById(`area-${id}`).value;
    const formData = new FormData();
    formData.append('id', id);
    formData.append('template', template);

    const res = await fetch('api_handler.php?action=update_prompt', {
        method: 'POST',
        body: formData
    });
    
    const result = await res.json();
    alert(result.success || result.error);
}

// Run if admin area exists
if (document.getElementById('prompt-editor')) {
    loadPrompts();
}
</script>

</body>
</html>
