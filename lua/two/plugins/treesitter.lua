return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "asm",
            "bash",
            "c",
            "cpp",
            "rust",
            "zig",
            "cmake",
            "glsl",
            "diff",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "vim",
            "vimdoc",
            "gdscript",
            "gdshader",
            "godot_resource",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "ruby" },
        },
        indent = { enable = true, disable = { "ruby" } },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
