return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local languages = {
        "bash",
        "css",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "query",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
      }

      require("nvim-treesitter").setup()
      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        desc = "Enable Treesitter features",
        pattern = languages,
        callback = function()
          pcall(vim.treesitter.start)
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo.foldmethod = "expr"
          vim.wo.foldlevel = 99
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
