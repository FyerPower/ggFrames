GGF.Locale = {}

function GGF.Locale:Get(key, ...)
  -- return zo_strformat(GGF.Locale[key], ...)

  local str = GGF.Locale[key]
  local arg = {...}
  if ... then
    for key, value in ipairs(arg) do
      str = str:gsub("<<"..key..">>", value)
    end
  end
  return str
end