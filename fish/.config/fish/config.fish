source /usr/share/cachyos-fish-config/cachyos-config.fish

source ~/.config/fish/themes/tokyonight_night.fish

set -g fish_prompt_pwd_dir_length 0
set -g fish_key_bindings fish_vi_key_bindings

set FZF_DEFAULT_OPTS "--layout=reverse --border=bold --border=rounded --margin=3% --color=dark"

set -gx EDITOR "nvim"
set -gx SUDO_EDITOR "nvim"
set -gx VISUAL "nvim"

set -g fish_tmux_autostart false
set -g fish_tmux_autoquit false
set -gx fish_tmux_default_session_name "default"

alias cls "clear"
alias nvide "neovide"

# Fzf integration:
fzf --fish | source

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

