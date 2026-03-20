source /usr/share/cachyos-fish-config/cachyos-config.fish

fish_config theme choose "Rosé Pine Moon Auto"

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
alias vv "NVIM_APPNAME=nvim-simp nvim"


function fish_user_key_bindings
  # bind yy fish_clipboard_copy
  bind y fish_clipboard_copy
  bind p fish_clipboard_paste
  bind -s --preset -M visual -m default y "fish_clipboard_copy; commandline -f end-selection repaint-mode"
  bind \$ 'commandline -f end-of-line repaint-mode'
end

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

