return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
            "micangl/cmp-vimtex",
            "honza/vim-snippets",
            "kdheepak/cmp-latex-symbols",
            "nat-418/cmp-color-names.nvim",
            "onsails/lspkind-nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
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
                        return kind
                    end
                },
            })

            cmp.setup.filetype('tex', {
                sources = {
                    { name = 'omni' },
                    { name = 'ultisnips' },
                    { name = 'buffer', keyword_length = 2 },
                    { name = 'path' },
                },
            })

            cmp.setup.filetype('python', {
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
        end
    }
}
