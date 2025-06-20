return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
        },
    },
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            local disable_filetypes = { c = true, cpp = true }
            return {
                timeout_ms = 500,
                lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
            }
        end,
        formatters_by_ft = {
            c = { "clang-format" },
            cpp = { "clang-format" },
            cmake = { "cmake-format" },
            lua = { "stylua" },
            python = { "black" },
            rust = { "rustfmt" },
            zig = { "zls" },
            gdscript = { 'gdformat' },
        },
    },
}
