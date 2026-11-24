return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✔",
                        package_pending = "≫",
                        package_uninstalled = "✖",
                    },
                    border = "rounded",
                },
            })

            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "if_many",
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode, extra_opts)
                        mode = mode or "n"
                        local opts = { buffer = event.buf, desc = "LSP: " .. desc }
                        if extra_opts then
                            opts = vim.tbl_extend("force", opts, extra_opts)
                        end
                        vim.keymap.set(mode, keys, func, opts)
                    end

                    map("gd", vim.lsp.buf.definition, "Go to Definition")
                    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
                    map("gi", vim.lsp.buf.implementation, "Go to Implementation")
                    map("gr", vim.lsp.buf.references, "Go to References")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<leader>rn", function()
                        return ":IncRename " .. vim.fn.expand("<cword>")
                    end, "Rename Symbol (Live)", "n", { expr = true })
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "v" })

                    map("<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
                    map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
                end,
            })

            local capabilities = require("blink.cmp").get_lsp_capabilities()
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "pyright",
                    "neocmake",
                    "rust_analyzer",
                    "autotools_ls",
                    "texlab",
                    "bashls",
                    "lua_ls",
                },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    ["clangd"] = function()
                        lspconfig.clangd.setup({
                            capabilities = capabilities,
                            cmd = {
                                "clangd",
                                "--background-index",
                                "--clang-tidy",
                                "--header-insertion=iwyu",
                                "--completion-style=detailed",
                                "--function-arg-placeholders",
                                "--fallback-style=llvm",
                            },
                            filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                            init_options = {
                                usePlaceholders = true,
                                completeUnimported = true,
                                clangdFileStatus = true,
                            },
                        })
                    end,

                    ["pyright"] = function()
                        lspconfig.pyright.setup({
                            capabilities = capabilities,
                            settings = {
                                python = {
                                    analysis = {
                                        autoSearchPaths = true,
                                        useLibraryCodeForTypes = true,
                                        diagnosticMode = "openFilesOnly",
                                        typeCheckingMode = "basic",
                                    },
                                },
                            },
                        })
                    end,

                    ["rust_analyzer"] = function()
                        lspconfig.rust_analyzer.setup({
                            capabilities = capabilities,
                            settings = {
                                ["rust-analyzer"] = {
                                    cargo = {
                                        allFeatures = true,
                                    },
                                    checkOnSave = {
                                        command = "clippy",
                                    },
                                },
                            },
                        })
                    end,

                    ["texlab"] = function()
                        lspconfig.texlab.setup({
                            capabilities = capabilities,
                            settings = {
                                texlab = {
                                    build = {
                                        onSave = false,
                                    },
                                    forwardSearch = {
                                        executable = "",
                                    },
                                    chktex = {
                                        onOpenAndSave = true,
                                        onEdit = false,
                                    },
                                    diagnosticsDelay = 300,
                                    bibtexFormatter = "texlab",
                                    latexFormatter = "latexindent",
                                },
                            },
                        })
                    end,

                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                    workspace = {
                                        checkThirdParty = false,
                                        library = {
                                            vim.env.VIMRUNTIME,
                                        },
                                    },
                                    telemetry = { enable = false },
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
}
