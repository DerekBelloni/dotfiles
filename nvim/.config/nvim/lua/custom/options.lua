-- ~/.config/nvim/lua/custom/options.lua
local options = {
	relativenumber = true,
	number = true,
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	-- You might also want these related settings:
	softtabstop = 2, -- Number of spaces a tab counts for while editing
	smartindent = true, -- Insert indents automatically
}
-- Apply all the options
for k, v in pairs(options) do
	vim.opt[k] = v
end
