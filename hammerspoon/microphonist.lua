-- blatantly stolen from Rik.
local Microphonist = { }

function Microphonist:new (obj)
  obj = obj or {}
  setmetatable(obj, self)
  self.__index = self

  obj.options = {
    {
      input  = "UMC204HD 192k",
      output = "UMC204HD 192k",
      icon   = "🎛️",
      order  = 1,
    },
    {
      input  = "USB Audio Device",
      output = "USB Audio Device",
      icon   = "🎧",
      order  = 2,
    },
    {
      output = "Michael’s AirPods Pro",
      input  = "Michael’s AirPods Pro",
      icon   = "🦻🏻",
      order  = 3,
    },
    {
      output = "mjm airpods pro 2",
      input  = "mjm airpods pro 2",
      icon   = "🦻🏻",
      order  = 3,
    },
    {
      output = "External Headphones",
      input  = "HD Pro Webcam C920",
      icon   = "🎤",
      order  = 4,
    },
    {
      input  = "MacBook Pro Microphone",
      output = "MacBook Pro Speakers",
      icon    = "💻",
      order  = 5,
    },
    {
      input  = "MacBook Air Microphone",
      output = "MacBook Air Speakers",
      icon    = "💻",
      order  = 6,
    },
    {
      input  = "USB Audio CODEC ",
      output = "USB Audio CODEC ",
      icon   = "🎛️",
      order  = 7,
    },
  }

  obj.byInput  = {}
  obj.byOutput = {}
  obj.rotor    = {}

  for k, v in pairs(obj.options) do
    if v.order then obj.rotor[v.order] = v end
  end

  obj.unknownIcon = "🧏🏻‍♂️"

  return obj
end

-- hs.audiodevice.datasource:name() -> string
-- hs.audiodevice.datasource:setDefault() -> hs.audiodevice.datasource
-- hs.audiodevice.defaultOutputDevice() -> hs.audiodevice or nil

function Microphonist:currentAudioProfile ()
  local activeInput  = hs.audiodevice.defaultInputDevice()
  local activeOutput = hs.audiodevice.defaultOutputDevice()

  if (activeInput == nil) or (activeOutput == nil) then return nil end

  local profile = nil

  for k, v in pairs(self.options) do
    if (v.output == activeOutput:name()) and (v.input == activeInput:name()) then
      profile = v
      break
    end
  end

  if profile == nil then return nil end

  return profile
end

function Microphonist:redraw ()
  local profile = self:currentAudioProfile()

  local icon = self.unknownIcon
  if profile and profile.icon then icon = profile.icon end

  self.micMenu:setTitle(icon)
end

function Microphonist:setIO(input, output)
  input:setDefaultInputDevice()
  output:setDefaultOutputDevice()
  self:redraw()
end

function Microphonist:toggleAudio ()
  local current = self:currentAudioProfile()
  local order = 1

  if (current and (current.order ~= nil)) then order = current.order + 1 end

  local input
  local output

  for i, profile in pairs(self.rotor) do
    if i < order then goto next end

    input = hs.audiodevice.findInputByName(profile.input)
    output = hs.audiodevice.findOutputByName(profile.output)

    print("Trying profile" .. i .. " -- " .. profile.icon)

    if input ~= nil and output ~= nil then
      print "accepted!"
      self:setIO(input, output)
      return
    end

    ::next::
  end

  for i, profile in pairs(self.rotor) do
    if i >= order then break end

    input = hs.audiodevice.findInputByName(profile.input)
    output = hs.audiodevice.findOutputByName(profile.output)

    print("Trying profile" .. i .. " -- " .. profile.icon)

    if input ~= nil and output ~= nil then
      print "accepted!"
      self:setIO(input, output)
      return
    end
  end

  print "Couldn't find a suitable input/output pair!"
end

function Microphonist:install ()
  self.micMenu = hs.menubar.new()

  self.micMenu:setClickCallback(function ()
    self:toggleAudio()
  end)

  hs.audiodevice.watcher.setCallback(function (change)
    if (change ~= "dIn ") and (change ~= "dOut") then return end
    self:redraw()
  end)

  hs.audiodevice.watcher.start()

  hs.timer.doEvery(30, function () self:redraw() end)

  self:redraw()
end

return Microphonist
