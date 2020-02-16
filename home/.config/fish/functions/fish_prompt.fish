function fish_prompt
    if type -q powerline-go
        ~/bin/powerline-go -max-width 0 -colorize-hostname -error $status -shell bare -modules aws,terraform-workspace,venv,user,host,ssh,cwd,perms,jobs,git,hg,exit -newline
    else
        echo [(whoami)@(hostname)](tput bold)(pwd)(tput sgr0)\n\>
    end
end
