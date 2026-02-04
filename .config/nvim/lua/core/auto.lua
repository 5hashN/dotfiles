local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- vim.cmd [[
--     augroup templates
--         autocmd BufNewFile *.* silent! execute '0r $HOME/.config/nvim/templates    /template.'.expand('<afile>:e')
--     augroup END
-- ]]

augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '500' })
    end
})

autocmd('BufWritePre', {
    pattern = '',
    command = ':%s/\\s\\+$//e'
})

