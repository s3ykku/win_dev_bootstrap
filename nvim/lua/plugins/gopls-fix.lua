return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers["*"] = opts.servers["*"] or {}
      opts.servers["*"].capabilities = opts.servers["*"].capabilities or {}

      local capabilities = opts.servers["*"].capabilities

      capabilities.textDocument = capabilities.textDocument or {}
      capabilities.textDocument.semanticTokens = capabilities.textDocument.semanticTokens
        or {
          dynamicRegistration = false,
          requests = {
            range = true,
            full = {
              delta = true,
            },
          },
          tokenTypes = {},
          tokenModifiers = {},
          formats = { "relative" },
        }
    end,
  },
}
