function fish_prompt
        # This prompt shows:
        # - green lines if the last return command is OK, red otherwise
        # - your user name, in red if root or yellow otherwise
        # - your hostname, in cyan if ssh or blue otherwise
        # - the current path (with prompt_pwd)
        # - date +%X
        # - the current virtual environment, if any
        # - the current git status, if any, with fish_git_prompt
        # - the current battery state, if any, and if your power cable is unplugged, and if you have "acpi"
        # - current background jobs, if any
    
        # It goes from:
        # ┬─[nim@Hattori:~]─[11:39:00]
        # ╰─>$ echo here
    
        # To:
        # ┬─[nim@Hattori:~/w/dashboard]─[11:37:14]─[V:django20]─[G:master↑1|●1✚1…1]─[B:85%, 05:41:42 remaining]
        # │ 2    15054    0%    arrêtée    sleep 100000
        # │ 1    15048    0%    arrêtée    sleep 100000
        # ╰─>$ echo there
    
        set -l retc red
        test $status = 0; and set retc green
    
        set -q __fish_git_prompt_showupstream
        or set -g __fish_git_prompt_showupstream auto
    
        function _nim_prompt_wrapper
                set retc $argv[1]
                set -l field_name $argv[2]
                set -l field_value $argv[3]
        
                set_color normal
                set_color $retc
                echo -n ' '
                set_color -o normal
                echo -n '['
                set_color normal
                test -n $field_name
                and echo -n $field_name:
                set_color $retc
                echo -n $field_value
                set_color -o normal
                echo -n ']'
        end
    
    
        if functions -q fish_is_root_user; and fish_is_root_user
                set_color -o red
        else
                set_color -o yellow
        end
    
        echo -n $USER

        set_color brblack
        echo -n " at "
    
        if test -z "$SSH_CLIENT"
                set_color -o brcyan
        else
                set_color -o cyan
        end
    
        echo -n (prompt_hostname)

        set_color brblack
        echo -n " in "

        set_color -o blue
        echo -n (prompt_pwd)
    
        # Vi-mode
    
        if test "$fish_key_bindings" = fish_vi_key_bindings
                or test "$fish_key_bindings" = fish_hybrid_key_bindings
                set -l mode
                switch $fish_bind_mode
                        case default
                                set mode (set_color --bold blue)NORMAL
                        case operator f F t T
                                set mode (set_color --bold brblack)FIND
                        case insert
                                set mode (set_color --bold green)INSERT
                        case replace_one
                                set mode (set_color --bold green)REPLACE
                        case replace
                                set mode (set_color --bold cyan)REPLACE
                        case visual
                                set mode (set_color --bold magenta)VISUAL
                end
                set mode $mode(set_color normal)
                # _nim_prompt_wrapper $retc '' $mode
        end
    
        # Virtual Environment
        set -q VIRTUAL_ENV_DISABLE_PROMPT
        or set -g VIRTUAL_ENV_DISABLE_PROMPT true
        set -q VIRTUAL_ENV
        and _nim_prompt_wrapper $retc V (path basename "$VIRTUAL_ENV")
    
        # git
        set -l prompt_git (fish_git_prompt '%s')
        test -n "$prompt_git"
        and _nim_prompt_wrapper $retc G $prompt_git
    
        # New line
        echo
    
        # Background jobs
        set_color normal
    
        for job in (jobs)
                set_color $retc
                echo -n '│ '
                set_color brown
                echo $job
        end
    
        set_color -o red
        echo -n '↪ '
        set_color normal
end
