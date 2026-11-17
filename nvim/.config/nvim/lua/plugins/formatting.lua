return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				padding = true,
				sticky = true,
				ignore = nil,
				toggler = {
					line = "<Bslash>cc",
					block = "<Bslash>cb",
				},
				opleader = {
					line = "cc",
					block = "cb",
				},
				extra = {
					above = "<Bslash>cO",
					below = "<Bslash>co",
					eol = "<Bslash>ce",
				},
				mappings = {
					basic = true,
					extra = true,
				},
				pre_hook = nil,
				post_hook = nil,
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"rmagatti/alternate-toggler",
		event = "BufReadPost",
		config = function()
			require("alternate-toggler").setup({
				alternates = {
					["=="] = "!=",
				},
			})
			vim.keymap.set("n", "<Bslash>tt", "<cmd>ToggleAlternate<CR>")
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		enabled = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("refactoring").setup({
				prompt_func_return_type = {
					go = false,
					java = false,
					cpp = false,
					c = false,
					h = false,
					hpp = false,
					cxx = false,
				},
				prompt_func_param_type = {
					go = false,
					java = false,
					cpp = false,
					c = false,
					h = false,
					hpp = false,
					cxx = false,
				},
				printf_statements = {},
				print_var_statements = {},
				show_success_message = false,
			})
		end,
	},
}
