function SetColorscheme(color)
	-- Standard-Farbschema definieren

	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	-- Hintergrund transparent ("Float" sind Fenster wie bei der Autovervollständigung)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#ee1111" })
end

SetColorscheme()
