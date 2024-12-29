local settings = require("settings")

local WINDOW_STR_DELIMITER = "<:>"

local function strsplit (inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end

local front_app = sbar.add("item", "front_app", {
  display = "active",
  icon = {
    font = {
      style = settings.font.style_map["Regular"],
      size = 13.0,
    },
    width = 400,
    y_offset = -7
  },
  label = {
    font = {
      style = settings.font.style_map["Regular"],
      size = 11.0,
    },
      color = 0xffa7aab0,
    padding_left = -397,
    y_offset = 7,
  },
  updates = true,
})

front_app:subscribe("yabai_front_window_updated", function(env)
  local app = ""
  local window_title = ""
  front_app:set({ label = { string = app,  }, icon = window_title })

  local handle = io.popen("yabai -m query --windows --window " .. env.WINDOW_ID .. " | jq -r '\"\\(.app)" .. WINDOW_STR_DELIMITER .. "\\(.title)\"'")
  if handle then
    local window_str = handle:read('*a')
    handle:close()
    local strings = strsplit(window_str, WINDOW_STR_DELIMITER)
    app = strings[1]
    window_title = strings[2]
  end
  front_app:set({ label = { string = app,  }, icon = window_title })
end)
