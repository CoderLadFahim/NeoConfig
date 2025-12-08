local copilot_status_ok, copilot = pcall(require, "copilot")
if not copilot_status_ok then
	return
end

copilot.setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})

-- You've reached your monthly code completion limit. Upgrade your plan to Copilot Pro (30-day Free Trial) or wait until 2025-07-19
-- for your limit to reset to continue coding with GitHub Copilot. You are currently logged in as JL-Fahim.:
-- 1: Upgrade your plan
-- 2: Dismiss
