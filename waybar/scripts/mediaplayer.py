#!/usr/bin/env python3

import subprocess
import json

def run(cmd):
    return subprocess.run(cmd, capture_output=True, text=True)

def get_media():
    try:
        players_result = run(["playerctl", "-l"])
        players = players_result.stdout.strip().splitlines()

        # Only keep players that are actually Playing
        active = []
        for p in players:
            s = run(["playerctl", "--player", p, "status"]).stdout.strip()
            if s == "Playing":
                active.append(p)

        # Nothing playing — show dash
        if not active:
            print(json.dumps({"text": "󰏤 —", "tooltip": "Nothing playing", "class": "stopped"}))
            return

        chosen = active[0]
        title  = run(["playerctl", "--player", chosen, "metadata", "title"]).stdout.strip()
        artist = run(["playerctl", "--player", chosen, "metadata", "artist"]).stdout.strip()

        label = f"{artist} - {title}" if artist else title
        if len(label) > 40:
            label = label[:37] + "..."

        print(json.dumps({
            "text":    f"󰏤 {label}",
            "tooltip": f"{artist} - {title}" if artist else title,
            "class":   "playing"
        }))

    except Exception as e:
        print(json.dumps({"text": "󰏤 —", "tooltip": str(e), "class": "stopped"}))

if __name__ == "__main__":
    get_media()