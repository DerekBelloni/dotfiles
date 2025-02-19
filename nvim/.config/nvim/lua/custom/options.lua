-- ~/.config/nvim/lua/custom/options.lua
local options = {
	relativenumber = true,
	number = true,
	-- Add any other vim options you want here
}

-- Apply all the options
for k, v in pairs(options) do
	vim.opt[k] = v
end
