GGF.classTextures = {
  ["Sorcerer"] = "/esoui/art/contacts/social_classicon_sorcerer.dds",
  ["Templar"] = "/esoui/art/contacts/social_classicon_templar.dds",
  ["Dragonknight"] = "/esoui/art/contacts/social_classicon_dragonknight.dds",
  ["Nightblade"] = "/esoui/art/contacts/social_classicon_nightblade.dds"
}

-- Create Player Frames
function GGF.Unit:Controls()
  self.template = GGF.Theme.Load(self.unitName)   -- Load Template (For Rendering)
  
  -- Draw Main Control
  self.frames.main = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."Frame", self.parent, self.template)

  -- Draw Name and Class (Level)
  self.frames.nameLb  = GGF.Window:CreateLabel("GGF_"..self.unitName.."NameLB",  self.frames.main, self.template.Name)
  if self.template.Level ~= false then self.frames.levelLb = GGF.Window:CreateLabel("GGF_"..self.unitName.."LevelLB",  self.frames.nameLb, self.template.Level) end
  if self.template.Class ~= false then self.frames.classTx = GGF.Window:CreateTexture("GGF_"..self.unitName.."ClassTx", self.frames.main, self.template.Class) end
  if self.template.Leader ~= false then self.frames.leaderTx = GGF.Window:CreateTexture("GGF_"..self.unitName.."LeadTx", self.frames.main, self.template.Leader) end

  -- Misc Labels
  self.frames.death     = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."Death", self.frames.main, self.template.Death)
  self.frames.deathLb   = GGF.Window:CreateLabel("GGF_"..self.unitName.."DeathText", self.frames.death, self.template.Death.Label)
  self.frames.deathLb:SetText("Dead")
  self.frames.offline   = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."Offline", self.frames.main, self.template.Offline)
  self.frames.offlineLb = GGF.Window:CreateLabel("GGF_"..self.unitName.."OfflineText", self.frames.offline, self.template.Offline.Label)
  self.frames.offlineLb:SetText("Offline")

  -- Health
  self.frames.healthBd      = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."Health", self.frames.main, self.template.Health)
  self.frames.healthSt      = GGF.Window:CreateStatusBar("GGF_"..self.unitName.."HealthStatusBar", self.frames.healthBd, self.template.Health.Bar)
  if self.template.Health.TextLeft ~= false then self.frames.healthLeftLb  = GGF.Window:CreateLabel("GGF_"..self.unitName.."HealthTextLeft",  self.frames.healthBd, self.template.Health.TextLeft) end
  if self.template.Health.TextRight ~= false then self.frames.healthRightLb = GGF.Window:CreateLabel("GGF_"..self.unitName.."HealthTextRight", self.frames.healthBd, self.template.Health.TextRight) end

  -- Magicka
  if self.template.Magicka ~= false then
    self.frames.magickaBd      = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."Magicka", self.frames.main, self.template.Magicka)
    self.frames.magickaSt      = GGF.Window:CreateStatusBar("GGF_"..self.unitName.."MagickaStatusBar", self.frames.magickaBd, self.template.Magicka.Bar)
    self.frames.magickaLeftLb  = GGF.Window:CreateLabel("GGF_"..self.unitName.."MagickaTextLeft",      self.frames.magickaBd, self.template.Magicka.TextLeft)
    self.frames.magickaRightLb = GGF.Window:CreateLabel("GGF_"..self.unitName.."MagickaTextRight",     self.frames.magickaBd, self.template.Magicka.TextRight)
  end

  -- Stamina
  if self.template.Stamina ~= false then
    self.frames.staminaBd      = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."Stamina", self.frames.main, self.template.Stamina)
    self.frames.staminaSt      = GGF.Window:CreateStatusBar("GGF_"..self.unitName.."StaminaStatusBar", self.frames.staminaBd, self.template.Stamina.Bar)
    self.frames.staminaLeftLb  = GGF.Window:CreateLabel("GGF_"..self.unitName.."StaminaTextLeft",      self.frames.staminaBd, self.template.Stamina.TextLeft)
    self.frames.staminaRightLb = GGF.Window:CreateLabel("GGF_"..self.unitName.."StaminaTextRight",     self.frames.staminaBd, self.template.Stamina.TextRight)
  end

  -- Mount
  if self.template.Mount ~= false then
    self.frames.mount          = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."Mount", self.frames.main, self.template.Mount)
    self.frames.mountTx        = GGF.Window:CreateTexture("GGF_"..self.unitName.."MountTx", self.frames.mount, self.template.Mount.Icon)
    self.frames.mountBd        = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."MountBd", self.frames.mount, self.template.Mount.BarArea)
    self.frames.mountSt        = GGF.Window:CreateStatusBar("GGF_"..self.unitName.."MountSt", self.frames.mountBd, self.template.Mount.BarArea.Bar)
  end

  -- Exp
  if self.template.Experience ~= false then
    self.frames.experienceBd   = GGF.Window:CreateBackDrop("GGF_"..self.unitName.."Experience", self.frames.main, self.template.Experience)
    self.frames.experienceSt   = GGF.Window:CreateStatusBar("GGF_"..self.unitName.."ExperienceStatusBar", self.frames.experienceBd, self.template.Experience.Bar)
    self.frames.experienceBd:SetHidden(false)
  elseif self.frames.experienceBd ~= nil then
    GGF.Debug:New("Hiding Experience Bar for "..self.unitName, self.frames.experienceBd)
    self.frames.experienceBd:SetHidden(true)
  end

end

function GGF.Unit:SetPosition()
end


-- function GGF.GenerateCastBar()
-- end