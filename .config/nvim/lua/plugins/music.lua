return {
	{
		"davidgranstrom/scnvim",
		enabled = false,
		ft = { "supercollider" },
		config = function()
			local scnvim = require("scnvim")
			local map = scnvim.map
			local map_expr = scnvim.map_expr

			scnvim.setup({
				keymaps = {
					["<M-e>"] = map("editor.send_line", { "i", "n" }),
					["<C-e>"] = {
						map("editor.send_block", { "i", "n" }),
						map("editor.send_selection", "x"),
					},
					["<CR>"] = map("postwin.toggle"),
					["<M-CR>"] = map("postwin.toggle", "i"),
					["<M-L>"] = map("postwin.clear", { "n", "i" }),
					["<C-k>"] = map("signature.show", { "n", "i" }),
					["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
					["<leader>st"] = map("sclang.start"),
					["<leader>sk"] = map("sclang.recompile"),
					["<F1>"] = map_expr("s.boot"),
					["<F2>"] = map_expr("s.meter"),
				},
				editor = {
					highlight = {
						color = "IncSearch",
					},
				},
				postwin = {
					float = {
						enabled = true,
					},
				},
			})

			vim.g.scnvim_snippet_format = "ultisnips"
			vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "scnvim-data" }
			vim.g.scnvim_postwin_syntax_hl = 1
			vim.g.scnvim_scdoc = 1
			vim.g.scnvim_postwin_orientation = "v"
			vim.g.scnvim_postwin_direction = "right"
			vim.g.scnvim_postwin_size = 50
			vim.g.scnvim_postwin_auto_toggle = 1
			vim.g.scnvim_eval_flash_duration = 100
			vim.g.scnvim_eval_flash_repeats = 2
			vim.cmd([[ highlight SCNvimEval guifg=black guibg=white ctermfg=black ctermbg=white ]])
		end,
	},
	{
		"davidgranstrom/telescope-scdoc.nvim",
		enabled = false,
		ft = { "supercollider" },
	},
	{
		"madskjeldgaard/nvim-supercollider-piano",
		enabled = false,
		ft = { "supercollider" },
	},
}
