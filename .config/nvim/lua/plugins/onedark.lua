return {
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('onedark').setup {
				style = 'dark',
				transparent = true,  -- Show/hide background
				lualine = {
					transparent = true, -- lualine center bar transparency
				}
			}
			require('onedark').load()
		end
	}
}
