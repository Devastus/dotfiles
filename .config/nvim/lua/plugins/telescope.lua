local telescope = require("telescope")
telescope.setup({
    extensions = {
        lsp_handlers = {
            code_action = {
                telescope = require("telescope.themes").get_dropdown({})
            }
        },
    },
})

telescope.load_extension('dap')
telescope.load_extension('lsp_handlers')

nmap("<leader>tf", ":Telescope find_files<CR>")
nmap("<leader>tb", ":Telescope buffers<CR>")
