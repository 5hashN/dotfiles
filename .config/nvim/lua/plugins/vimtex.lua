-- require('vimtex').setup()

local g = vim.g

g.vimtex_view_method = 'skim'
g.vimtex_view_skim_sync = 1
g.vimtex_view_skim_activate = 1

g.vimtex_quickfix_open_on_warning = 0
g.vimtex_quickfix_mode = 2

g.vimtex_fold_enabled = 1
g.vimtex_fold_types = { markers = { enabled = 0 },
                        sections = { parse_levels = 1 } }

vim.cmd [[
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
]]

-- g.vimtex_syntax_conceal_disable = 0

-- g.tex_superscripts = '[0-9a-zA-W.,:;+-<>/()=]'
-- g.tex_subscripts = '[0-9aehijklmnoprstuvx,+-/().]'
-- g.tex_conceal_frac = 1
-- g.tex_conceal = 'abdgm'

-- g.vimtex_syntax_enabled = 0

-- vim.api.nvim_create_autocmd("User", {
--     group = vim.api.nvim_create_augroup("init_vimtex", {}),
--     pattern = "VimtexEventViewReverse",
--     desc = "VimTeX: Center view on inverse search",
--     command = [[ normal! zMzvzz ]], })

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--     pattern = "*.tex",
--     callback = function()
--         vim.cmd [[TSBufDisable highlight]]
--     end
-- })
