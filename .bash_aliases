# "sudo apt remove" entfernt nicht die Konfigurationsdateien unter "/etc".
# Das kann mit dem unten stehenden Befehl nachgeholt werden.
	# https://wiki.ubuntuusers.de/Paketverwaltung/Tipps/#Konfigurationsdateien-von-deinstallierten-Paketen-entfernen
# alias config-clear='dpkg -l | grep "^rc " | cut -d" " -f3 | xargs dpkg --purge'

# ┌────────────┐
# │ fzf-Aliase │
# └────────────┘
# Vorschau aktivieren (Blättern funktioniert irgenwie nicht, "man fzf > --bind" ist sehr ausführlich)
alias pf='fzf --preview="nvim {}"' # --bind alt-up:preview-page-up,alt-down:preview-page-down'
#export FZF_DEFAULT_COMMAND='find * -path "*/\.*" -prune -o -type f -print -o -type l -print 2> /dev/null'
alias of='okular `fzf`'
alias mvf='mv `fzf` `fzf`'

# ┌────────────┐
# │ git-Aliase │
# └────────────┘
alias ga='git add' # For single files
alias gac='gaa && gc' # Es gibt auch "git commit [-a|--all]" aber dann muss man die Commit-Nachricht umständlicher eingeben
# Add deleted files to Commit
alias gad="git status | grep gelöscht | sed 's/gelöscht:\s*//' | tr '\n' ' ' | xargs git add"
alias gaf='git add `fzf`'
alias gap='git add --patch'
alias gapf='git add --patch `fzf`'
alias gb='git branch -vv' # -vv displays also upstream branches
alias gc='git commit -m'
alias gca='git commit --amend --no-edit'
alias gd='git diff'
alias gl='git log -10 --oneline --graph'
alias gll='git log --graph' #--oneline --decorate'
alias glla='gll --all'
alias grs='git restore --staged' # git [unstage|us]
alias gs='git status'
alias gpull='git pull origin master' # git pullom
alias gpushm='git push origin master' # git pushom
# Specify Branch
alias gpush='git push origin'
alias gpushfwl='git push origin --force-with-lease'

# ┌───────────────┐
# │ Neovim-Aliase │
# └───────────────┘
alias n='nvim'
# Change into ~/dotfiles/nvim
alias nc='cd ~/dotfiles/nvim'
alias ncf='nc; nf'
# Open Neovim with fzf
alias nf='n `fzf`'
# Open Neovim help page directly from terminal
alias nh='~/programmieren/skripte/nvim-help.sh'
# Edit <init.lua>
alias ni='cd ~/dotfiles/nvim/ && n init.lua'
alias lazy='cd ~/.local/share/nvim/lazy/'
alias np='cd ~/dotfiles/nvim/projects'
# Open *.tex files
alias nt='n *.tex'
# Nutze LaTeX-Konfiguration
#alias nviml='if [ ! -f .latexmkrc ]; then lnlatexmkrc; else echo "File ~/LaTeX/.latexmkrc already present (physically or as link)."; fi && nvim -u ~/dotfiles/nvim/init-latex.lua'
# When using Neovim outside
alias no='nvim "+colorscheme kanagawa-lotus"'
alias nof='no `fzf`'

# ┌────────────────────────┐
# │ Virtualenvs for Python │
# └────────────────────────┘
alias main-venv='source ~/.venv/main_env/bin/activate'
alias dl-venv='source ~/.venv/deep-learning/bin/activate'
alias eo='cd ~/programmieren/python/earth-observation/satellite_imagery/; source ~/.venv/eo/bin/activate'

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
alias wetter='curl v2d.wttr.in/Erlangen | less -Ru' # v2d uses Nerd font, not Emoji font (v2)
alias wetter-einfach='curl wttr.in/Erlangen'

# ┌───────┐
# │ LaTeX │
# └───────┘
alias lnlatexmkrc='ln ~/latex/.latexmkrc $(pwd)'
alias latex-compile='~/latex/compile.sh'

# ┌──────┐
# │ Misc │
# └──────┘
# "Conservation Mode" dh. Aufladung bis 60% einschalten oder ausschalten
# copy into general clipboard, f.i. content fo files as <c FILE>
alias bashal='nvim ~/.bash_aliases'
alias c='xclip -selection clipboard'
alias cdkit='cd ~/.config/kitty/'
alias charge-full='conservation-mode-off'
alias conservation-mode-off='echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
alias conservation-mode-on='echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
alias karte='telnet mapscii.me'
alias map='telnet mapscii.me'
alias op='okular *.pdf'
alias py='python3'
alias sbashal='source ~/.bash_aliases'
alias tmp='cd /tmp'
alias baum="ls -R | grep ":$" | perl -pe 's/:$//;s/[^-][^\/]*\//    /g;s/^    (\S)/└── \1/;s/(^    |    (?= ))/│   /g;s/    (\S)/└── \1/'"
alias wiki='cd ~/wiki/'
alias python='python3'
