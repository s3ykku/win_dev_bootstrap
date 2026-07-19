return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    lazy = false,
    keys = {
      {
        "<leader>fd",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters = {
        biome = {
          -- Biome disables its HTML formatter by default. Keep both web
          -- formatters enabled when Conform runs Biome through stdin.
          append_args = {
            "--html-formatter-enabled=true",
            "--css-formatter-enabled=true",
          },
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        go = { "goimports", "gofumpt" },
        python = { "isort", "black" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        html = { "biome" },
        css = { "biome" },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = function(bufnr)
        local filetype = vim.bo[bufnr].filetype
        local biome_filetypes = {
          html = true,
          css = true,
          javascript = true,
        }

        if biome_filetypes[filetype] then
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end
      end,
    },
  },
}
