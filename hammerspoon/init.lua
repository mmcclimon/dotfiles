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

notifier = hs.httpserver.new()
notifier:setPort(8686)
notifier:setCallback(function (method, path, headers, body)
  if (method == 'POST') and (path == '/notify') then
    data = hs.json.decode(body)
    hs.logger.new('foo', 'debug').d(hs.inspect.inspect(data))
    title = data.title
    subtitle = data.subtitle or ""
    msg = data.body

    if title and msg then
      notif = hs.notify.new(nil, {
        withdrawAfter   = 0,
        title           = title,
        subtitle        = subtitle,
        informativeText = msg,
      })
      notif:send()
      return "lol done\n", 200, {}
    end

    return "nah mate\n", 400, {}
  else
    return "Nothing here, mate\n", 404, {}
  end
end)
notifier:start()

hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
