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
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 500 })
    end
})

local clean_group = augroup('CleanOnSave', { clear = true })
autocmd('BufWritePre', {
    group = clean_group,
    pattern = '*',
    callback = function()
        if vim.bo.filetype ~= 'markdown' and vim.bo.buftype == '' then
            local view = vim.fn.winsaveview()
            vim.cmd([[%s/\s\+$//e]])
            vim.fn.winrestview(view)
        end
    end,
})

