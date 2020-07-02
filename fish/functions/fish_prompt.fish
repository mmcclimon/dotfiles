function git_prompt -d 'print the git prompt'
    # is_gitdir at_or_on branch_or_sha is_dirty
    set -l gitinfo (string split ' ' (git prompt-info 2>/dev/null))
    set -l branch_color "005f5f"

    if test $gitinfo[1] -eq 0
        return
    end

    echo -n " $gitinfo[2] "
    set_color $branch_color
    echo -n $gitinfo[3]
    set_color normal

    if test $gitinfo[4] -eq 1
        set_color red
        echo -n '*'
        set_color normal
    end
end

function fish_mode_prompt
end

function vi_mode_char
    switch $fish_bind_mode
    case default
        set_color --bold 6c6c6c
        # echo -n 'N'
    case insert
        set_color --bold blue
        # echo -n 'I'
    case replace
        set_color --bold green
        # echo -n 'R'
    case replace_one
        set_color --bold green
    case visual
        set_color --bold brmagenta
        # echo -n 'V'
    case '*'
        set_color --bold red
        # echo -n $fish_bind_mode
  end
end

function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l blue "blue"
    set -l grey 6c6c6c

    echo ''   # newline

    set_color $grey
    echo -n '['

    echo -n (prompt_pwd)
    echo -n (git_prompt)

    set_color $grey
    echo -n ']'

    echo -n (vi_mode_char)

    echo -n ' ➤ '
    set_color normal
end
