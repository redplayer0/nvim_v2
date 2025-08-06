return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-registry"
  },
  opts = {
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  }
}
