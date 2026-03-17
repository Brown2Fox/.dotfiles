function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold brcyan
      echo '[NORMAL] '
    case insert
      set_color --bold brgreen
      echo '[INSERT] '
    case replace_one
      set_color --bold green
      echo '[REPLACE] '
    case replace
      set_color --bold bryellow
      echo '[REPLACE] '
    case visual
      set_color --bold brmagenta
      echo '[VISUAL] '
    case operator f F t T
      set_color --bold cyan
      echo '[OPERATOR] '
    case '*'
      set_color --bold red
      echo '[UNKNOWN] '
  end
  set_color normal
end
