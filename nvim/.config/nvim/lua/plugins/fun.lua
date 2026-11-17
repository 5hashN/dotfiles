return {
	{
		"5hashN/flock.nvim",
		opts = {
			num_boids = 40,
			timer_interval = 50,
			visual_char = ">",
		},
	},
	{
		"Eandrju/cellular-automaton.nvim",
		config = function()
			vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
			vim.keymap.set("n", "<leader>fmll", "<cmd>CellularAutomaton game_of_life<CR>")
			vim.keymap.set("n", "<leader>fmls", "<cmd>CellularAutomaton scramble<CR>")
		end,
	},
}
