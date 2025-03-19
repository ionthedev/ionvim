-- lua/plugins/rose-pine.lua
return { 
	"sainnhe/gruvbox-material", 
	name = "gruvbox-material",
	config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme('gruvbox-material')
	end
}
