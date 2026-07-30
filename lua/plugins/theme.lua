return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      require("vscode").setup({
        -- "dark" hoặc "light"
        style = "dark",

        -- Nền trong suốt
        transparent = false,

        -- Comment in nghiêng
        italic_comments = true,

        -- Inlay hints in nghiêng
        italic_inlayhints = true,

        -- Gạch chân liên kết Markdown
        underline_links = true,

        -- Áp dụng bảng màu vào terminal bên trong Neovim
        terminal_colors = true,

        -- Chủ yếu dành cho nvim-tree.
        -- LazyVim mặc định thường dùng neo-tree nên không quá quan trọng.
        disable_nvimtree_bg = false,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
