return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    opts = {
      overrides = function(colors)
        return {
          SnacksDashboardHeader = { fg = colors.palette.springGreen },
        }
      end,
    },
  },
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        on_highlights = function(highlights, colors)
          highlights.SnacksDashboardHeader = { fg = colors.blue }
        end,
      })
      vim.opt.background = "dark"
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "morhetz/gruvbox",
    name = "gruvbox",
  },
}
