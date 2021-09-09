#
#   █▀▀█ █▀▀█ █▀▀ █▀▀ █▀▀█ █ █▀▀ 　 █▀▀ █▀▀█ █▀▀▄ █▀▀ ░▀░ █▀▀▀
#   █░░█ █▄▄█ █░░ █▀▀ █▄▄▀ ░ ▀▀█ 　 █░░ █░░█ █░░█ █▀▀ ▀█▀ █░▀█
#   █▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ ▀░▀▀ ░ ▀▀▀ 　 ▀▀▀ ▀▀▀▀ ▀░░▀ ▀░░ ▀▀▀ ▀▀▀▀
#

# path
export PATH="$PATH:/home/pacer/.local/bin"

# colors
autoload -U colors && colors
source ~/.cache/wal/colors-tty.sh

# prompt
PS1="%B%{$fg[red]%} %~ %{$reset_color%}>%b "

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# autocomplete
autoload -Uz compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
compinit
_comp_options+=(globdots)

# alias
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

echo "█▀▀█ █▀▀█ █▀▀ █▀▀ █▀▀█   █▀▀█ █▀▀█ █▀▀ █░░█ █░░ ░▀░ █▀▀▄ █░░█ █░█
█░░█ █▄▄█ █░░ █▀▀ █▄▄▀ @ █▄▄█ █▄▄▀ █░░ █▀▀█ █░░ ▀█▀ █░░█ █░░█ ▄▀▄
█▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ ▀░▀▀   ▀░░▀ ▀░▀▀ ▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ ▀░░▀ ░▀▀▀ ▀░▀
" | lolcat
