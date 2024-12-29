local colors = require("colors")
local app_icons = require("helpers.app_icons")

local NOTCH_WIDTH = 200
local SPACE_COUNT = 8
local NOTCH_POSITION = SPACE_COUNT / 2
local EMPTY_SPACE_ICON = "       " .. app_icons["default"]

local space_items = {}

-- Notch offset space
local notch = nil

for i = 1, SPACE_COUNT, 1 do
    local space_item = sbar.add("item", "space.item." .. i, {
        label = {
            string = EMPTY_SPACE_ICON,
            padding_left = -1,
            padding_right = 5,
            color = colors.grey,
            highlight_color = colors.white,
            font = "sketchybar-app-font:Regular:16.0",
            y_offset = 0,
            width = "dynamic",
        },
        padding_right = 1,
        padding_left = 1,
        position = "center",
        background = {
            color = colors.item.bg,
            border_width = 1,
            height = 28,
            border_color = colors.item.border,
        },
        updates = true,
        popup = { background = { border_width = 2, border_color = colors.black } }
    })

    space_items[i] = space_item

    if i == NOTCH_POSITION then
      notch = sbar.add("item", "space.notch", {
        width = 0,
        padding_right = 0,
        padding_left = 0,
        position = "center",
        background = {
            color = colors.item.bg,
            border_width = 1,
            height = 28,
            border_color = colors.item.border,
        },
      })
    end

    local space_popup = sbar.add("item", {
        position = "popup." .. space_item.name,
        padding_left = 5,
        background = {
            drawing = true,
            image = {
                corner_radius = 9,
                scale = 0.2
            }
        }
    })

    -- Subscribe to space changes 
    local space = sbar.add("space", "space." .. i, {
        space = i,
        script = "",
        width = -1,
        position = "left",
    })

    space:subscribe("space_change", function(env)
        local selected = env.SELECTED == "true"
        space_item:set({
          icon = { highlight = selected },
          label = { highlight = selected },
          background = {
            border_color = selected and colors.item.border_selected or colors.item.border,
              color = colors.item.bg,
          }
        })
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
        icon_line = EMPTY_SPACE_ICON
    end
    sbar.animate("tanh", 10, function()
        space_items[env.INFO.space]:set({ label = icon_line })
    end)
end)

space_window_observer:subscribe("notch_space_toggle", function()
  if notch:query().geometry.width > 0 then
    sbar.animate("tanh", 10, function()
      notch:set({width = 0})
    end)
  else
    sbar.animate("tanh", 10, function()
      notch:set({width = NOTCH_WIDTH })
    end)
  end
end)

