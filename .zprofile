# ~/.zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"

########## environment #########################################################

export EDITOR="/opt/homebrew/bin/nvim"
export VISUAL="/opt/homebrew/bin/nvim"
export TERMINAL="iterm"
export TERM="xterm-256color" # (Optional: iTerm usually handles this, but safe to keep)
export ZSH="$HOME/.config/zsh"

########## paaaaath ############################################################

path_prepend="$HOME/.local/bin:$(brew --prefix python)/libexec/bin:$HOME/.cargo/bin"
export PATH="$path_prepend:$PATH"

if [ -d "/usr/local/opt/ruby/bin" ]; then
    export PATH="/usr/local/opt/ruby/bin:$PATH"
    export PATH="`gem environment gemdir`/bin:$PATH"
fi

[ -d "/Applications/Media/calibre.app/Contents/MacOS" ] && export PATH="/Applications/Media/calibre.app/Contents/MacOS:$PATH"
[ -d "/Applications/Media/SuperCollider.app/Contents/MacOS" ] && export PATH="/Applications/Media/SuperCollider.app/Contents/MacOS:$PATH"

########## nnn #################################################################

# export NNN_OPENER="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins/nuke"
export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
export NNN_LOCKER=snowmachine
export NNN_USE_EDITOR=1
# export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui;z:autojump'

################################################################################
