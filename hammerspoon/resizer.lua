-- entirely so that I don't have to quote keys everywhere else.
local screen_lookup = {
  ["Color LCD"]   = "int",  -- really, macos?
  ["Built-in Retina Display"] = "int",
  ["DELL P2715Q"] = "ext",
  ["DELL U2719DX"] = "ext",
}

local screen_config = {
  ["iTerm2"] = {
    ext = function (frame)
      return { x = 140, y = 130, w = 925, h = 880 }
    end,
    int = function (frame)
      return { x = 130, y = 0, w = 925, h = frame.h }
    end,
  },
  ["Slack"] = {
    all = function (frame)
      local left = frame.x + frame.w - 950
      return { x = left, y = 0, w = 950, h = 850 }
    end,
  },
  ["Firefox"] = {
    ext = function (frame)
      local width = 3 * frame.w / 4;
      return { x = 0, y = 0, w = width, h = frame.h }
    end,
    int = function (frame)
      return { x = 0, y = 0, w = frame.w - 75, h = frame.h }
    end,
  }
};

local function resizeWindows (app_name)
  for app_name, app_config in pairs(screen_config) do
    local app = hs.application.find(app_name)
    local screen = screen_lookup[ hs.screen.primaryScreen():name() ]
    local calc_size = app_config[screen] or app_config["all"]

    if app and screen and calc_size then
      local windows = app:visibleWindows()
      for _, window in ipairs(windows) do
        local frame = window:screen():fullFrame()
        local geom = calc_size(frame)
        window:move(geom)
        break -- one window is enough, in case of madness
      end
    end
  end
end

resizer = {
  resizeWindows = resizeWindows,
}
