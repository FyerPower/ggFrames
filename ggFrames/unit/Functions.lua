local powerTypes = {
  [POWERTYPE_HEALTH]  = {friendly = "health",  label = "Health"},
  [POWERTYPE_MAGICKA] = {friendly = "magicka", label = "Magicka"},
  [POWERTYPE_STAMINA] = {friendly = "stamina", label = "Stamina"}
}

GGF.Unit = ZO_Object:Subclass()

-- Create and Initialize a NEW Unit Object (OOP FTW)
function GGF.Unit:New(unitName, baseTemplate, parent)
  local self = ZO_Object.New( self )
  self.unitName = unitName
  self.parent = parent
  self.frames = {}
  self:Controls()
  return self
end

-- Load Unit Data
function GGF.Unit:Load(unitTag, graceful)
  if graceful == true and self.name == GetUnitName(unitTag) then return end
  -- d("Loading: "..unitTag)
  self.unitTag = unitTag
  
  self:SetName( GetUnitName(self.unitTag) )
  self:SetConnected( IsUnitOnline(self.unitTag) )
  self:SetDeath( IsUnitDead(self.unitTag) )
  self:SetLevel( GetUnitLevel(self.unitTag), GetUnitVeteranRank(self.unitTag) )             -- Level / Experience
  self:SetRange( IsUnitInGroupSupportRange(self.unitTag) )                                  -- Is Within Support Range
  self:SetStealth( GetUnitStealthState(self.unitTag) ~= STEALTH_STATE_NONE )

  if self.unitName == "Target" then
    self:SetCaption( GetUnitCaption(self.unitTag) or GetUnitTitle(self.unitTag) )
    self:SetAllianceRank( GetUnitAvARank(self.unitTag) )
    self:SetDifficulty( GetUnitDifficulty(self.unitTag) )
  end
  
  if IsUnitPlayer(self.unitTag) then
    self:SetClass( GetUnitClassId(self.unitTag) )                                           -- Class Texture
    self:SetLeader( IsUnitGroupLeader(self.unitTag) )                                       -- Is Group Leader (Non-Players are never Group Leaders)
  else 
    self:SetClass( nil )
    self:SetLeader( false )
  end

  self:SetPower( nil, POWERTYPE_HEALTH, GetUnitPower(self.unitTag, POWERTYPE_HEALTH) )      -- Set Health
  self:UpdateShield( GetUnitAttributeVisualizerEffectInfo(self.unitTag, ATTRIBUTE_VISUAL_POWER_SHIELDING, STAT_MITIGATION, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH) )
  self:UpdateRegen( STAT_HEALTH_REGEN_COMBAT,  ATTRIBUTE_HEALTH,  POWERTYPE_HEALTH )
  self:UpdateRegen( STAT_MAGICKA_REGEN_COMBAT, ATTRIBUTE_MAGICKA, POWERTYPE_MAGICKA )
  self:UpdateRegen( STAT_STAMINA_REGEN_COMBAT, ATTRIBUTE_STAMINA, POWERTYPE_STAMINA )
  if self.unitName == "Player" then
    self:SetPower( nil, POWERTYPE_MAGICKA, GetUnitPower(self.unitTag, POWERTYPE_MAGICKA) )  -- Set Magicka
    self:SetPower( nil, POWERTYPE_STAMINA, GetUnitPower(self.unitTag, POWERTYPE_STAMINA) )  -- Set Stamina
    
    if IsUnitVeteran(self.unitTag) then
      self:SetExp( GetUnitVeteranPoints(self.unitTag), GetUnitVeteranPointsMax(self.unitTag), true )
    else
      self:SetExp( GetUnitXP(self.unitTag), GetUnitXPMax(self.unitTag), false )
    end
    self:SetMounted( IsMounted() )
    self:SetMountPower( nil, POWERTYPE_MOUNT_STAMINA, GetUnitPower(self.unitTag, POWERTYPE_MOUNT_STAMINA) )      -- Set Mount Stamina
  end
  self.frames.main:SetHidden(false)
end
function GGF.Unit:Reload()
  self:Load(self.unitTag)
end
-- Unload Data
function GGF.Unit:Unload()
  self.name = ""
  self.frames.main:SetHidden(true)
end

--------------------
-- Setters & Getters
--------------------

function GGF.Unit:SetPower( powerIndex, powerType,  powerValue, powerMax, powerEffectiveMax )
  if not self.template[powerTypes[powerType].label] then return end
  self[powerTypes[powerType].friendly] = {current = powerValue, max = powerEffectiveMax, percent = ( ( powerValue / powerEffectiveMax ) * 100 )}
  
  self.frames[powerTypes[powerType].friendly.."St"]:SetWidth( ( self[powerTypes[powerType].friendly].percent / 100 ) * self.template[powerTypes[powerType].label].Bar.Width )
  
  if self.frames[powerTypes[powerType].friendly.."LbOne"] then 
    self.frames[powerTypes[powerType].friendly.."LbOne"]:SetText( self:FormatStatusBarLabel(GGF.SavedVars['Bar_Format'], powerTypes[powerType].friendly) ) 
  end
  if self.frames[powerTypes[powerType].friendly.."LbTwo"] then 
    self.frames[powerTypes[powerType].friendly.."LbTwo"]:SetText( self:FormatStatusBarLabel(GGF.SavedVars['Bar_Format_Two'], powerTypes[powerType].friendly) )
  end
end

function GGF.Unit:SetMountPower( powerIndex, powerType, powerValue, powerMax, powerEffectiveMax )
  if not self.template.Mount then return end
  self.mount = {current = powerValue, max = powerEffectiveMax, percent = ( ( powerValue / powerEffectiveMax ) * 100 )}
  local barWidth = GGF.SavedVars['Player_Mount_Seperated'] and self.template.Mount.BarArea.Bar.Width or self.template.Mount.Bar.Width
  self.frames.mountSt:SetWidth( ( self.mount.percent / 100 ) * barWidth )
end

function GGF.Unit:SetMounted( isMounted )
  if not self.template.Mount then return end
  self.isMounted = isMounted
  self.frames.mount:SetHidden( not self.isMounted )
  if self.template.Experience ~= false and not GGF.SavedVars['Player_Mount_Seperated'] then
    GGF.Window:SetOffsetY(self.frames.experienceBd, isMounted and self.template.Experience.OffsetY or self.template.Experience.UnmountedOffsetY )
  end
end

function GGF.Unit:UpdateShield( value, maxValue )
  if not self.template.Health.Shield then return end
  if value == nil then value = 0 end
  if maxValue == nil then maxValue = 0 end
  self.shield = {["current"] = value, ["max"] = maxValue, ["percent"] = math.floor( ( value / maxValue ) * 100 )}
  self.frames.shield:SetWidth( math.min( (value/self.health.max ) , 1 ) * self.template.Health.Bar.Width )
  if self.frames['healthLbOne'] then self.frames['healthLbOne']:SetText( self:FormatStatusBarLabel(GGF.SavedVars['Bar_Format'], 'health') ) end
  if self.frames['healthLbTwo'] then self.frames['healthLbTwo']:SetText( self:FormatStatusBarLabel(GGF.SavedVars['Bar_Format_Two'], 'health') ) end
end

function GGF.Unit:UpdateRegen( statType, attributeType, powerType )
  if GGF.SavedVars['Display_Power_Regens'] == false then return end
  if not self.template[powerTypes[powerType].label] or not self.template[powerTypes[powerType].label]["Regen"] or not self.template[powerTypes[powerType].label]["Degen"] then return end
  
  value = (GetUnitAttributeVisualizerEffectInfo(self.unitTag, ATTRIBUTE_VISUAL_INCREASED_REGEN_POWER, statType, attributeType, powerType) or 0)
        + (GetUnitAttributeVisualizerEffectInfo(self.unitTag, ATTRIBUTE_VISUAL_DECREASED_REGEN_POWER, statType, attributeType, powerType) or 0)
  
  if value > 0 then
    self.frames[powerTypes[powerType].friendly.."RegenTexture"]:SetHidden(false)
    self.frames[powerTypes[powerType].friendly.."RegenTime"]:PlayFromStart()
    self.frames[powerTypes[powerType].friendly.."DegenTexture"]:SetHidden(true)
    self.frames[powerTypes[powerType].friendly.."DegenTime"]:Stop()
  elseif value < 0 then
    self.frames[powerTypes[powerType].friendly.."RegenTexture"]:SetHidden(true)
    self.frames[powerTypes[powerType].friendly.."RegenTime"]:Stop()
    self.frames[powerTypes[powerType].friendly.."DegenTexture"]:SetHidden(false)
    self.frames[powerTypes[powerType].friendly.."DegenTime"]:PlayFromStart()
  else
    self.frames[powerTypes[powerType].friendly.."RegenTexture"]:SetHidden(true)
    self.frames[powerTypes[powerType].friendly.."RegenTime"]:Stop()
    self.frames[powerTypes[powerType].friendly.."DegenTexture"]:SetHidden(true)
    self.frames[powerTypes[powerType].friendly.."DegenTime"]:Stop()
  end
end

function GGF.Unit:SetName( name )
  if not self.template.Name then return end

  self.name = name
  GGF.Window:SetLabelText( self.frames.nameLb, self.name, (string.sub(self.unitName,0,10) ~= "LargeGroup") )

  self.reactionType = GetUnitReaction( self.unitTag )
  if( self.unitName == "Target" and (self.reactionType == UNIT_REACTION_FRIENDLY or self.reactionType == UNIT_REACTION_NPC_ALLY) )then
    self.frames.nameLb:SetColor(GGF.SavedVars['Target_FontColor_Friendly'][1], GGF.SavedVars['Target_FontColor_Friendly'][2], GGF.SavedVars['Target_FontColor_Friendly'][3], GGF.SavedVars['Target_FontColor_Friendly'][4])
  elseif self.unitName == "Target" and self.reactionType == UNIT_REACTION_HOSTILE then
    self.frames.nameLb:SetColor(GGF.SavedVars['Target_FontColor_Hostile'][1], GGF.SavedVars['Target_FontColor_Hostile'][2], GGF.SavedVars['Target_FontColor_Hostile'][3], GGF.SavedVars['Target_FontColor_Hostile'][4])
  elseif self.unitName == "Target" and self.reactionType == UNIT_REACTION_INTERACT then
    self.frames.nameLb:SetColor(GGF.SavedVars['Target_FontColor_Interact'][1], GGF.SavedVars['Target_FontColor_Interact'][2], GGF.SavedVars['Target_FontColor_Interact'][3], GGF.SavedVars['Target_FontColor_Interact'][4])
  else
    self.frames.nameLb:SetColor(GGF.SavedVars['Target_FontColor'][1], GGF.SavedVars['Target_FontColor'][2], GGF.SavedVars['Target_FontColor'][3], GGF.SavedVars['Target_FontColor'][4])
  end
end

function GGF.Unit:SetLevel( level, rank )
  if not self.isOnline or not self.template.Level then return end
  self.level = level
  self.vlevel = rank
  if self.vlevel > 0 then
    local size = self.template.Level.FontSize + 6
    self.frames.levelLb:SetText( string.format("|t%d:%d:%s|t%s", size, size, 'ggFrames\\theme\\textures\\LevelVeteran.dds', self.vlevel) )
  else
    local size = self.template.Level.FontSize + 2
    self.frames.levelLb:SetText( string.format("|t%d:%d:%s|t%s", size, size, 'ggFrames\\theme\\textures\\LevelNormal.dds', self.level) )
  end
  self.frames.levelLb:SetHidden( self.reactionType == UNIT_REACTION_FRIENDLY or self.reactionType == UNIT_REACTION_NPC_ALLY )
end

function GGF.Unit:SetCaption( caption )
  if not self.template.Caption then return end
  self.caption = caption
  self.frames.captionLb:SetText( self.caption )
end

function GGF.Unit:SetAllianceRank( rank )
  if not self.template.RankLb or not self.template.RankTx then return end
  self.rank = rank
  if self.rank > 0 then
    GGF.Window:SetLabelText( self.frames.rankLb, self.rank, true )
    self.frames.rankTx:SetTexture( GetAvARankIcon(self.rank) )
    self.frames.rankLb:SetHidden( false )
    self.frames.rankTx:SetHidden( false )
  else
    self.frames.rankLb:SetHidden( true )
    self.frames.rankTx:SetHidden( true )
  end
end

function GGF.Unit:SetDifficulty( difficulty )
  if not self.template.Difficulty then return end
  self.difficulty = difficulty
  if self.difficulty == MONSTER_DIFFICULTY_NORMAL then
    self.frames.difficultyTx:SetTexture('ggFrames\\theme\\textures\\MonsterDiff1.dds')
    self.frames.difficultyTx:SetHidden(false)
  elseif self.difficulty == MONSTER_DIFFICULTY_HARD then
    self.frames.difficultyTx:SetTexture('ggFrames\\theme\\textures\\MonsterDiff2.dds')
    self.frames.difficultyTx:SetHidden(false)
  elseif self.difficulty == MONSTER_DIFFICULTY_DEADLY then
    self.frames.difficultyTx:SetTexture('ggFrames\\theme\\textures\\MonsterDiff3.dds')
    self.frames.difficultyTx:SetHidden(false)
  else
    self.frames.difficultyTx:SetHidden(true)
  end
end

function GGF.Unit:SetClass( classId )
  if not self.template.Class then return end
  self.class = classId
  if classId then
    self.frames.classTx:SetTexture( GGF.classTextures[classId] )
    self.frames.classTx:SetHidden(false)
  else
    self.frames.classTx:SetHidden(true)
  end
end

function GGF.Unit:SetExp( current, max, veteran )
  if not self.template.Experience or max == 0 then return end
  local exp = current / max
  if self.template.Experience.Label ~= false then
    self.frames.experienceLb:SetText( string.format("%d / %d", current, max) )
  end
  self.frames.experienceSt:SetWidth( exp * self.template.Experience.Bar.Width )
end

function GGF.Unit:SetLeader( isLeader )
  if not self.template.Leader then return end
  self.isLeader = isLeader
  self.frames.leaderTx:SetHidden( not isLeader )
  if self.template.Name ~= false and string.sub(self.unitName,0,10) ~= "LargeGroup" then
    GGF.Window:SetAdditionalLeftOffset( self.frames.nameLb, self.template.Name, isLeader and 20 or 0 )
  end
end

function GGF.Unit:SetStealth( isStealthed )
  if not self.template.Stealth then return end
  self.isStealthed = isStealthed
  self.frames.stealthTx:SetAlpha( isStealthed and 1 or 0.2 )
end

function GGF.Unit:SetDeath( isDead )
  self.isDead = isDead
  self:UpdateStatus()
  self.frames.death:SetHidden( not self.isDead )
end

function GGF.Unit:SetConnected( isOnline )
  if self.unitTag == 'player' then isOnline = true end
  self.isOnline = isOnline
  self:UpdateStatus()
  self.frames.offline:SetHidden( self.isOnline )
  if self.template.Class then self.frames.classTx:SetHidden( not self.isOnline ) end
  -- if isOnline and (not self.health or self.health.current == 0 ) then self:Load(self.unitTag) end  -- If the player was logged out the entire time we've been online, then his data was never truly loaded, lets reload
end

function GGF.Unit:UpdateStatus()
  local isDeadOrOffline = ( self.isDead or not self.isOnline)
  self.frames.healthBd:SetHidden( isDeadOrOffline )
  if self.frames.magickaBd then self.frames.magickaBd:SetHidden( isDeadOrOffline ) end
  if self.frames.staminaBd then self.frames.staminaBd:SetHidden( isDeadOrOffline ) end
  if self.frames.experienceBd and self.template.Experience ~= false then self.frames.experienceBd:SetHidden( isDeadOrOffline ) end
  if self.frames.stealthTx then self.frames.stealthTx:SetHidden( isDeadOrOffline ) end
  if self.frames.leaderTx then self.frames.leaderTx:SetHidden( isDeadOrOffline or not self.isLeader ) end
end

function GGF.Unit:SetRange( isWithinRange )
  self.frames.main:SetAlpha( isWithinRange and 1 or 0.5 )
end

-- helper
function GGF.Unit:FormatStatusBarLabel( format, field )
  -- self.shield
  -- return string.gsub(string.gsub(string.gsub(string.gsub(format, "Percentage", tostring(math.floor(perc)) ), "Max", tostring(max)), "Current", tostring(curr)), "Nothing", "")
  local str = tostring(format):gsub("Percentage", tostring(math.floor(self[field].percent)) )
                             :gsub("Max", tostring(self[field].max))
                             :gsub("Current", tostring(self[field].current))
                             :gsub("Nothing", "")

  if field == "health" and self.shield ~= nil and self.shield.current > 0 then
    str = str:gsub("+ Shield", tostring("+ "..self.shield.current))
  else
    str = str:gsub("+ Shield", "")
  end

  return str
end