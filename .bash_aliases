# "sudo apt remove" entfernt nicht die Konfigurationsdateien unter "/etc".
# Das kann mit dem unten stehenden Befehl nachgeholt werden.
	# https://wiki.ubuntuusers.de/Paketverwaltung/Tipps/#Konfigurationsdateien-von-deinstallierten-Paketen-entfernen
# alias config-clear='dpkg -l | grep "^rc " | cut -d" " -f3 | xargs dpkg --purge'


# ┌────────────┐
# │ fzf-Aliase │
# └────────────┘
# Vorschau aktivieren (Blättern funktioniert irgenwie nicht, "man fzf >  --bind" ist sehr ausführlich)
alias pf='fzf --preview="nvim {}"' # --bind alt-up:preview-page-up,alt-down:preview-page-down'
#export FZF_DEFAULT_COMMAND='find * -path "*/\.*" -prune -o -type f -print -o -type l -print 2> /dev/null'

# ┌────────────┐
# │ git-Aliase │
# └────────────┘
alias ga='git add' # For single files
alias gaa='git add .' # Git Add All
alias gc='git commit -m'
alias gac='gaa && gc' # Es gibt auch "git commit [-a|--all]" aber dann muss man die Commit-Nachricht umständlicher eingeben
alias gs='git status'
alias gpull='git pull origin master'
alias gpush='git push origin master'

# ┌───────────────┐
# │ Neovim-Aliase │
# └───────────────┘
alias n='nvim'
# Open Neovim with fzf
alias nvimf='nvim `fzf`'
alias nf='nvimf'
# Nutze LaTeX-Konfiguration
alias nviml='nvim -u ~/.config/nvim/init-latex.lua'
# Open Neovim help page directly from terminal
alias nvimh='~/programmieren/skripte/nvim-help.sh'
alias nh='nvimh'
# Wechsel in ~/.config/nvim
alias nconf='cd ~/.config/nvim'
# <init.lua> bearbeiten
alias ngen='nconf && nvim lua/general-init-stump.lua'

# ┌────────────────────────┐
# │ Virtualenvs for Python │
# └────────────────────────┘
#alias venvMA='source ~/.virtualenvs/masterarbeit/bin/activate'
#alias venvFAUST='source ~/.virtualenvs/FAUST/bin/activate'
alias main-venv='source ~/.virtualenvs/main_env/bin/activate'
alias sel-venv='source ~/.virtualenvs/selenium-venv/bin/activate'
alias test-venv='source ~/.virtualenvs/test/bin/activate'

# ┌───────────────┐
# │ File browsing │
# └───────────────┘
alias ..='cd ..'
alias lk='ls -AFl --group-directories-first'
alias aus='cd ~/.ausprobieren'
alias auto-email='cd ~/programmieren/python/email-automatisierung'
alias skripte='cd ~/programmieren/skripte'

# ┌───────────┐
# │ TryHackMe │
# └───────────┘
alias tryhackme='sudo openvpn ~/Dokumente/TryHackMe.ovpn'
alias thm-firefox='firefox -P TryHackMe https://tryhackme.com/login &' # Starte Firefox mit dem TryHackMe-Profil, bei dem NoScript deaktiviert und uBlock-Origin passend eingestellt ist (gegenwärtig sehe ich in NoScript keine Möglichkeit Ausnahmen in NoScripts für Tabs zu speichern und ich möchte die Seiten nicht allgemein erlauben, bzw. nur im TryHackMe-Profil, das ich ausschließlich für TryHackMe nutze)

# ┌─────────┐
# │ Weather │
# └─────────┘
alias wetter='curl v2.wttr.in/Erlangen'
alias wetter-einfach='curl wttr.in/Erlangen'


# ┌───────┐
# │ LaTeX │
# └───────┘
alias lnlatexmkrc='ln -s ~/LaTeX/.latexmkrc $(pwd)'
alias latex-compile='~/LaTeX/compile.sh'


# ┌──────┐
# │ Misc │
# └──────┘
alias bashal='nvim ~/.bash_aliases'
alias sbashal='source ~/.bash_aliases'
alias zimwiki='cd ~/zim_wiki/ && git add ~/zim_wiki && git commit -m "Einträge hinzugefügt" && git push && cd ~'
# copy into general clipboard, f.i. content fo files as <c FILE>
alias c='xclip -selection clipboard'

# "Conservation Mode" dh. Aufladung bis 60% einschalten oder ausschalten
alias conservation-mode-off='echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
alias charge-full='conservation-mode-off'
alias conservation-mode-on='echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
