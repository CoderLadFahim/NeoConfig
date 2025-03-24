local vscode_status_ok, vscode = pcall(require, 'vscode')
if not vscode_status_ok then
	return
end

local c = require('vscode.colors').get_colors()
vscode.setup({
  -- Underline `@markup.link.*` variants
  underline_links = true,
  -- Override highlight groups (see ./lua/vscode/theme.lua)
  group_overrides = {
    -- this supports the same val table as vim.api.nvim_set_hl
    -- use colors from this colorscheme by requiring vscode.colors!
    Winbar = { fg=c.vscFront, bg=c.vscLeftMid, bold=false },
    ColorColumn = { bg=c.vscLeftMid },

    VimwikiLink = { fg=c.vscAccentBlue, underline=true },

    VimwikiHeader1 = { fg = c.vscMediumBlue, bold = true },
    VimwikiHeader2 = { fg = c.vscGreen, bold = true },
    VimwikiHeader3 = { fg = c.vscBlueGreen, bold = true },
    VimwikiHeader4 = { fg = c.vscViolet, bold = true },
    VimwikiHeader5 = { fg = c.vscPink, bold = true },
    VimwikiHeader6 = { fg = c.vscDarkYellow, bold = true },

    VimwikiHeaderChar = { fg=c.vscSplitDark },

    ["LineNr"] = { fg = c.vscGray },
    ["CursorLineNr"] = { fg = c.vscBlueGreen },
    ["CursorLine"] = { bg = c.vscLeftMid },
    ["LeapLabelPrimary"] = { bg=c.vscAccentBlue, fg=c.vscBack },
    ["Search"] = { bg = c.vscBlueGreen, fg = c.vscBack },
    ["IncSearch"] = { bg = c.vscBlueGreen, fg = c.vscBack },
    ["CurSearch"] = { bg = c.vscYellowOrange, fg = c.vscBack }
  }
})

-- vscNone = 'NONE',
-- vscFront = '#D4D4D4',
-- vscBack = '#1F1F1F',
--
-- vscTabCurrent = '#1F1F1F',
-- vscTabOther = '#2D2D2D',
-- vscTabOutside = '#252526',
--
-- vscLeftDark = '#252526',
-- vscLeftMid = '#373737',
-- vscLeftLight = '#636369',
--
-- vscPopupFront = '#BBBBBB',
-- vscPopupBack = '#272727',
-- vscPopupHighlightBlue = '#004b72',
-- vscPopupHighlightGray = '#343B41',
--
-- vscSplitLight = '#898989',
-- vscSplitDark = '#444444',
-- vscSplitThumb = '#424242',
--
-- vscCursorDarkDark = '#222222',
-- vscCursorDark = '#51504F',
-- vscCursorLight = '#AEAFAD',
-- vscSelection = '#264F78',
-- vscLineNumber = '#5A5A5A',
--
-- vscDiffRedDark = '#4B1818',
-- vscDiffRedLight = '#6F1313',
-- vscDiffRedLightLight = '#FB0101',
-- vscDiffGreenDark = '#373D29',
-- vscDiffGreenLight = '#4B5632',
-- vscSearchCurrent = '#515c6a',
-- vscSearch = '#613315',
--
-- vscGitAdded = '#81b88b',
-- vscGitModified = '#e2c08d',
-- vscGitDeleted = '#c74e39',
-- vscGitRenamed = '#73c991',
-- vscGitUntracked = '#73c991',
-- vscGitIgnored = '#8c8c8c',
-- vscGitStageModified = '#e2c08d',
-- vscGitStageDeleted = '#c74e39',
-- vscGitConflicting = '#e4676b',
-- vscGitSubmodule = '#8db9e2',
--
-- vscContext = '#404040',
-- vscContextCurrent = '#707070',
--
-- vscFoldBackground = '#202d39',
--
-- -- Syntax colors
-- vscGray = '#808080',
-- vscViolet = '#646695',
-- vscBlue = '#569CD6',
-- vscAccentBlue = '#4FC1FF',
-- vscDarkBlue = '#223E55',
-- vscMediumBlue = '#18a2fe',
-- vscDisabledBlue = '#729DB3',
-- vscLightBlue = '#9CDCFE',
-- vscGreen = '#6A9955',
-- vscBlueGreen = '#4EC9B0',
-- vscLightGreen = '#B5CEA8',
-- vscRed = '#F44747',
-- vscOrange = '#CE9178',
-- vscLightRed = '#D16969',
-- vscYellowOrange = '#D7BA7D',
-- vscYellow = '#DCDCAA',
-- vscDarkYellow = '#FFD602',
-- vscPink = '#C586C0',
--
-- vscDimHighlight = '#51504F',
