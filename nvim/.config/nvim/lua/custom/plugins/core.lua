-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		priority = 1000,
	},
	-- Use a plugin manager like packer.nvim
	{
		"EdenEast/nightfox.nvim",
		config = function()
			-- Set the background to dark mode
			vim.o.background = "dark"
			-- Apply the "vague" color scheme
			vim.cmd.colorscheme("nightfox")
		end,
	},
	{

		{
			"nvim-tree/nvim-tree.lua",
			version = "*",
			lazy = false,
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("nvim-tree").setup({
					sort_by = "case_sensitive",
					view = {
						width = 30,
					},
					renderer = {
						group_empty = true,
						icons = {
							webdev_colors = true,
							git_placement = "before",
							modified_placement = "after",
							padding = " ",
							symlink_arrow = " ➛ ",
							show = {
								file = true,
								folder = true,
								folder_arrow = true,
								git = true,
							},
						},
					},
					filters = {
						dotfiles = true,
					},
				})
				vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
			end,
		},
	},
	{
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	},
	{
		"junegunn/fzf.vim",
		config = function()
			-- Optional: Add keybindings or custom configurations for fzf.vim
			vim.keymap.set("n", "<leader>ff", ":Files<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>fg", ":Rg<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>fb", ":Buffers<CR>", { noremap = true, silent = true })
		end,
	},
}
