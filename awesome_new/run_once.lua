local awful = require("awful")

function run_once(prg,arg_string,pname,screen)
  if not prg then
    do return nil end
  end

  if not pname then
    pname = prg
  end

  if not arg_string then
    calle = pname 
  else
    calle = pname .. " " .. arg_string
  end

  awful.util.spawn_with_shell("pgrep -f -u $USER -x '" .. calle .. "' || (" .. calle .. ")", screen)
end
