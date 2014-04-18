-- Create Player Frames
function GGF.Unit:Controls()
  self.frames = {}
  
  -- Draw Main Control
  self.frames.main = GGF.Window:Create("GGF_"..self.unitTag, nil, CT_TOPLEVELCONTROL, self.template)
  
  -- Draw Name and Class (Level)
  self.frames.nameLb  = GGF.Window:CreateLabel("GGF_"..self.unitTag.."InfoNameLB",  self.frames.main, self.template.Name)
  self.frames.classTx = GGF.Window:CreateTexture("GGF_"..self.unitTag.."InfoClassTx", self.frames.main, self.template.Class)

  -- Draw Leader and Roles
  -- self.frames.leaderTx = GGF.Window:CreateTexture("GGF_"..self.unitTag.."InfoLeadTx", self.frames.main, self.template.Leader)
  -- self.frames.tankTx   = GGF.Window:CreateTexture("GGF_"..self.unitTag.."InfoTankTx", self.frames.main, self.template.Tank)
  -- self.frames.healTx   = GGF.Window:CreateTexture("GGF_"..self.unitTag.."InfoHealTx", self.frames.main, self.template.Heal)
  -- self.frames.dmgTx    = GGF.Window:CreateTexture("GGF_"..self.unitTag.."InfoDPSTx",  self.frames.main, self.template.Dps)

  -- Misc Labels
  self.frames.deathLb   = GGF.Window:CreateLabel("GGF_"..self.unitTag.."DeathText", self.frames.main, self.template.Death)
  self.frames.offlineLb = GGF.Window:CreateLabel("GGF_"..self.unitTag.."OfflineText", self.frames.main, self.template.Offline)

  -- Health
  self.frames.healthBd      = GGF.Window:CreateBackDrop("GGF_"..self.unitTag.."Health", self.frames.main, self.template.Health)
  self.frames.healthSt      = GGF.Window:CreateStatusBar("GGF_"..self.unitTag.."HealthStatusBar", self.frames.healthBd, self.template.Health.Bar)
  self.frames.healthLeftLb  = GGF.Window:CreateLabel("GGF_"..self.unitTag.."HealthTextLeft",      self.frames.healthBd, self.template.Health.TextLeft)
  self.frames.healthRightLb = GGF.Window:CreateLabel("GGF_"..self.unitTag.."HealthTextRight",     self.frames.healthBd, self.template.Health.TextRight)

  -- Magicka
  self.frames.magickaBd      = GGF.Window:CreateBackDrop("GGF_"..self.unitTag.."Magicka", self.frames.main, self.template.Magicka)
  self.frames.magickaSt      = GGF.Window:CreateStatusBar("GGF_"..self.unitTag.."MagickaStatusBar", self.frames.magickaBd, self.template.Magicka.Bar)
  self.frames.magickaLeftLb  = GGF.Window:CreateLabel("GGF_"..self.unitTag.."MagickaTextLeft",      self.frames.magickaBd, self.template.Magicka.TextLeft)
  self.frames.magickaRightLb = GGF.Window:CreateLabel("GGF_"..self.unitTag.."MagickaTextRight",     self.frames.magickaBd, self.template.Magicka.TextRight)

  -- Stamina
  self.frames.staminaBd      = GGF.Window:CreateBackDrop("GGF_"..self.unitTag.."Stamina", self.frames.main, self.template.Stamina)
  self.frames.staminaSt      = GGF.Window:CreateStatusBar("GGF_"..self.unitTag.."StaminaStatusBar", self.frames.staminaBd, self.template.Stamina.Bar)
  self.frames.staminaLeftLb  = GGF.Window:CreateLabel("GGF_"..self.unitTag.."StaminaTextLeft",      self.frames.staminaBd, self.template.Stamina.TextLeft)
  self.frames.staminaRightLb = GGF.Window:CreateLabel("GGF_"..self.unitTag.."StaminaTextRight",     self.frames.staminaBd, self.template.Stamina.TextRight)

  -- Mount
  self.frames.mount          = GGF.Window:CreateBackDrop("GGF_"..self.unitTag.."Mount", self.frames.main, self.template.Mount)
  self.frames.mountTx        = GGF.Window:CreateTexture("GGF_"..self.unitTag.."MountTx", self.frames.mount, self.template.Mount.Icon)
  self.frames.mountBd        = GGF.Window:CreateBackDrop("GGF_"..self.unitTag.."MountBd", self.frames.mount, self.template.Mount.BarArea)
  self.frames.mountSt        = GGF.Window:CreateStatusBar("GGF_"..self.unitTag.."MountSt", self.frames.mountBd, self.template.Mount.BarArea.Bar)

  -- Exp
  self.frames.experienceBd   = GGF.Window:CreateBackDrop("GGF_"..self.unitTag.."Experience", self.frames.main, self.template.Experience)
  self.frames.experienceSt   = GGF.Window:CreateStatusBar("GGF_"..self.unitTag.."ExperienceStatusBar", self.frames.experienceBd, self.template.Experience.Bar)

end

function GGF.GenerateCastBar()
end