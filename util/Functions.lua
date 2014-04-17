
GGF.Utils = { bufferTable = {} }
function GGF.Utils:BufferReached(key, time)
  if not key then return end
  
  local current = GetFrameTimeMilliseconds()
  if (current - (self.bufferTable[key] or 0)) >= (time or 250) then
    self.bufferTable[key] = current
    return true
  end
  return false
end

-- Color Hex to RGBA
function GGF.Utils:ConvertRGBA(hex, alpha)
  return {tonumber("0x"..string.sub(hex, 1, 2))/255, tonumber("0x"..string.sub(hex, 3, 4))/255, tonumber("0x"..string.sub(hex, 5, 6))/255, alpha}
end

function GGF.Utils:ShallowCopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in pairs(orig) do
          copy[orig_key] = orig_value
      end
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
end

function GGF.Utils:DeepCopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
      copy = {}
      for orig_key, orig_value in next, orig, nil do
          copy[deepcopy(orig_key)] = deepcopy(orig_value)
      end
      setmetatable(copy, deepcopy(getmetatable(orig)))
  else -- number, string, boolean, etc
      copy = orig
  end
  return copy
end

function GGF.Utils:TableMerge(table1, table2)
  for key, value in pairs(table2) do
    if type(value) == "table" then
      if type(table1[key] or false) == "table" then
        GGF.Utils:TableMerge(table1[key] or {}, table2[key] or {})
      else
        table1[key] = value
      end
    else
      table1[key] = value
    end
  end
  return table1
end