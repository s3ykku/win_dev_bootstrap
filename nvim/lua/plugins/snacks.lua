return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      bufdelete = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
          ]],
			},
      },
      indent = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      terminal = {
        enabled = true,
        shell = vim.fn.exepath("nu") ~= "" and vim.fn.exepath("nu") or "nu",
      },
      styles = {
        terminal = {
          keys = {
            ["<Esc>"] = "hide",
            q = "hide",
            gf = function(self)
              local file = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
              if file == "" then
                Snacks.notify.warn("No file under cursor")
              else
                self:hide()
                vim.schedule(function()
                  vim.cmd("edit " .. file)
                end)
              end
            end,
            term_normal = {
              "<Esc>",
              function()
                vim.cmd.stopinsert()
              end,
              mode = "t",
              desc = "Terminal normal mode",
            },
          },
        },
      },
    },
  },
}
