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

telescope.load_extension("dap")
telescope.load_extension("lsp_handlers")

nmap("<leader>pf", ":Telescope find_files<CR>")
nmap("<leader>pb", ":Telescope buffers<CR>")
nmap("<leader>pg", ":Telescope live_grep<CR>")
nmap("<leader>ph", ":Telescope help_tags<CR>")
nmap("<leader>pd", ":lua require'telescope'.extensions.dap.commands{}<CR>")
