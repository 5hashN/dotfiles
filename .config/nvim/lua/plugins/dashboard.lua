local dashboard = require('alpha.themes.dashboard')

local iscii, logo_a = pcall(require, 'plugins.ascii')

if not iscii then
    local logo = [[
   ____  ___  ____ _   __ _ ___ ___
  / __ \/ _ \/ __ \ | / / / __ `__ \
 / / / /  __/ /_/ / |/ / / / / / / /
/_/ /_/\___/\____/|___/_/_/ /_/ /_/
]]
    dashboard.section.header.val = vim.split(logo, '\n')
else
    dashboard.section.header.val = vim.split(logo_a, '\n')
end

dashboard.section.buttons.val = {
	dashboard.button('f',  '    Find file',         ':Telescope find_files <CR>'),
	dashboard.button('r',  '    Recent files',      ':Telescope oldfiles <CR>'),
	dashboard.button('g',  '    Find text',         ':Telescope live_grep <CR>'),
	dashboard.button('s',  '    Restore Session',   [[:lua require('persistence').load() <cr>]]),
	dashboard.button('l',  '    Lazy',              ':Lazy<CR>'),
	dashboard.button('q',  '    Quit',              ':qa<CR>'),
}
dashboard.section.header.opts.hl = 'AlphaHeader'
dashboard.opts.layout[1].val = 6

require('alpha').setup(dashboard.opts)

vim.api.nvim_create_autocmd('User', {
	callback = function()
		local stats = require('lazy').stats()
		local ms = math.floor(stats.startuptime * 100) / 100
		dashboard.section.footer.val = 'Lazy-loaded '
			.. stats.loaded
			.. '/'
			.. stats.count
			.. ' plugins in '
			.. ms
			.. 'ms'
		pcall(vim.cmd.AlphaRedraw)
	end,
})

