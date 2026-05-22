--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.layer_rule({ match = { namespace = "rofi" }, animation = "popin", dim_around = true })                        -- rofi

hl.layer_rule({ match = { namespace = "swaync-control-center" }, animation = "slide right", dim_around = true }) -- swaync

-- assigned windows
hl.window_rule({ match = { class = "kitty" }, workspace = 1 })
hl.window_rule({ match = { class = "firefox" }, workspace = 2 })
hl.window_rule({ match = { class = "codium" }, workspace = 3 })
hl.window_rule({ match = { class = "Spotify" }, workspace = 4 })

-- floating/tiling windows
hl.window_rule({ match = { class = ".*" }, float = true, center = true, size = { 1300, 700 } })
hl.window_rule({ match = { class = "kitty" }, float = false })
hl.window_rule({ match = { class = "stremio-enhanced" }, float = false })
