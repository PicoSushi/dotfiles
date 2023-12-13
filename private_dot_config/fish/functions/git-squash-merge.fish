function git-squash-merge --description 'Squash merge into current branch.'
    git merge --squash --no-commit {$argv[1]}
    git commit -m 'Squash merge: '{$argv[1]}
end