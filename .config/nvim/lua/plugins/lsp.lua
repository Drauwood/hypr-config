return {
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig.configs')
            -- local lspconfig = vim.lsp.config('')
            -- lspconfig.lua_ls.setup{}
            -- lspconfig.clangd.setup{}
            -- lspconfig.rust_analyzer.setup{}
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function ()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'clangd', 'rust_analyzer', 'tombi' }
            })
        end
    }
}
