require('Comment').setup({
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = '<Bslash>cc',
        ---Block-comment toggle keymap
        block = '<Bslash>cb',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'cc',
        ---Block-comment keymap
        block = 'cb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = '<Bslash>cO',
        ---Add comment on the line below
        below = '<Bslash>co',
        ---Add comment at the end of line
        eol = '<Bslash>ce',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
})

require('ibl').setup()

require('nvim-surround').setup{
    keymaps = {
        insert = '<C-g>s',
        insert_line = '<C-g>S',
        normal = 'fs',
        no_cur_line = 'fSS',
        visual = 'S',
        visual_line = 'gS',
        delete = 'ds',
        change = 'cs',
        change_line = 'cS',
    },
}

-- require('todo-comments').setup()

require('alternate-toggler').setup{
    alternates = {
        ['=='] = '!=',
    }
}

vim.keymap.set('n', '<Bslash>tt', '<cmd>ToggleAlternate<CR>')


require('refactoring').setup({
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
    show_success_message = false, -- shows a message with information about the refactor on success
                                  -- i.e. [Refactor] Inlined 3 variable occurrences
})
