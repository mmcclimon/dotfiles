local function resizeWindow (app_name, calc_size)
  local app = hs.application.find(app_name)
  if (app) then
    local windows = app:visibleWindows()
    for i, window in ipairs(windows) do
      local frame = window:screen():fullFrame()
      local geom = calc_size(frame)
      window:move(geom)
      break -- one window is enough, in case of madness
    end
  end
end

local function resizeWindows ()
  resizeWindow("Slack", function (frame)
    local left = frame.x + frame.w - 950
    return { x = left, y = 0, w = 950, h = 850 }
  end)

  resizeWindow("iTerm2", function (frame)
    return { x = 140, y = 130, w = 925, h = 880 }
  end)

  resizeWindow("Firefox", function (frame)
    local width = 3 * frame.w / 4;
    return { x = 0, y = 0, w = width, h = frame.h }
  end)
end

resizer = {
    resizeWindows = resizeWindows,
}
