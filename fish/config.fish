source /usr/share/cachyos-fish-config/cachyos-config.fish

set -g fish_prompt_pwd_dir_length 0
set -g fish_key_bindings fish_vi_key_bindings

set FZF_DEFAULT_OPTS "--layout=reverse --border=bold --border=rounded --margin=3% --color=dark"

set EDITOR "nvim"
set VISUAL "neovide"

alias cls "clear"
alias nvide "neovide"

# Fzf integration:
fzf --fish | source
