dir="$HOME/.config/rofi/powermenu"

# CMDs
lastlogin="`last $USER | head -n1 | tr -s ' ' | cut -d' ' -f5,6,7`"
uptime="`uptime | awk '{print $3}' | sed -e 's/,//'`"
host=`hostname`

# Options
hibernate=''
shutdown='襤'
reboot='勒'
lock=''
suspend=''
logout=''
yes=''
no=''

# Rofi CMD
rofi_cmd() {
  rofi \
    -dmenu \
    -p " $USER@$host" \
    -mesg " Uptime: $uptime" \
    -theme ${dir}/theme.rasi
}

# Confirmation CMD
confirm_cmd() {
  rofi \
    -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
    -theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
    -theme-str 'listview {columns: 2; lines: 1;}' \
    -theme-str 'element-text {horizontal-align: 0.5;}' \
    -theme-str 'textbox {horizontal-align: 0.5;}' \
    -dmenu \
    -p 'Confirmation' \
    -mesg 'Are you sure?' \
    -theme ${dir}/theme.rasi
}

# Ask for confirmation
confirm_exit() {
  echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
  echo -e "$suspend\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
  selected="$(confirm_exit)"
  if [[ "$selected" == "$yes" ]]; then
    if [[ $1 == '--shutdown' ]]; then
      systemctl poweroff
    elif [[ $1 == '--reboot' ]]; then
      systemctl reboot
    elif [[ $1 == '--suspend' ]]; then
      amixer set Master mute
      systemctl suspend
    fi
  else
    exit 0
  fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
  $shutdown)
    run_cmd --shutdown
    ;;
  $reboot)
    run_cmd --reboot
    ;;
  $suspend)
    run_cmd --suspend
    ;;
esac
