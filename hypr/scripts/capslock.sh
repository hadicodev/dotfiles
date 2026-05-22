#!/bin/bash

sleep 0.2

state=$(hyprctl devices -j | python3 -c "
import json, sys
devices = json.load(sys.stdin)
for kb in devices.get('keyboards', []):
    if kb.get('name') == 'at-translated-set-2-keyboard':
        print('on' if kb['capsLock'] else 'off')
        break
")

if [ "$state" == "on" ]; then
    notify-send -a "Caps Lock" -h string:x-canonical-private-synchronous:capslock "   CapsLock On" ""
else
    notify-send -a "Caps Lock" -h string:x-canonical-private-synchronous:capslock "   CapsLock Off" ""
fi
