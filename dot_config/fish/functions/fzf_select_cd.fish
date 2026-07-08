function fzf_select_cd
    set -l dir (fd --type d --hidden --exclude .git | fzf --reverse)
    if test -n "$dir"
        cd $dir
    end
    commandline -f repaint
end
