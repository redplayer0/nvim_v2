return {
  "CRAG666/betterTerm.nvim",
  opts = {
    position = "bot",
    size = 15,
  },
  keys = {
    {
      '<leader>tr',
      function()
        require('betterTerm').open()
      end,
      desc = 'Open terminal',
    },
    {
      '<leader>tt',
      function()
        require('betterTerm').select()
      end,
      desc = 'Select terminal',
    },
  }
}
