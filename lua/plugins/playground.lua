return {
  "nvim-treesitter/playground",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      playground = {
        enable = true,
        updatetime = 25,
      },
    }
  end
}
