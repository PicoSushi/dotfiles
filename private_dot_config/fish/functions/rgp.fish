function rgp --description "ripgrep with pager"
    rg --sort path -p $argv | p
end
