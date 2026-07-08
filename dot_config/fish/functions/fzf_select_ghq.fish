function fzf_select_ghq
    set -l repo (ghq list --full-path | fzf --reverse)
    if test -n "$repo"
        cd $repo
    end
    commandline -f repaint
end
