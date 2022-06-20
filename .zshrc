# path
export PATH="$PATH:/home/pacer/.local/bin"

# colors
autoload -U colors && colors
#source ~/.cache/wal/colors-tty.sh

# prompt
PS1="%B%{$fg[red]%} π %{$reset_color%}>%b "

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zhistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# autocomplete
autoload -Uz compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
compinit
_comp_options+=(globdots)
CASE_SENSITIVE="true"
__git_files () {
    _wanted files expl 'local files' _files
}

# alias
[ -f "$HOME/.config/scripts/aliasrc" ] && source "$HOME/.config/scripts/aliasrc"

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
