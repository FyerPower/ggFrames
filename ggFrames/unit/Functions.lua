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
function GGF.Unit:Load(unitTag)
  self.unitTag = unitTag
  
  self:SetName( GetUnitName(self.unitTag) )
  self:SetConnected( IsUnitOnline(self.unitTag) )
  self:SetDeath( IsUnitDead(self.unitTag) )
  self:SetLevel( GetUnitLevel(self.unitTag), GetUnitVeteranRank(self.unitTag) )             -- Level / Experience
  self:SetRange( IsUnitInGroupSupportRange(self.unitTag) )                                  -- Is Within Support Range

  if self.unitName == "Target" then
    self:SetCaption( GetUnitCaption(self.unitTag) or GetUnitTitle(self.unitTag) )
    self:SetAllianceRank( GetUnitAvARank(self.unitTag) )
    self:SetDifficulty( GetUnitDifficulty(self.unitTag) )
  end
  
  if IsUnitPlayer(self.unitTag) then
    self:SetClass( GetUnitClassId(self.unitTag) )                                             -- Class Texture
    self:SetLeader( IsUnitGroupLeader(self.unitTag) )                                       -- Is Group Leader (Non-Players are never Group Leaders)
  else 
    self:SetClass( nil )
    self:SetLeader( false )
  end

  self:SetPower( nil, POWERTYPE_HEALTH, GetUnitPower(self.unitTag, POWERTYPE_HEALTH) )      -- Set Health
  self:UpdateShield( GetUnitAttributeVisualizerEffectInfo(self.unitTag, ATTRIBUTE_VISUAL_POWER_SHIELDING, STAT_MITIGATION, ATTRIBUTE_HEALTH, POWERTYPE_HEALTH) )
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
  local field = ""
  if     ( powerType == POWERTYPE_HEALTH  ) then field = {friendly = "health",  label = "Health"}
  elseif ( powerType == POWERTYPE_MAGICKA ) then field = {friendly = "magicka", label = "Magicka"}
  elseif ( powerType == POWERTYPE_STAMINA ) then field = {friendly = "stamina", label = "Stamina"}
  else return end

  if powerType == POWERTYPE_HEALTH and powerValue > 0 then self:SetDeath( false ) end -- should fix when the event_unit_dead doesn't fire after a player revives
  if not self.template[field.label] then return end

  self[field.friendly] = {current = powerValue, max = powerEffectiveMax, percent = ( ( powerValue / powerEffectiveMax ) * 100 )}
  self.frames[field.friendly.."St"]:SetWidth( ( self[field.friendly].percent / 100 ) * self.template[field.label].Bar.Width )
  if self.frames[field.friendly.."LbOne"] then self.frames[field.friendly.."LbOne"]:SetText( FormatStatusBarLabel(GGF.SavedVars['Bar_Format'], self[field.friendly].current, self[field.friendly].max, self[field.friendly].percent) ) end
  if self.frames[field.friendly.."LbTwo"] then self.frames[field.friendly.."LbTwo"]:SetText( FormatStatusBarLabel(GGF.SavedVars['Bar_Format_Two'], self[field.friendly].current, self[field.friendly].max, self[field.friendly].percent) ) end
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
  self.frames.levelLb:SetText( "("..(self.vlevel > 0 and "Vet "..self.vlevel or self.level)..")" )
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
end

function GGF.Unit:SetRange( isWithinRange )
  self.frames.main:SetAlpha( isWithinRange and 1 or 0.5 )
end




-- helper
function FormatStatusBarLabel( format, curr, max, perc )
  return string.gsub(string.gsub(string.gsub(string.gsub(format, "Percentage", tostring(math.floor(perc)) ), "Max", tostring(max)), "Current", tostring(curr)), "Nothing", "")
  -- tostring(perc)
end