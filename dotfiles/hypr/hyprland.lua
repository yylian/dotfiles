-- Hyprland Lua configuration
-- https://wiki.hypr.land/Configuring/Start/

----MONITORS----
-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-1",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

----MY PROGRAMS----
local terminal   = "ghostty"
local fileManager = "dolphin"
local menu       = "walker"

----AUTOSTART----
-- https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dunst")
    hl.exec_cmd("elephant")
    hl.exec_cmd("walker --gaplication-service")
    -- TODO fix polkit
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
end)

----ENVIRONMENT VARIABLES----
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE",   "24")
hl.env("HYPRCURSOR_SIZE","24")

----LOOK AND FEEL----
-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 20,
        border_size = 2,
        col = {
            active_border   = { colors = { "rgba(8432dfee)", "rgba(fc0fc0ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },
    decoration = {
        rounding         = 10,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
})

----ANIMATIONS----
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default",   style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })

----LAYOUTS----
-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
    master = {
        new_status = "master",
    },
})

----MISC----
hl.config({
    misc = {
        force_default_wallpaper   = 0,
        disable_hyprland_logo     = true,
        disable_splash_rendering  = true,
    },
})

----INPUT----
-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

----KEYBINDINGS----
-- https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))

-- Move focus (vim-style)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window (vim-style)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch / move to workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move / resize windows with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----WINDOWS AND WORKSPACES----
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Suppress maximize requests globally (fixes XWayland dragging issues)
hl.window_rule({
    name         = "suppress-maximize-events",
    match        = { class = ".*" },
    suppress_event = "maximize",
})

-- Firefox: Picture-in-Picture
hl.window_rule({
    name  = "firefox-pip",
    match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
    float = true,
})

-- Firefox: Sharing Indicator
hl.window_rule({
    name  = "firefox-sharing-indicator",
    match = { class = "^(firefox)$", title = "^(Firefox — Sharing Indicator)$" },
    float          = true,
    move           = "50% 5%",
    suppress_event = "fullscreen maximize activate activatefocus",
})

-- Legcord: spawn pinned to right side
hl.window_rule({
    name  = "legcord-pin",
    match = { initial_class = "legcord" },
    size  = "375 900",
    float = true,
    move  = "2164 517",
})
