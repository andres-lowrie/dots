-- -------------------------------------------------------------------------- --
-- Lib
-- -------------------------------------------------------------------------- --
-- Get Application Names
-- hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:title()) end)

-- Pretty Print Tables
-- Found in http://lua-users.org/wiki/TableSerialization

--[[
Author: Julio Manuel Fernandez-Diaz
Date:   January 12, 2007
(For Lua 5.1)
Modified slightly by RiciLake to avoid the unnecessary table traversal in tablecount()
Formats tables with cycles recursively to any depth.
The output is returned as a string.
References to other tables are shown as values.
Self references are indicated.
The string returned is "Lua code", which can be procesed
(in the case in which indent is composed by spaces or "--").
Userdata and function keys and values are shown as strings,
which logically are exactly not equivalent to the original code.
This routine can serve for pretty formating tables with
proper indentations, apart from printing them:
print(table.show(t, "t"))   -- a typical use
Heavily based on "Saving tables with cycles", PIL2, p. 113.
Arguments:
t is the table.
name is the name of the table (optional)
indent is a first indentation (optional).
--]]
function table.show(t, name, indent)
  local cart     -- a container
  local autoref  -- for self references

  --[[ counts the number of elements in a table
  local function tablecount(t)
  local n = 0
  for _, _ in pairs(t) do n = n+1 end
  return n
  end
  ]]
  -- (RiciLake) returns true if the table is empty
  local function isemptytable(t) return next(t) == nil end

  local function basicSerialize (o)
    local so = tostring(o)
    if type(o) == "function" then
      local info = debug.getinfo(o, "S")
      -- info.name is nil because o is not a calling level
      if info.what == "C" then
        return string.format("%q", so .. ", C function")
      else
        -- the information is defined through lines
        return string.format("%q", so .. ", defined in (" ..
        info.linedefined .. "-" .. info.lastlinedefined ..
        ")" .. info.source)
      end
    elseif type(o) == "number" or type(o) == "boolean" then
      return so
    else
      return string.format("%q", so)
    end
  end

  local function addtocart (value, name, indent, saved, field)
    indent = indent or ""
    saved = saved or {}
    field = field or name

    cart = cart .. indent .. field

    if type(value) ~= "table" then
      cart = cart .. " = " .. basicSerialize(value) .. ";\n"
    else
      if saved[value] then
        cart = cart .. " = {}; -- " .. saved[value]
        .. " (self reference)\n"
        autoref = autoref ..  name .. " = " .. saved[value] .. ";\n"
      else
        saved[value] = name
        --if tablecount(value) == 0 then
        if isemptytable(value) then
          cart = cart .. " = {};\n"
        else
          cart = cart .. " = {\n"
          for k, v in pairs(value) do
            k = basicSerialize(k)
            local fname = string.format("%s[%s]", name, k)
            field = string.format("[%s]", k)
            -- three spaces between levels
            addtocart(v, fname, indent .. "   ", saved, field)
          end
          cart = cart .. indent .. "};\n"
        end
      end
    end
  end

  name = name or "__unnamed__"
  if type(t) ~= "table" then
    return name .. " = " .. basicSerialize(t)
  end
  cart, autoref = "", ""
  addtocart(t, name, indent)
  return cart .. autoref
end


-- Resize windows to take up half of the screen, either horizontal or vertical
-- -------------------------------------------------------------------------- --
-- Calculates the coordinates for the window
function mvWinTo(args)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if args.dir == "left" then
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
  elseif args.dir == "right" then
    f.x = max.x + ( max.w / 2 )
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
  end

  win:setFrame(f)

end

hs.hotkey.bind({"ctrl","cmd"}, "Left", function() mvWinTo({dir= "left"}) end)
hs.hotkey.bind({"ctrl","cmd"}, "Right", function() mvWinTo({dir= "right"}) end)

-- -------------------------------------------------------------------------- --
-- Frequent Keys
-- -------------------------------------------------------------------------- --
--hs.hotkey.bind({"ctrl"}, ";", function() hs.eventtap.keyStroke({}, "=") end)
--hs.hotkey.bind({"ctrl"}, ".", function() hs.eventtap.keyStroke({"shift"}, "-") end)
--hs.hotkey.bind({"ctrl"}, "/", function() hs.eventtap.keyStroke({}, "-") end)
--hs.hotkey.bind({"ctrl"}, ",", function() hs.eventtap.keyStroke({"shift"}, "=") end)
--hs.hotkey.bind({"ctrl"}, "'", function() hs.eventtap.keyStroke({}, "`") end)
--hs.hotkey.bind({"ctrl", "cmd"}, "'", function() hs.eventtap.keyStroke({"shift"}, "`") end)


--hs.hotkey.bind({"ctrl", "cmd"}, "H", function() hs.eventtap.keyStroke({}, "Left") end)
--hs.hotkey.bind({"ctrl", "cmd"}, "J", function() hs.eventtap.keyStroke({}, "Down") end)
--hs.hotkey.bind({"ctrl", "cmd"}, "K", function() hs.eventtap.keyStroke({}, "Up") end)
--hs.hotkey.bind({"ctrl", "cmd"}, "L", function() hs.eventtap.keyStroke({}, "Right") end)

-- -------------------------------------------------------------------------- --
-- Num Pad
-- -------------------------------------------------------------------------- --
--hs.hotkey.bind({"fn", "alt"}, "m", function() hs.eventtap.keyStroke({}, "1") end)
--hs.hotkey.bind({"fn", "alt"}, ",", function() hs.eventtap.keyStroke({}, "2") end)
--hs.hotkey.bind({"fn", "alt"}, ".", function() hs.eventtap.keyStroke({}, "3") end)
--hs.hotkey.bind({"fn", "alt"}, "j", function() hs.eventtap.keyStroke({}, "4") end)
--hs.hotkey.bind({"fn", "alt"}, "k", function() hs.eventtap.keyStroke({}, "5") end)
--hs.hotkey.bind({"fn", "alt"}, "l", function() hs.eventtap.keyStroke({}, "6") end)
--hs.hotkey.bind({"fn", "alt"}, "u", function() hs.eventtap.keyStroke({}, "7") end)
--hs.hotkey.bind({"fn", "alt"}, "i", function() hs.eventtap.keyStroke({}, "8") end)
--hs.hotkey.bind({"fn", "alt"}, "o", function() hs.eventtap.keyStroke({}, "9") end)
--hs.hotkey.bind({"fn", "alt"}, "space", function() hs.eventtap.keyStroke({}, "0") end)


-- -------------------------------------------------------------------------- --
-- Move mouse to current focusedWindow
-- -------------------------------------------------------------------------- --
hs.hotkey.bind({"cmd"}, "'", function()
  local screen = hs.window.focusedWindow():screen()
  local centerPnt = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.setAbsolutePosition(centerPnt)
end)
