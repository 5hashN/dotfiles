return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		init = function()
			local query = vim.treesitter.query
			local wrap_handler = function(handler)
				return function(match, pattern, source, pred, metadata)
					local proxy = setmetatable({}, {
						__index = function(_, k)
							local node = match[k]
							if type(node) == "table" and not node.range then
								return node[1]
							end
							return node
						end,
						__newindex = match,
					})
					return handler(proxy, pattern, source, pred, metadata)
				end
			end

			local orig_add_directive = query.add_directive
			query.add_directive = function(name, handler, opts)
				return orig_add_directive(name, wrap_handler(handler), opts)
			end

			local orig_add_predicate = query.add_predicate
			query.add_predicate = function(name, handler, opts)
				return orig_add_predicate(name, wrap_handler(handler), opts)
			end
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "cpp", "python", "bash", "lua", "rust", "make", "cmake", "markdown", "markdown_inline", "vim", "vimdoc", "query" },
				sync_install = false,
				auto_install = true,
				ignore_install = { "latex" },
				highlight = {
					enable = true,
					disable = function(lang, buf)
						if lang == "latex" then
							return true
						end
						local max_filesize = 100 * 1024 -- 100 KB
						local uv = vim.uv or vim.loop
						local ok, stats = pcall(uv.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
					disable = { "latex" },
				},
				matchup = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "BufReadPost",
		opts = {
			max_lines = 4,
			trim_scope = "outer",
			mode = "cursor",
		},
		keys = {
			{
				"[c",
				function()
					require("treesitter-context").go_to_context(vim.v.count1)
				end,
				desc = "Jump to parent context",
			},
		},
	},
}
