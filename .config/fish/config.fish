# Base
# ###############################################################################
set -gx EDITOR vim
set -gx VISUAL nvim

# Hybrid key bindings
set -g fish_key_bindings fish_hybrid_key_bindings

bind \cf forward-word
bind -M default \cf forward-word
bind -M insert \cf forward-word


# Tools
# ###############################################################################
set -gx PATH $PATH /usr/local/bin

# Homebrew
/opt/homebrew/bin/brew shellenv | source
set -gx HOMEBREW_NO_ENV_HINTS 1

# https://github.com/junegunn/fzf
fzf --fish | source

# https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# vim/neovim
set -gx MANPAGER "vim -M +MANPAGER -"


# My Garbage
set -gx PATH $PATH /Users/andreslowrie/Bin

# Interactive
###############################################################################
if status is-interactive
    # Commands to run in interactive sessions can go here
end
