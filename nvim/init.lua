-- This file contains "general init.lua" settings, common for all "init*.lua" files
require("general-init-stump")

require("keymappings")
require("set-options")
require("autocommands")
require("execute-on-save")

-- Since "vimtex" and "treesitter" do not work well together in terms of concealing,
-- I decided to set up a specific "init-latex.lua" file, used when working with LaTeX
-- or tex-files. The only difference to this file, that it excludes "treesitter" and
-- uses "vimtex" instead, but everything else should remain unchanged and these general
-- settings are moved into the "general-init-stump.lua" file. For more information,
-- see "init-latex.lua".
