GGF.Debug = {}
function GGF.Debug:New(key, message)
  GGF.Debug[GetGameTimeMilliseconds().."_"..key] = message
end