return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.3.1",
  event = { "InsertEnter" },
  opts = {
    keymap = { preset = "enter" },
    appearance = {
      nerd_font_variant = "mono"
    },
    completion = { documentation = { auto_show = false } },
  },
  opts_extend = { "sources.default" }
}
