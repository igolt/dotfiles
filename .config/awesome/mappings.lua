local awful = require("awful")
local gears = require("gears")

local terminal = "kitty"
local browser  = os.getenv("BROWSER") or "brave"

local modkey     = require('constants').modkey
local onlymodkey = { modkey }
local modshift   = { modkey, "Shift"  }
local modcontrol = { modkey, "Control"  }

local k          = awful.key
local incnmaster = awful.tag.incnmaster

-- {{{ Key bindings
local globalkeys = gears.table.join(
  -- Alt-tab like behavior for tags
  k(onlymodkey, "Tab", awful.tag.history.restore),

  -- Client mappings
  ---- Focus next by direction
  k(onlymodkey, "h", function () awful.client.focus.bydirection("left") end),
  k(onlymodkey, "j", function () awful.client.focus.bydirection("down") end),
  k(onlymodkey, "k", function () awful.client.focus.bydirection("up") end),
  k(onlymodkey, "l", function () awful.client.focus.bydirection("right") end),

  -- Layout manipulation
  ---- Swap with next/previous client by index
  k(modshift, "j", function () awful.client.swap.byidx(1) end),
  k(modshift, "k", function () awful.client.swap.byidx( -1) end),

  -- Screen related
  ---- Focus the next/previous screen
  k(modcontrol, "j", function () awful.screen.focus_relative( 1) end),
  k(modcontrol, "k", function () awful.screen.focus_relative(-1) end),

  -- Jump to urgent client
  k(onlymodkey, "u", awful.client.urgent.jumpto),

  -- Alt-tab :thumbsup:
  k({ "Mod1" }, "Tab", function ()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end),

  -- Standard program
  k(onlymodkey, "Return", function () awful.spawn(terminal) end),
  k(onlymodkey, "b"     , function () awful.spawn(browser) end),
  k(onlymodkey, "r"     , function () awful.spawn('dmenu_run') end),

  k(modshift, "r", awesome.restart),
  k(modshift, "q", awesome.quit),

  -- Increase/decrease the number of master clients
  k(modshift, "h", function () incnmaster(1, nil, true) end),
  k(modshift, "l", function () incnmaster(-1, nil, true) end),

  -- Increase/decrease the number of columns
  k(modcontrol, "h", function () awful.tag.incncol(1, nil, true) end),
  k(modcontrol, "l", function () awful.tag.incncol(-1, nil, true) end),

  -- Select next/previous
  k(onlymodkey, "space", function () awful.layout.inc(1) end),
  k(modshift  , "space", function () awful.layout.inc(-1) end),

  -- Restore minimized
  k(modshift, "n", function ()
    local c = awful.client.restore()
    -- Focus restored client
    if c then
      c:emit_signal(
      "request::activate", "key.unminimize", {raise = true}
      )
    end
  end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 7 do
  globalkeys = gears.table.join(globalkeys,
  -- View tag only.
  k(onlymodkey, "#" .. i + 9,
  function ()
    local screen = awful.screen.focused()
    local tag = screen.tags[i]
    if tag then
      tag:view_only()
    end
  end),

  -- Toggle tag display.
  k(modcontrol, "#" .. i + 9, function ()
    local screen = awful.screen.focused()
    local tag = screen.tags[i]

    if tag then
      awful.tag.viewtoggle(tag)
    end
  end),

  -- Move client to tag.
  k(modshift, "#" .. i + 9, function ()
    if client.focus then
      local tag = client.focus.screen.tags[i]
      if tag then
        client.focus:move_to_tag(tag)
      end
    end
  end),

  -- Toggle tag on focused client.
  k({ modkey, "Control", "Shift" }, "#" .. i + 9,
  function ()
    if client.focus then
      local tag = client.focus.screen.tags[i]
      if tag then
        client.focus:toggle_tag(tag)
      end
    end
  end)
  )
end

-- Set keys
root.keys(globalkeys)
-- }}}
