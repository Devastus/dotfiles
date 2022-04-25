local dap = require("dap")
local dapui = require("dapui")
dapui.setup()

dap.adapters = {
    node2 = {
        type = 'executable',
        command = 'node',
        args = {os.getenv('HOME') .. '/.local/dev/vscode-node-debug2/out/src/nodeDebug.js'},
    },
    chrome = {
        type = "executable",
        command = "node",
        args = {os.getenv("HOME") .. "/.local/dev/vscode-chrome-debug/out/src/chromeDebug.js"}
    },
    lldb = {
      type = 'executable',
      command = '/usr/bin/lldb-vscode', -- adjust as needed
      name = "lldb"
    }
}
dap.configurations = {
    javascript = {
        {
            name = 'Launch',
            type = 'node2',
            request = 'launch',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
        },
        {
            -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            name = 'Attach to process',
            type = 'node2',
            request = 'attach',
            processId = require'dap.utils'.pick_process,
        },
    },
    typescript = {
        {
            name = 'Launch',
            type = 'node2',
            request = 'launch',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            console = 'integratedTerminal',
            outFiles = { vim.fn.getcwd() .. "/dist/**/*.js" },
        },
        {
            -- For this to work you need to make sure the node process is started with the `--inspect` flag.
            name = 'Attach to process',
            type = 'node2',
            request = 'attach',
            processId = require'dap.utils'.pick_process,
        },
    },
    javascriptreact = { -- change this to javascript if needed
        {
            type = "chrome",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}"
        }
    },
    typescriptreact = { -- change to typescript if needed
        {
            type = "chrome",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}"
        }
    },
    cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = vim.fn.getcwd(),
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        }
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.zig = dap.configurations.cpp

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

nmap("<F5>", ":lua require('dap').continue()<CR>")
nmap("<F6>", ":lua require('dap').toggle_breakpoint()<CR>")
nmap("<F10>", ":lua require('dap').step_over()<CR>")
nmap("<F11>", ":lua require('dap').step_into()<CR>")
nmap("<F12>", ":lua require('dap').step_out()<CR>")
nmap("<leader>db", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nmap("<leader>dp", ":lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nmap("<leader>dd", ":lua require('dapui').toggle()<CR>")
nmap("<leader>dl", ":lua require('dap').run_last()<CR>")
nmap("<leader>dk", ":lua require('dap').up()<CR>")
nmap("<leader>dj", ":lua require('dap').down()<CR>")
