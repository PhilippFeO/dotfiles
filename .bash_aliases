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
alias rs='cd ~/programmieren/grocery-shopper/'
alias dt='cd ~/programmieren/django-test/ && cd lorem_project/'

# ┌───────────────┐
# │ File browsing │
# └───────────────┘
alias ..='cd ..'
alias lk='ls -AFl --group-directories-first'
alias lkl='lk -L'

# ┌─────────┐
# │ Weather │
# └─────────┘
alias wetter='curl v2d.wttr.in/Augsburg | less -Ru' # v2d uses Nerd font, not Emoji font (v2)
alias wetter-einfach='curl wttr.in/Augsburg'


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
alias bdt='date "+%d.%m.%Y %H:%M"' # [b]etter [d]ate [t]ime
alias er='cd ~/programmieren/grocery-shopper/; find recipes/ misc/ -name "*.yaml" | n `fzf`; cd - > /dev/null' # er = edit recipe
alias jctl='journalctl --user -u'
alias karte='telnet mapscii.me'
alias map='telnet mapscii.me'
alias n='nvim'
alias op='okular *.pdf'
alias py='python3'
alias python='python3'
alias rewe='firefox --profile ~/.mozilla/firefox/5mud7ety.Rewe/ shop.rewe.de'
alias rgqf='rg --vimgrep'
alias tmp='cd /tmp'
alias baum="ls -R | grep ":$" | perl -pe 's/:$//;s/[^-][^\/]*\//    /g;s/^    (\S)/└── \1/;s/(^    |    (?= ))/│   /g;s/    (\S)/└── \1/'"
alias wiki='cd ~/wiki/'
alias zug='date "+%d.%m.%Y %H:%M" >> zugarbeitszeiten.txt'

