require('mason').setup({
    ui = {
        icons = {
            package_installed = '✔',
            package_pending = '≫',
            package_uninstalled = '✖'
        },
        border = 'rounded',
    }
})

require('mason-lspconfig').setup()

-- require('blink').setup({
--     build = 'cargo build --release', -- for delimiters
--     keys = {
--         -- chartoggle
--         {
--           '<C-;>',
--           function()
--             require('blink.chartoggle').toggle_char_eol(';')
--           end,
--           mode = { 'n', 'v' },
--           desc = 'Toggle ; at eol',
--         },
--         {
--           ',',
--           function()
--             require('blink.chartoggle').toggle_char_eol(',')
--           end,
--           mode = { 'n', 'v' },
--           desc = 'Toggle , at eol',
--         },
--
--         -- tree
--         { '<C-e>', '<cmd>BlinkTree reveal<cr>', desc = 'Reveal current file in tree' },
--         { '<leader>E', '<cmd>BlinkTree toggle<cr>', desc = 'Reveal current file in tree' },
--         { '<leader>e', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
--     },
--     -- all modules handle lazy loading internally
--     lazy = false,
--     opts = {
--       chartoggle = { enabled = true },
--       tree = { enabled = true }
--     }
-- })

require('cmp-color-names').setup()

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['UltiSnips#Anon'](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<down>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<up>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Esc>'] = cmp.mapping.close(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'omni', keyword_length = 2 },
        { name = 'path' },
        { name = 'calc' },
        { name = 'emoji', insert = true },
    },
    completion = { keyword_length = 1, completeopt = 'menu, noselect', },
    view = { entries = 'custom', },
    window = {
		completion = { border = 'rounded' },
		documentation = { border = 'rounded' },

        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
        col_offset = -3,
        side_padding = 0,
	},
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },

        format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format({
                mode = 'symbol_text',
                maxwidth = 50,
                ellipsis_char = '...',
                menu = ({
	                nvim_lsp = ' [LSP]',
                    ultisnips = ' [US]',
                    buffer = ' [Buffer]',
                    nvim_lua = ' [Lua]',
                    path = ' [Path]',
                    latex_symbols = ' [Tex]',
                    emoji = ' [Emoji]',
                    calc = ' [Calc]',
                    omni = ' [Omni]',
                    color_names = ' [Color]',
                }),
            })(entry, vim_item)

            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            kind.kind = '' .. (strings[1] or '') .. ' '
            -- kind.menu = '  [' .. (strings[2] or '') .. ']'
            return kind
        end

    },
})

cmp.setup.filetype( 'tex', {
    sources = {
        { name = 'omni' },
        { name = 'ultisnips' }, -- For ultisnips user.
        { name = 'buffer', keyword_length = 2 }, -- for buffer word completion
        { name = 'path' }, -- for path completion
    },
})

cmp.setup.filetype( 'python', {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'omni', keyword_length = 2 },
        { name = 'path' },
        { name = 'calc' },
        { name = 'color_names', keyword_length = 3 },
    },
})

vim.g.UltiSnipsNoPythonWarning = 1

