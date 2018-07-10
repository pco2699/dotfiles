function peco_select_repository
     ghq list -p | peco | read line; builtin cd $line
end
