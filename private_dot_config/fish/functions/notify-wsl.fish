function notify-wsl --description 'Send notify via ToastNotification in WSL'
 powershell.exe -Command "New-BurntToastNotification -Text \"$argv\""
end
