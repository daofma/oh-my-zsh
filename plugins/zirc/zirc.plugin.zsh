zstyle ":zirc:*:*" timestamp-format "%D %*"
#bg msgs are temporarily retired
#zstyle ":zirc:*:*" msg-format "%T <%w> %m"
zstyle ":zirc:*:*" msg-format "%T <%w:%W> %m"
zstyle ":zirc:*:*" private-msg-format "%T *** <%w> %m"
zstyle ":zirc:*:*" nick-notify-format "%T %w is now known as %n"
zstyle ":zirc:*:*" join-notify-format "%T %w (%H) has joined %W"
zstyle ":zirc:*:*" part-notify-format "%T %w has left %W (%m)"
zstyle ":zirc:*:*" quit-notify-format "%T %w has quit IRC (%m)"
zstyle ":zirc:*:*" topic-format "%T %w has changed the t in %W to %t"
zstyle ":zirc:*:*" mode-format "%T %w sets mode %M %D"
zstyle ":zirc:*:*" invite-format "%T %w has invited you to %W"
zstyle ":zirc:*:*" kick-format "%T %w was kicked from %W by %U"
zstyle ":zirc:*:*" pong-format "%T PONG"
zstyle ":zirc:*:*" wallops-format "%T Wallops from %w: %m"
zstyle ":zirc:*:*" error-format "%T ERROR: %E"

source $OMZ_HOME/plugins/zirc/zirc.zsh
