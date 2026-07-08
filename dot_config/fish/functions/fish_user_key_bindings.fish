function fish_user_key_bindings
    # Ctrl+R history search is provided by PatrickF1/fzf.fish
    bind \cf fzf_select_ghq # fzf ghq repository jump on Ctrl+F
    bind \c] fzf_select_cd # fzf change directory on Ctrl+]
end
