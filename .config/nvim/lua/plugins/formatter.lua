local formatter = require("formatter")
local util = require("formatter.util")
local filetypes = require("formatter.filetypes")

-- Provides the Format and FormatWrite commands
formatter.setup {
  -- All formatter configurations are opt-in
  filetype = {
    cs = { function()
        return {
          exe = "dotnet",
          args = {
            "format",
            "--include",
            vim.fn.expand("%:."),
          },
          stdin = true,
        }
      end
    },
    go = { filetypes.go.gofmt },
    html = { filetypes.html.prettier },
    css = { filetypes.css.prettier },
    yaml = { filetypes.yaml.prettier },
    json = { filetypes.json.prettier },
    javascript = { filetypes.javascript.prettier },
    javascriptreact = { filetypes.javascriptreact.prettier },
    typescript = { filetypes.typescript.prettier },
    typescriptreact = { filetypes.typescriptreact.prettier },
  }
}

-- local formatGroup = vim.api.nvim_create_augroup("FormatAutogroup", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = formatGroup,
--     pattern = {"*"},
--     command = "FormatWrite",
-- })
