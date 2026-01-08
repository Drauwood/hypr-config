return {
    {
        -- 'mason-org/mason.nvim',
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
        end
    }
}
