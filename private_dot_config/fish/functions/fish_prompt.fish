function fish_prompt
    if set -q fish_private_mode
        set -gx fish_prompt_private "🔒"
    else
        set -gx fish_prompt_private ""
    end

    set -x POWERLINE_PROMPT_VARIABLE "$fish_prompt_private"
    if type -q powerline-go
        ~/bin/powerline-go -max-width 0 -colorize-hostname -error $status -jobs (jobs -p | wc -l | awk '{print $1}') -shell-var POWERLINE_PROMPT_VARIABLE -shell-var-no-warn-empty -modules aws,terraform-workspace,venv,user,host,shell-var,ssh,jobs,cwd,perms,git,hg,exit -newline
        set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
    else
        echo [$fish_prompt_private(whoami)@(hostname)](tput bold)(pwd)(tput sgr0)\n\>
    end
end

