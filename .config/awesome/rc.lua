-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local log = io.open("/tmp/awesomelog", "w")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")
local naughty = require("naughty")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  })
end

-- Handle runtime errors after startup
do
  local in_error = false

  awesome.connect_signal("debug::error", function (err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err)
    })
    in_error = false
  end)
end
-- }}}

-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "gtk/theme.lua")

-- gaps
beautiful.useless_gap = 5

local theme = beautiful.get()

local dmenu_cmd = "dmenu_run -fn '" .. theme.font .. "' -p 'run:'"
local terminal = "kitty"
local browser  = os.getenv("BROWSER") or "brave"

log:write(dmenu_cmd .. "\n")

local taglist = { "1", "2", "3", "4", "5", "6", "7" }

local modkey       = "Mod4"
local onlymodkey   = { modkey }
local modshift     = { modkey, "Shift"  }
local modcontrol   = { modkey, "Control"  }
local modctrlshift = { modkey, "Control", "Shift" }

-- {{{ Key bindings
local k          = awful.key
local incnmaster = awful.tag.incnmaster

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
  ---- Swap with next/previous client by direction
  k(modshift, "h", function () awful.client.swap.bydirection("left") end),
  k(modshift, "j", function () awful.client.swap.bydirection("down") end),
  k(modshift, "k", function () awful.client.swap.bydirection("up") end),
  k(modshift, "l", function () awful.client.swap.bydirection("right") end),

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
  k(onlymodkey, "r"     , function () awful.spawn(dmenu_cmd) end),

  k(modshift, "r", awesome.restart),
  k(modshift, "q", awesome.quit),

  -- Increase/decrease the number of master clients
  k(modshift, "i", function () incnmaster(1, nil, true) end),
  k(modshift, "d", function () incnmaster(-1, nil, true) end),

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
        "request::activate", "key.unminimize", { raise = true }
      )
    end
  end)
)

for i = 1, #taglist do
  globalkeys = gears.table.join(
    globalkeys,

    k(onlymodkey, "#" .. i + 9, function ()
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
    k(modctrlshift, "#" .. i + 9, function ()
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

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
  -- rounded corners
  c.shape = gears.shape.rounded_rect
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  awful.layout.suit.floating,
}

local mouse_left  = 1
local mouse_right = 3

local clientbuttons = gears.table.join(
  awful.button({ }, mouse_left, function (c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),

  awful.button(onlymodkey, mouse_left, function (c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),

  awful.button(onlymodkey, mouse_right, function (c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

local clientkeys = gears.table.join(
  k(onlymodkey, "f", function (c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }
  ),

  k(onlymodkey, "w", function (c) c:kill() end,
    { description = "close", group = "client" }
  ),

  k(modcontrol, "space", awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }
  ),

  k(modcontrol, "Return", function (c) c:swap(awful.client.getmaster()) end,
    { description = "move to master", group = "client" }
  ),

  k(onlymodkey, "o", function (c) c:move_to_screen() end,
    { description = "move to screen", group = "client" }
  ),

  k(onlymodkey, "t", function (c) c.ontop = not c.ontop end,
    { description = "toggle keep on top", group = "client" }
  ),

  k(onlymodkey, "n", function (c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end,
    { description = "minimize", group = "client" }
  ),

  k(onlymodkey, "m", function (c)
      c.maximized = not c.maximized
      c:raise()
    end ,
    { description = "(un)maximize", group = "client" }
  )
)

-- {{{ Wibar
local wibox = require("wibox")

local waldir    = os.getenv("HOME") .. "/Files/Imagens/Wallpapers"
local wallpaper = waldir .. "/gruvbox-forest.png"

-- Create a text clock widget
local textclock = wibox.widget.textclock()

-- Create a battery widget
local battery = wibox.widget {
  widget = wibox.container.background,
  {
    { widget = awful.widget.watch("battery", 30) },
    left   = 7,
    right  = 7,
    top    = 5,
    bottom = 5,
    widget = wibox.container.margin
  }
}

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
  awful.button({ }, mouse_left, function (t) t:view_only() end),
  awful.button(onlymodkey, mouse_left, function (t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),

  awful.button({ }, mouse_right, awful.tag.viewtoggle),

  awful.button(onlymodkey, mouse_right, function (t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end)
)

local tasklist_buttons = gears.table.join(
  awful.button({ }, mouse_left, function (c)
    if c == client.focus then
      c.minimized = true
    else
      c:emit_signal(
        "request::activate",
        "tasklist",
        { raise = true }
      )
    end
  end),

  awful.button({ }, mouse_right, function ()
    awful.menu.client_list { theme = { width = 250 } }
  end),

  -- TODO: replace 4 and 5 with mouse_scroll_direction
  awful.button({  }, 4, function () awful.client.focus.byidx(1) end),
  awful.button({  }, 5, function () awful.client.focus.byidx(-1) end)
)

local function set_wallpaper(s)
  gears.wallpaper.maximized(wallpaper, s, true)
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function (s)
  -- Wallpaper
  set_wallpaper(s)

  -- In the original config says: "Each screen has its own tag table."
  -- but I am setting the same taglist for all screens
  -- I don't know if this can cause any trouble on multi-screen setup
  -- since I use a single monitor
  awful.tag(taglist, s, awful.layout.layouts[1])

  -- Create an imagebox widget which will contain an icon indicating which
  -- layout we're using.
  -- We need one layoutbox per screen.
  s.layoutbox = awful.widget.layoutbox(s)
  s.layoutbox:buttons(gears.table.join(
    awful.button({  }, mouse_left, function () awful.layout.inc(1) end),
    awful.button({  }, mouse_right, function () awful.layout.inc(-1) end),
    -- TODO: replace 4 and 5 with mouse_scroll_direction
    awful.button({  }, 4, function () awful.layout.inc(1) end),
    awful.button({  }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.taglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.tasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  s.wibox = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  s.wibox:setup {
    layout = wibox.layout.align.horizontal,
    -- Left widgets
    {
      layout = wibox.layout.fixed.horizontal,
      s.taglist
    },
    -- Middle widget
    s.tasklist,
    -- Right widgets
    {
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      textclock,
      battery,
      s.layoutbox
    }
  }
end)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus        = awful.client.focus.filter,
      raise        = true,
      keys         = clientkeys,
      buttons      = clientbuttons,
      screen       = awful.screen.preferred,
      placement    = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },

  {
    rule       = { class = "discord" },
    properties = { tag = "5", switchtotag = true }
  },
  {
    rule       = { class = "Brave-browser" },
    properties = { tag = "2", switchtotag = true }
  },

  -- Floating clients.
  {
    rule_any = {
      instance = {
        "DTA", -- Firefox addon DownThemAll.
        "copyq", -- Includes session name in class
        "pinentry"
      },

      class = {
        "Sxiv",
        "Tor Browser" -- Needs a fixed window size to avoid fingerprinting by screen size.
      },

      -- Note that the name property shown in xprop might be set slightly after
      -- creation of the client and the name shown there might not match
      -- defined rules here.
      name = {
        "Event Tester",  -- xev.
      },
      role = {
        "AlarmWindow",  -- Thunderbird's calendar.
        "ConfigManager",  -- Thunderbird's about:config.
        "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = { floating = true }
  },
  -- Add titlebars to normal clients and dialogs
  {
    rule_any = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = false }
  },
}

log:close()
