return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-g>"] = { "scroll_documentation_up", "fallback" },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
        },
      },
      signature = {
        enabled = true,
      },
    },
  },
}
