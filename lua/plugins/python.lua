return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          init_options = {
            settings = {
              -- Cho phép Ruff tự động sửa các lỗi auto-fixable (bao gồm Organize Imports)
              fixAll = true,
              -- Hoặc bật riêng tính năng organizeImports nếu cần
              organizeImports = true,
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
      },
    },
  },
}
