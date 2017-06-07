local log = hs.logger.new('init.lua', 'debug')

-- Set up hotkey combinations
local mash      = {"cmd", "alt", "ctrl"}
local mashshift = {"cmd", "alt", "shift"}
local funkymash = {"cmd", "ctrl", "shift"}
local hyper = {"shift", "cmd", "alt", "ctrl"}

-- Set grid size.
hs.grid.GRIDWIDTH  = 12
hs.grid.GRIDHEIGHT = 12
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0

-- Set window animation off. It's much smoother.
hs.window.animationDuration = 0

-- Use Control+` to reload Hammerspoon config
hs.hotkey.bind({'ctrl'}, '`', nil, function()
  hs.reload()
end)

keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)
  hs.eventtap.keyStroke(modifiers, key, 0)
end

-- Subscribe to the necessary events on the given window filter such that the
-- given hotkey is enabled for windows that match the window filter and disabled
-- for windows that don't match the window filter.
--
-- windowFilter - An hs.window.filter object describing the windows for which
--                the hotkey should be enabled.
-- hotkey       - The hs.hotkey object to enable/disable.
--
-- Returns nothing.
enableHotkeyForWindowsMatchingFilter = function(windowFilter, hotkey)
  windowFilter:subscribe(hs.window.filter.windowFocused, function()
    hotkey:enable()
  end)

  windowFilter:subscribe(hs.window.filter.windowUnfocused, function()
    hotkey:disable()
  end)
end

require('status-message')
require('super')
require('control-escape')

-- Init modalWindowManager
modalWindowManager = hs.hotkey.modal.new({"cmd", "alt"}, "`", "Entering Modal Mode")

function modalWindowManager:entered()
  -- hs.screen.primaryScreen():setGamma({alpha=1.0,red=0.0,green=0.0,blue=0.0},{blue=0.5,green=0.5,red=0.5})
end

function modalWindowManager:exited()
  -- hs.screen.primaryScreen():setGamma({alpha=1.0,red=0.0,green=0.0,blue=0.0},{blue=1.0,green=1.0,red=1.0})
  hs.alert.show("No mode")
end

local resizeMappings = {
  -- Half Screen
  h={x=0, y=0, w=0.5, h=1},
  j={x=0, y=0.5, w=1, h=0.5},
  k={x=0, y=0, w=1, h=0.5},
  l={x=0.5, y=0, w=0.5, h=1},
  -- Quarter screen
  q={x=0, y=0, w=0.5, h=0.5},
  a={x=0, y=0.5, w=0.5, h=0.5},
  w={x=0.5, y=0, w=0.5, h=0.5},
  s={x=0.5, y=0.5, w=0.5, h=0.5},
  -- Full Screen
  f={x=0, y=0, w=1, h=1},
}

-- Init layout with resizeMappings
for key in pairs(resizeMappings) do
  modalWindowManager:bind({}, key, function()
    if hs.window.focusedWindow() then
      local win = hs.window.focusedWindow()
      win:moveToUnit(resizeMappings[key])
    else
      hs.alert.show("No active window")
    end
  end)
end

-- Init Layout 2:1
-- Set current window to 2/3 Screen width
modalWindowManager:bind({}, '1', function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y
    f.w = 2 * max.w / 3
    f.h = max.h
    win:setFrame(f)
  else
    hs.alert.show("No active window")
  end
end)

-- Set current window to 1/3 Screen width and snap to left
modalWindowManager:bind({}, '2', function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (2 * max.w / 3)
    f.y = max.y
    f.w = max.w / 3
    f.h = max.h
    win:setFrame(f)
  else
    hs.alert.show("No active window")
  end
end)

-- Set current window to full screen
modalWindowManager:bind({}, 'f', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- Toggle native Full screen
modalWindowManager:bind({"Shift"}, 'F', function() hs.window.focusedWindow():toggleFullScreen() end)

-- Move Windows between screens
modalWindowManager:bind({}, 'n', function() hs.grid.pushWindowNextScreen() end)
modalWindowManager:bind({}, 'p', function() hs.grid.pushWindowPrevScreen() end)

-- Window Hints
modalWindowManager:bind({}, 'space', function() hs.hints.windowHints() end)

-- Window Expose
modalWindowManager:bind({}, 'z', function() 
  expose = hs.expose.new()
  expose:toggleShow()
end)

-- Exit modalWindowManager
modalWindowManager:bind({}, '`', function() modalWindowManager:exit() end)
modalWindowManager:bind({}, 'escape', function() modalWindowManager:exit() end)

-- alert_sound:play()
hs.alert.show("Stop, Hammer time!", 3)
