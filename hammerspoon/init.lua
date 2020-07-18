require("audio")
require("resizer")

-- auto reload
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.window.animationDuration = 0

local hyper = {"cmd", "option", "ctrl"}

hs.hotkey.bind(hyper, "R", resizer.resizeWindows)
hs.hotkey.bind(hyper, "H", audio.useHeadphones)

menu = hs.menubar.new()
menu:setTitle("◩")
menu:setMenu({
  { title = "Resize Windows", fn = resizer.resizeWindows },
  { title = "Use Headphone Audio", fn = audio.useHeadphones  },
})
-- resizeMenu:setTitle("⌧")

hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
