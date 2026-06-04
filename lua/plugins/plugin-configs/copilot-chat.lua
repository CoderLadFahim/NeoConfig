local copilot_chat_status_ok, copilot_chat = pcall(require, 'CopilotChat')
if not copilot_chat_status_ok then
	return
end

copilot_chat.setup {
    temperature = 0.1,           -- Lower = focused, higher = creative
    -- model = 'gpt-5-mini',              -- OpenAI model name
    prompts = {
        Explain = {
            prompt = '> /COPILOT_EXPLAIN\n\nAlways use <?php opening tags in PHP code blocks.',
        },
    },
    system_prompt =  [[
        After starting the block with ```php, Always inclue php outputs with the opening <?php 
        tag for syntax highlighting. No matter what, never remove the opening php tag from your responses.
        If you are outputting a method of a class in PHP, put it inside a class structure with the opening <?php tag.
        Even when I ask you to optimize snippets that don't have the opening tag, always add it.
        You may exclude the closing tag before the ending ```.

        When generating PHP and/or python code, always make your variables snake_cased. 
    ]],
    window = {
        layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
        width = 0.5,              -- 50% of screen width
    },
    auto_insert_mode = false,     -- Enter insert mode when opening
    highlight = {
        enable = true,
        chat_hl_group = 'Normal', -- Highlight group for chat text
        user_hl_group = 'Title', -- Highlight group for user questions
        ai_hl_group = 'Statement', -- Highlight group for AI responses
    },
    markdown = {
        enable = true,
        code_block = {
            enable = true,
        },
    },
    mappings = {
      accept_diff = { normal = '<C-a>', insert = '<C-a>' },
    },
}
