#             _
#    ____ ___| |__  _ __ ___
#   |_  // __| '_ \| '__/ __|
#    / /_\__ \ | | | | | (__
#   /____|___/_| |_|_|  \___|
#
########## zsh settings ########################################################

# history settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY       # write the history file in the ':start:elapsed;command' format
setopt SHARE_HISTORY          # share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST # expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS       # do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS   # delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS      # do not display a previously found event
setopt HIST_SAVE_NO_DUPS      # do not write a duplicate event to the history file

# navigation
setopt AUTO_CD              # cd by typing directory name if not a command
setopt AUTO_PUSHD           # make cd push the old directory onto the directory stack
setopt PUSHD_IGNORE_DUPS    # dont push multiple copies of the same directory

# init completion system
autoload -Uz compinit
zstyle ':completion:*' menu select # interactive menu for completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # coloured completions matches
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
fpath=("${HOME}/.local/share/zsh-completions" $fpath)

if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

########## paaaaath ############################################################

export PATH="$PATH:$HOME/.scripts"

export PATH="/usr/local/opt/icu4c/1bin:/usr/local/opt/icu4c/sbin:$PATH"

export MPICC=$(which mpicc)

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#
########## aliases #############################################################

alias nv='nvim'
alias vi='nvim'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l='gls --color -lh --group-directories-first'
alias ll='l'
alias la='l -a'

alias cpr='cp -r'

alias scp='noglob scp'

alias dotfs='/usr/bin/git --git-dir=$HOME/.dotfs/ --work-tree=$HOME'

if [ -d "/Applications/Media/IINA.app/Contents/MacOS" ]; then
    alias iina-cli='/Applications/Media/IINA.app/Contents/MacOS/iina-cli'
fi


alias ffmpreg='ffmpeg'

########## functions ###########################################################

n () {
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    \nnn -adeCEU "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# export NNN_OPENER="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins/nuke"
export NNN_LOCKER=snowmachine
export NNN_USE_EDITOR=1
#export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui;z:autojump'

y () {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

cowcat () {
    if [ -x /usr/local/bin/cowsay -a -x /usr/local/bin/fortune -a -x /usr/local/bin/lolcat ]; then
        fortune -a | cowsay | lolcat -t
        echo
    fi
}

################################################################################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/shashwat/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/shashwat/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/shashwat/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/shashwat/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

################################################################################

[[ -f "${ZSH}/psnl.zsh" ]] && source "${ZSH}/psnl.zsh"

# export NVM_DIR="$HOME/.config/nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ -f "${ZSH}/custom/config/iterm2_shell_integration.zsh" ]] && source "${ZSH}/custom/config/iterm2_shell_integration.zsh"

eval "$(starship init zsh)"

export _ZO_ECHO=0
eval "$(zoxide init zsh)"

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

################################################################################

