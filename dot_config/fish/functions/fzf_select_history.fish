function fzf_select_history
    set -l cmd (history | fzf --no-sort --exact --reverse --query (commandline -b))
    if test -n "$cmd"
        commandline -r -- $cmd
    end
    commandline -f repaint
end
