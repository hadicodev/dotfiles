---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "kitty yazi"
local menu        = "./.config/rofi/type-3/launcher.sh"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("/home/dragon/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))         -- hyprlock
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t")) -- swaync
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -C"))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))        -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- move window
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- wlogout
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("wlogout"))

-- Wallpaper changer
hl.bind(mainMod .. " + P", function()
    local handle = io.popen("ls /home/dragon/wallpapers/")
    local files = {}
    for file in handle:lines() do
        table.insert(files, file)
    end
    handle:close()
    if #files <= 1 then return end
    local cur = io.popen("awww query")
    local current = cur:read("*l")
    cur:close()
    current = current:match("image: (.+)") or ""
    local filtered = {}
    for _, f in ipairs(files) do
        if "/home/dragon/wallpapers/" .. f ~= current then
            table.insert(filtered, f)
        end
    end
    if #filtered == 0 then return end
    math.randomseed(os.time())
    local picked = filtered[math.random(#filtered)]
    local fullpath = "/home/dragon/wallpapers/" .. picked
    hl.exec_cmd("awww img " .. fullpath ..
        " --transition-type grow" ..
        " --transition-pos 0.5,0.5" ..
        " --transition-duration 1.8" ..
        " --transition-fps 60"
    )
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/volume.sh up"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/volume.sh down"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/volume.sh mute"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/mic.sh"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/brightness.sh up"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/brightness.sh down"),
    { locked = true, repeating = true })
hl.bind("Caps_Lock", hl.dsp.exec_cmd("bash ~/.config/hypr/scripts/capslock.sh"), { locked = true })

-- hyprshot
hl.bind("Insert", hl.dsp.exec_cmd("hyprshot -m region"), { locked = true })
hl.bind(" SHIFT + Insert", hl.dsp.exec_cmd("hyprshot -m output"), { locked = true })
hl.bind(" ALT + Insert", hl.dsp.exec_cmd("hyprshot -m window"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
