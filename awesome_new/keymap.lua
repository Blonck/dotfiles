local awful = require("awful")
local wibox = require("wibox")

-- keymap control widget

local keycontrol = { mt = {}, wmt = {} }
keycontrol.wmt.__index = keycontrol


-- interface for volume control

function keycontrol.new(args)
  local sw = setmetatable({}, keycontrol.wmt)

  sw.cmd = "setxkbmap"
  sw.layout = args.layouts or { { "us", ""}, { "de", "" } }
  sw.current = 1

  sw.widget = wibox.widget.textbox()
  sw.widget.set_align("right")

  sw:set_text()

  sw.widget:buttons(
   awful.util.table.join(awful.button({ }, 1, function () sw:switch() end))
  )

  return sw
end

function keycontrol:switch()
  self.current = self.current % #(self.layout) + 1
  local t = self.layout[self.current]
  self:set_text()
  os.execute( self.cmd .. " " .. t[1] .. " " .. t[2] )
end

function keycontrol:set_text()
  local t = self.layout[self.current]
  self.widget:set_text("[" .. t[1] .. "]")
end


function keycontrol.mt:__call(...)
  return keycontrol.new(...)
end

return setmetatable(keycontrol, keycontrol.mt)
