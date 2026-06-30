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
          on_win = function(self)
            local saved_guicursor

            local function terminal_cursor(value)
              local parts = {}
              local replaced = false

              for part in value:gmatch("[^,]+") do
                if part:match("^t:") then
                  if not replaced then
                    table.insert(parts, "t:hor20-blinkon0")
                    replaced = true
                  end
                else
                  table.insert(parts, part)
                end
              end

              if not replaced then
                table.insert(parts, "t:hor20-blinkon0")
              end

              return table.concat(parts, ",")
            end

            local function set_terminal_cursor()
              saved_guicursor = saved_guicursor or vim.o.guicursor
              vim.o.guicursor = terminal_cursor(saved_guicursor)
            end

            local function restore_cursor()
              if saved_guicursor then
                vim.o.guicursor = saved_guicursor
                saved_guicursor = nil
              end
            end

            local group = vim.api.nvim_create_augroup("snacks_terminal_cursor_" .. self.buf, { clear = true })
            vim.api.nvim_create_autocmd({ "BufEnter", "TermEnter", "WinEnter" }, {
              group = group,
              buffer = self.buf,
              callback = set_terminal_cursor,
            })
            vim.api.nvim_create_autocmd({ "BufLeave", "TermLeave", "WinLeave" }, {
              group = group,
              buffer = self.buf,
              callback = restore_cursor,
            })
            vim.api.nvim_create_autocmd("BufWipeout", {
              group = group,
              buffer = self.buf,
              callback = restore_cursor,
            })

            if vim.api.nvim_get_current_buf() == self.buf then
              set_terminal_cursor()
            end
          end,
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
