function notify --wraps='find ~/Music/Ringtone/**/*.mp3 | sort --random-sort | head -1 | xargs -I % mpg123 -q %' --description 'alias notify find ~/Music/Ringtone/**/*.mp3 | sort --random-sort | head -1 | xargs -I % mpg123 -q %'
  find ~/Music/Ringtone/**/*.mp3 | sort --random-sort | head -1 | xargs -I % mpg123 -q % $argv
end
