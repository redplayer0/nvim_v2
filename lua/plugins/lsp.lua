return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  ft = { "lua", "html", "typescript", "python", "elixir", "eelixir", "heex", "surface" },
  opts = {
    servers = {
      elixirls = {
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" }
      },
      ruff = {},
      pylsp = {},
      ts_ls = {},
      html = {},
      lua_ls = {
        settings = {
          Lua = {
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = 2
              }
            },
            workspace = {
              library = {
                "$VIMRUNTIME/lua/vim",
                "${3rd}/love2d/library",
                "${3rd}/luv/library",
              }
            }
          }
        }
      }
    }
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end
}
