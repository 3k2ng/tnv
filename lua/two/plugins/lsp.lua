return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local cnl = require("cmp_nvim_lsp")
        local opts = { noremap = true, silent = true }
        local on_attach = function()
            vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
            vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations)
            vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions)
            vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols)
            vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)               -- smart rename
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                         -- show documentation for what is under cursor
        end
        local capabilities = cnl.default_capabilities()
        vim.lsp.enable("clangd")
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=never",
                "--completion-style=detailed",
                "--function-arg-placeholders=0",
                "--fallback-style=llvm",
            },
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("slangd")
        vim.lsp.config("slangd", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("neocmake")
        vim.lsp.config("neocmake", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("rust_analyzer")
        vim.lsp.config("rust_analyzer", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("lua_ls")
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("pyright")
        vim.lsp.config("pyright", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("gdscript")
        vim.lsp.config("gdscript", {
            capabilities = capabilities,
            on_attach = on_attach
        })
    end,
}
