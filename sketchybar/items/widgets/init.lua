local colors = require("colors")
local battery = require("items.widgets.battery")
local volume = require("items.widgets.volume")
local wifi = require("items.widgets.wifi")
--require("items.widgets.cpu")

sbar.add("bracket", "widgets",
    { wifi.wifi.name, volume.volume_icon.name, battery.battery.name }, {
      background = { color = colors.item.bg }
    })
