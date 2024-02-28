


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
alias karte='telnet mapscii.me'
alias map='telnet mapscii.me'
alias n='vim'
alias op='okular *.pdf'
alias py='python3'
alias python='python3'
alias rewe='firefox --profile ~/.mozilla/firefox/5mud7ety.Rewe/'
alias tmp='cd /tmp'
alias baum="ls -R | grep ":$" | perl -pe 's/:$//;s/[^-][^\/]*\//    /g;s/^    (\S)/└── \1/;s/(^    |    (?= ))/│   /g;s/    (\S)/└── \1/'"
alias wiki='cd ~/wiki/'
alias zug='date "+%d.%m.%Y %H:%M" >> zugarbeitszeiten.txt'

