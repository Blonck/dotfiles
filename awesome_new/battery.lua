local awful = require("awful")
local wibox = require("wibox")

local naughty = naughty
local io = io
local math = math
local tonumber = tonumber
local tostring = tostring

-- volume control widget


local batcontrol = { mt = {}, wmt = {} }
batcontrol.wmt.__index = batcontrol


-- interface for volume control

function batcontrol.new(args)
  local sw = setmetatable({}, batcontrol.wmt)

  sw.bat = args.adapter or "BAT0"

  sw.widget = wibox.widget.textbox()
  sw.widget.set_align("right")

  sw.timer = timer({ timeout = args.timeout or 10 })
  sw:status()
  sw.timer:connect_signal("timeout", function() sw:status() end)
  sw.timer:start()

  return sw
end

function batcontrol:status()
     battery = self:battery_status()
     if self:is_charging() then
         dir = "⚡"
         battery = "A/C ("..battery.."%)"
     elseif self:is_discharging() then
         dir = "⚠"
         if tonumber(battery) > 25 and tonumber(battery) < 75 then
             battery = battery
         elseif tonumber(battery) < 25 then
             -- naughty.notify({ title      = "Battery Warning"
             --                , text       = "Battery low!".. battery .. "% left!"
             --                })
             battery = battery
         else
             battery = battery
         end
     else
         dir = ""
         battery = "A/C"
     end
     self.widget:set_markup("[" .. dir .. battery .. "]")
end

function batcontrol:battery_status()
     local fcur = io.open("/sys/class/power_supply/".. self.bat .."/charge_now")    
     local fcap = io.open("/sys/class/power_supply/".. self.bat .."/charge_full")
     if fcur == nil then return false end
     if fcap == nil then return false end
     local cur = fcur:read()
     local cap = fcap:read()
     return math.floor(cur * 100 / cap)
end

function batcontrol:is_charging()
     local f = io.open("/sys/class/power_supply/".. self.bat .."/status")
     if f == nil then return false end
     return string.find(f:read(), "Charging")
end

function batcontrol:is_discharging()
     local f = io.open("/sys/class/power_supply/".. self.bat .."/status")
     if f == nil then return false end
     return string.find(f:read(), "Discharging")
end

function batcontrol.mt:__call(...)
  return batcontrol.new(...)
end

return setmetatable(batcontrol, batcontrol.mt)
