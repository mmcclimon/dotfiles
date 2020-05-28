function tmat -d 'attach to a tmux'
    set num_args (count $argv)
    if test $num_args -eq 0
        tmux attach
    else
        tmux attach -t $argv
    end
end
