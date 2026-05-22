hl.on("hyprland.start", function()

  -- waybar daemon
  hl.exec_cmd("/home/dragon/.config/waybar/scripts/laun  ch.sh")

  -- notification daemon
  hl.exec_cmd("swaync &")

  -- wallpaper daemon
  hl.exec_cmd("awww-daemon")

  -- idle daemon
  hl.exec_cmd("hypridle")

  -- spotify notification
  hl.exec_cmd("/home/dragon/.config/hypr/scripts/spotif  y-notify.sh")

end)
