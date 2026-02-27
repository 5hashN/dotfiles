local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    { "nvim-lualine/lualine.nvim" },
    -- { "akinsho/bufferline.nvim", enabled = false, version = "*",
    --     dependencies = { "nvim-tree/nvim-web-devicons" }, },

    { "nvim-tree/nvim-tree.lua", },

    { "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }, },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    { "lervag/vimtex", lazy = false },
    -- { "KeitaNakamura/tex-conceal.vim" },

    { "sudormrfbin/cheatsheet.nvim",
        dependencies = { "nvim-telescope/telescope.nvim",
                         "nvim-lua/popup.nvim",
                         "nvim-lua/plenary.nvim",
        },
    },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    { "numToStr/Comment.nvim" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
    { "kylechui/nvim-surround", version = "*", event = "VeryLazy" },

    { "lewis6991/gitsigns.nvim" },

    { "hrsh7th/nvim-cmp",
        dependencies = { "neovim/nvim-lspconfig",
                         "hrsh7th/cmp-nvim-lsp",
                         "hrsh7th/cmp-buffer",
                         "hrsh7th/cmp-path",
                         "hrsh7th/cmp-cmdline",
                         "hrsh7th/cmp-calc",
                         "hrsh7th/cmp-omni",
                         "hrsh7th/cmp-emoji",
                         "hrsh7th/cmp-nvim-lsp-signature-help",
                         "hrsh7th/cmp-nvim-lua",
                         -- "SirVer/ultisnips",
                         -- "quangnguyen30192/cmp-nvim-ultisnips",
                         "micangl/cmp-vimtex",
                         "honza/vim-snippets",
                         "kdheepak/cmp-latex-symbols",
                         "nat-418/cmp-color-names.nvim",
                        }, },

    -- { "saghen/blink.nvim", version = "*",
    --     dependencies = { "neovim/nvim-lspconfig",
    --                      "L3MON4D3/LuaSnip",
    --     },
    -- },

    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "onsails/lspkind-nvim" },

    { "ThePrimeagen/harpoon" },
    -- { "ThePrimeagen/refactoring.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim",
    --                      -- "nvim-treesitter/nvim-treesitter",
    --                     }, },

    { "NvChad/nvim-colorizer.lua" },

    { "stevearc/dressing.nvim" },

    { "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end },

    { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    -- { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
    -- { "folke/zen-mode.nvim" }, { "folke/twilight.nvim" },

    { "rmagatti/alternate-toggler", event = "BufReadPost" },
    { "vim-scripts/LargeFile" },

    -- { "alex-popov-tech/store.nvim" , dependencies = { "OXY2DEV/markview.nvim" }, cmd = "Store" },

    { "5hashN/flock.nvim",
        opts = {
            num_boids = 40,
            timer_interval = 50,
            visual_char = ">",
        }
    },

    -- { "Eandrju/cellular-automaton.nvim", enabled = true },

    -- { "davidgranstrom/scnvim", ft = { "supercollider" }, },
    -- { "davidgranstrom/telescope-scdoc.nvim", ft = { "supercollider" }, },
    -- { "madskjeldgaard/nvim-supercollider-piano", ft = { "supercollider" }, },

    -- { "chipsenkbeil/distant.nvim", branch = "v0.3" },

}

require("lazy").setup(plugins, {
    ui = { border = "rounded", }
})

