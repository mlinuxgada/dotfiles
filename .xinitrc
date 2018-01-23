
setxkbmap -model pc104 -layout bg,us -variant phonetic, -option grp:alt_shift_toggle

#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session openbox-session
exec openbox-session
