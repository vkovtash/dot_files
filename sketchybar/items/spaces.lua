local colors = require("colors")
local app_icons = require("helpers.app_icons")

local spaces = {}

for i = 1, 10, 1 do
    local space = sbar.add("space", "space." .. i, {
        space = i,
        label = {
            padding_left = -3,
            padding_right = 3,
            color = colors.grey,
            highlight_color = colors.white,
            font = "sketchybar-app-font:Regular:16.0",
            y_offset = 0,
        },
        padding_right = 2,
        padding_left = 2,
        position = "center",
        background = {
            color = colors.bar.bg,
            border_width = 0,
            height = 25,
            border_color = colors.black,
        },
        popup = { background = { border_width = 2, border_color = colors.black } }
    })

    spaces[i] = space

    -- Single item bracket for space items to achieve double border on highlight
    local space_bracket = sbar.add("bracket", { space.name }, {
        padding_right = 0,
        padding_left = 0,
        background = {
            -- color = colors.item.bg,
            border_color = colors.item.border,
            height = 28,
            border_width = 2
        }
    })

    -- Padding space
    sbar.add("space", "space.padding." .. i, {
        space = i,
        script = "",
        width = 2,
        position = "center",
    })

    local space_popup = sbar.add("item", {
        position = "popup." .. space.name,
        padding_left = 5,
        background = {
            drawing = true,
            image = {
                corner_radius = 9,
                scale = 0.2
            }
        }
    })

    space:subscribe("space_change", function(env)
        local selected = env.SELECTED == "true"
        space:set({
            icon = { highlight = selected, },
            label = { highlight = selected },
            background = {
                border_color = selected and colors.black or colors.item.border,
                color = colors.item.bg,
            }
        })
        space_bracket:set({
            background = {
                border_color = selected and colors.item.border_selected or colors.item.border,
                color = colors.item.bg,
            }
        })
    end)

    space:subscribe("mouse.clicked", function(env)
        if env.BUTTON == "other" then
            space_popup:set({ background = { image = "space." .. env.SID } })
            space:set({ popup = { drawing = "toggle" } })
        else
            local op = (env.BUTTON == "right") and "--destroy" or "--focus"
            sbar.exec("yabai -m space " .. op .. " " .. env.SID)
        end
    end)

    space:subscribe("mouse.exited", function(_)
        space:set({ popup = { drawing = false } })
    end)
end

local space_window_observer = sbar.add("item", {
    drawing = false,
    updates = true,
})

space_window_observer:subscribe("space_windows_change", function(env)
    local icon_line = ""
    local no_app = true
    for app, count in pairs(env.INFO.apps) do
        local lookup = app_icons[app]
        local icon = ((lookup == nil) and app_icons["default"] or lookup)
        if no_app then
          icon_line = icon
          no_app = false
        else
          icon_line = icon_line .. " " .. icon
        end
    end

    if (no_app) then
        icon_line = "       " .. app_icons["default"]
    end
    sbar.animate("tanh", 10, function()
        spaces[env.INFO.space]:set({ label = icon_line })
    end)
end)

