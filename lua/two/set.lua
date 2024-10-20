vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.cursorline = true
vim.wo.signcolumn = "yes:2"

vim.filetype.add({
    extension = {
        vert = "glsl",
        tesc = "glsl",
        tese = "glsl",
        geom = "glsl",
        frag = "glsl",
        comp = "glsl",
    },
})
