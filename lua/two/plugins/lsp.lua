return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cnl = require("cmp_nvim_lsp")
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
    end
    local capabilities = cnl.default_capabilities()
    lspconfig.clangd.setup({
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
    lspconfig.neocmake.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig.zls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
