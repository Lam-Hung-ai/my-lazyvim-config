return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      local vscode = require("vscode")

      vscode.setup({
        style = "dark",
        transparent = false,

        italic_comments = true,
        italic_inlayhints = true,
        underline_links = true,
        terminal_colors = true,

        color_overrides = {
          vscBack = "#1f1f1f",
          vscLeftDark = "#181818",
          vscPopupBack = "#252526",
          vscSplitLight = "#303030",
          vscLineNumber = "#6e7681",
        },
      })

      local function apply_overrides()
        local editor = "#1f1f1f"
        local sidebar = "#181818"
        local popup = "#252526"
        local selected = "#2a2d2e"
        local separator = "#303030"

        -- Editor
        vim.api.nvim_set_hl(0, "Normal", {
          bg = editor,
        })

        vim.api.nvim_set_hl(0, "NormalNC", {
          bg = editor,
        })

        vim.api.nvim_set_hl(0, "SignColumn", {
          bg = editor,
        })

        vim.api.nvim_set_hl(0, "FoldColumn", {
          bg = editor,
        })

        vim.api.nvim_set_hl(0, "EndOfBuffer", {
          fg = editor,
          bg = editor,
        })

        vim.api.nvim_set_hl(0, "CursorLine", {
          bg = selected,
        })

        vim.api.nvim_set_hl(0, "CursorLineNr", {
          fg = "#cccccc",
          bold = true,
        })

        vim.api.nvim_set_hl(0, "WinSeparator", {
          fg = separator,
          bg = editor,
        })

        -- Popup
        vim.api.nvim_set_hl(0, "NormalFloat", {
          bg = popup,
        })

        vim.api.nvim_set_hl(0, "FloatBorder", {
          fg = "#454545",
          bg = popup,
        })

        vim.api.nvim_set_hl(0, "Pmenu", {
          fg = "#cccccc",
          bg = popup,
        })

        vim.api.nvim_set_hl(0, "PmenuSel", {
          fg = "#ffffff",
          bg = "#04395e",
        })

        -- Snacks Explorer
        vim.api.nvim_set_hl(0, "SnacksPickerList", {
          bg = sidebar,
        })

        vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", {
          bg = selected,
        })

        vim.api.nvim_set_hl(0, "SnacksPickerBorder", {
          fg = separator,
          bg = sidebar,
        })

        vim.api.nvim_set_hl(0, "SnacksPickerTitle", {
          fg = "#cccccc",
          bg = sidebar,
        })
      end

      local group = vim.api.nvim_create_augroup("VscodeDarkModernOverrides", { clear = true })

      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        pattern = "vscode",
        callback = apply_overrides,
      })

      vim.cmd.colorscheme("vscode")
      apply_overrides()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
