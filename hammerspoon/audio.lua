local function useHeadphones ()
  local output = hs.audiodevice.findOutputByName("External Headphones")
  if (output) then
    output:setDefaultOutputDevice()
  end

  local input = hs.audiodevice.findInputByName("External Microphone")
  if (input) then
    input:setDefaultInputDevice()
  end
end

audio = {
  useHeadphones = useHeadphones,
}
