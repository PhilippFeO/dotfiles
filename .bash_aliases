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
# moving files
alias mvf='mv `fzf` `fzf`'

# ┌────────────────────────┐
# │ Virtualenvs for Python │
# └────────────────────────┘
alias eo='cd ~/programmieren/python/earth-observation/satellite_imagery/; source ~/.venv/eo/bin/activate'
alias rs='cd ~/programmieren/recipe-selector/; source ~/.venv/recipe-selector/bin/activate'

# ┌───────────────┐
# │ File browsing │
# └───────────────┘
alias ..='cd ..'
alias lk='ls -AFl --group-directories-first'

# ┌───────────┐
# │ TryHackMe │
# └───────────┘
alias tryhackme='sudo openvpn ~/Dokumente/TryHackMe.ovpn'
alias thm-firefox='firefox -P TryHackMe https://tryhackme.com/login &' # Starte Firefox mit dem TryHackMe-Profil, bei dem NoScript deaktiviert und uBlock-Origin passend eingestellt ist (gegenwärtig sehe ich in NoScript keine Möglichkeit Ausnahmen in NoScripts für Tabs zu speichern und ich möchte die Seiten nicht allgemein erlauben, bzw. nur im TryHackMe-Profil, das ich ausschließlich für TryHackMe nutze)

# ┌─────────┐
# │ Weather │
# └─────────┘
alias wetter='curl v2d.wttr.in/Augsburg | less -Ru' # v2d uses Nerd font, not Emoji font (v2)
alias wetter-einfach='curl wttr.in/Augsburg'

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
alias sbashal='source ~/.bash_aliases'
alias bashal='nvim ~/.bash_aliases && sbashal'
alias c='xclip -selection clipboard'
alias charge-full='conservation-mode-off'
alias conservation-mode-off='echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
alias conservation-mode-on='echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode'
alias karte='telnet mapscii.me'
alias map='telnet mapscii.me'
alias op='okular *.pdf'
alias py='python3'
alias python='python3'
alias rewe='firefox --profile ~/.mozilla/firefox/5mud7ety.Rewe/'
alias tmp='cd /tmp'
alias baum="ls -R | grep ":$" | perl -pe 's/:$//;s/[^-][^\/]*\//    /g;s/^    (\S)/└── \1/;s/(^    |    (?= ))/│   /g;s/    (\S)/└── \1/'"
alias wiki='cd ~/wiki/'
alias zug='date "+%d.%m.%Y %H:%M" >> zugarbeitszeiten.txt'

