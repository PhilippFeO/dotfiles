-- Hintergrund transparent
-- Standard-Farbschema definieren
--require('rose-pine').setup({
--    disable_background = true
--})

function SetColorscheme(color) 
	-- Standard-Farbschema definieren
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	-- Hintergrund transparent ("Float" sind Fenster wie der Autovervollständigung)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#111111" })
end

SetColorscheme()
