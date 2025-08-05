return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "igorlfs/nvim-dap-view",
        opts = {
          winbar = {
            show = true,
            -- You can add a "console" section to merge the terminal with the other views
            sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
            -- Must be one of the sections declared above
            default_section = "scopes",
            headers = {
              breakpoints = "Breakpoints [B]",
              scopes = "Scopes [S]",
              exceptions = "Exceptions [E]",
              watches = "Watches [W]",
              threads = "Threads [T]",
              repl = "REPL [R]",
              console = "Console [C]",
            },
            controls = {
              enabled = true,
              position = "right",
              buttons = {
                "play",
                "step_into",
                "step_over",
                "step_out",
                "step_back",
                "run_last",
                "terminate",
                "disconnect",
              },
              custom_buttons = {},
              icons = {
                pause = "",
                play = "",
                step_into = "",
                step_over = "",
                step_out = "",
                step_back = "",
                run_last = "",
                terminate = "",
                disconnect = "",
              },
            },
          },
          windows = {
            height = 15,
            position = "below",
            terminal = {
              position = "left",
              width = 0.5,
              -- List of debug adapters for which the terminal should be ALWAYS hidden
              hide = {},
              -- Hide the terminal when starting a new session
              start_hidden = false,
            },
          },
          help = {
            border = nil,
          },
          -- Controls how to jump when selecting a breakpoint or navigating the stack
          switchbuf = "usetab",
        }
      },
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio"
    },
    ft = { "java" },
    priority = 600,
    config = function()
      local dap = require("dap")
      local dv = require("dap-view")
      dap.defaults.fallback.switchbuf = "usevisible,usetab,newtab"

      require("nvim-dap-virtual-text").setup {}

      vim.keymap.set("n", "<leader>t", dv.toggle)
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>B", dap.run_to_cursor)
      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.restart)
      vim.keymap.set("n", "<F6>", dap.step_back)

      dap.listeners.before.attach["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.before.launch["dap-view-config"] = function()
        dv.open()
      end
      dap.listeners.before.event_terminated["dap-view-config"] = function()
        dv.close()
      end
      dap.listeners.before.event_exited["dap-view-config"] = function()
        dv.close()
      end
    end,
  },
}
