local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
    icon = {
        color = colors.white,
        padding_left = 8,
        font = {
            style = settings.font.style_map["Bold"],
            size = 12.0,
        },
    },
    label = {
        color = colors.white,
        padding_right = 8,
        align = "right",
        font = {
            style = settings.font.style_map["Bold"],
            size = 12.0,
        },
    },
    position = "right",
    update_freq = 30,
    padding_left = 1,
    padding_right = 1,
})

sbar.add("bracket", { cal.name }, {
    background = {
        color = colors.item.bg,
    }
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
    cal:set({ label = os.date("• %a %d %b"), icon = os.date("%H:%M") })
end)
