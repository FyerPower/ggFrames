GGF.Window = {}

-- Create Controls, set dimensions and anchors
function GGF.Window:Create(cName, cParent, cType, cTemplate)
  local control = _G[cName]
  if (control == nil) then
    if (cType == 4) then 
      control = CreateTopLevelWindow(cName)
    else 
      control = WINDOW_MANAGER:CreateControl(cName, cParent, cType)
    end
    control:SetDimensions(cTemplate.Width, cTemplate.Height)
    control:SetAnchor(cTemplate.MyAnchor, cParent, cTemplate.ParentAnchor, cTemplate.OffsetX, cTemplate.OffsetY)    
    return control
  end
end

-- Create Backdrops
function GGF.Window:CreateBackDrop(cName, cParent, cTemplate)
  local backdrop = GGF.Window:Create(cName, cParent, CT_BACKDROP, cTemplate)
  local background = GGF.Utils:ConvertRGBA(cTemplate.BackColor, cTemplate.BackAlpha)
  local edge = GGF.Utils:ConvertRGBA(cTemplate.EdgeColor, cTemplate.EdgeAlpha)
  
  backdrop:SetCenterColor(background[1], background[2], background[3], background[4])
  backdrop:SetEdgeColor(edge[1], edge[2], edge[3], edge[4])
  backdrop:SetEdgeTexture("", 8, 1, cTemplate.EdgeWeight)
  return backdrop
end

-- Create Labels
function GGF.Window:CreateLabel(cName, cParent, cTemplate)
  local label = GGF.Window:Create(cName, cParent, CT_LABEL, cTemplate)
  local clFontColor = GGF.Utils:ConvertRGBA(cTemplate.FontColor, cTemplate.FontAlpha)
  
  label:SetFont(cTemplate.Font)
  label:SetScale(cTemplate.Scale)
  label:SetHorizontalAlignment(cTemplate.HorizontalAlign)
  label:SetVerticalAlignment(cTemplate.VerticalAlign)
  label:SetColor(clFontColor[1], clFontColor[2], clFontColor[3], clFontColor[4])

  if cTemplate.Hidden then label:SetHidden(cTemplate.Hidden) end
  if cTemplate.Text then label:SetText(cTemplate.Text) end
  return label
end

-- Create Status Bars
-- Another Possible Texture: "/esoui/art/campaign/overview_scoringbg_daggerfall_left.dds"
function GGF.Window:CreateStatusBar(cName, cParent, cTemplate)
  local status = GGF.Window:Create(cName, cParent, CT_STATUSBAR, cTemplate)
  local csBarColor = GGF.Utils:ConvertRGBA(cTemplate.BarColor, cTemplate.BarAlpha)
  
  status:SetTexture(cTemplate.Texture)
  status:SetColor(csBarColor[1], csBarColor[2], csBarColor[3], csBarColor[4])
  status:SetMinMax(0, 100)
  status:SetValue(100)
  return status
end

-- Create Texture
function GGF.Window:CreateTexture(cName, cParent, cTemplate, textureFile)
  local texture = GGF.Window:Create(cName, cParent, CT_TEXTURE, cTemplate)
  -- texture:SetDrawLayer(3)
  
  texture:SetTexture(textureFile or cTemplate.Texture)    
  texture:SetAlpha(cTemplate.Alpha or 1)    
  return texture
end
