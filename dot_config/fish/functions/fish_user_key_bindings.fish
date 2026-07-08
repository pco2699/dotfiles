function fish_user_key_bindings
    bind \cr fzf_select_history # fzf history search on Ctrl+R
    bind \cf fzf_select_ghq # fzf ghq repository jump on Ctrl+F
    bind \c] fzf_select_cd # fzf change directory on Ctrl+]
end
