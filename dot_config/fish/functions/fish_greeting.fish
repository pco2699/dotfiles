function fish_greeting -d "What's up, fish?"
    status is-interactive; or return
    isatty stdout; or return
    command -q fastfetch; or return

    # Stay quiet inside editor / agent terminals.
    if set -q VIMRUNTIME; or test "$TERM_PROGRAM" = vscode
        return
    end

    fastfetch
end
