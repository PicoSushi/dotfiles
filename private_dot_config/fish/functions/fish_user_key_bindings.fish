function fish_user_key_bindings
    bind \eq push-line
    bind \cs pet-select
end

if type -q fzf
    fzf --fish | source
end
