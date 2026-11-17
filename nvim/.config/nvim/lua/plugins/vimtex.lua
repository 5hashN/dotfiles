return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			local g = vim.g

			g.vimtex_view_method = "skim"
			g.vimtex_view_skim_sync = 1
			g.vimtex_view_skim_activate = 1

			g.vimtex_quickfix_open_on_warning = 0
			g.vimtex_quickfix_mode = 2

			g.vimtex_fold_enabled = 1
			g.vimtex_fold_types = { markers = { enabled = 0 }, sections = { parse_levels = 1 } }

			vim.cmd([[
                let g:vimtex_syntax_conceal = {
                        \ 'accents': 1,
                        \ 'ligatures': 1,
                        \ 'cites': 1,
                        \ 'fancy': 1,
                        \ 'spacing': 1,
                        \ 'greek': 1,
                        \ 'math_bounds': 1,
                        \ 'math_delimiters': 1,
                        \ 'math_fracs': 1,
                        \ 'math_super_sub': 1,
                        \ 'math_symbols': 1,
                        \ 'sections': 1,
                        \ 'styles': 1,
                        \}
            ]])
		end,
	},
}
