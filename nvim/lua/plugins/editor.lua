return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
      delay = 300,
      layout = {
        width = { min = 30, max = 60 },
      },
      spec = {
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>t", group = "terminal" },
        { "<leader>x", group = "trouble" },
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
