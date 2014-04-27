GGF.Unit = ZO_Object:Subclass()

-- Create and Initialize a NEW Unit Object (OOP FTW)
function GGF.Unit:New(unitName, baseTemplate, parent)
  local self = ZO_Object.New( self )
  self.unitName = unitName
  self.parent = parent
  self.frames = {}
  self:Controls()                            -- Create Frames / Controls
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
  self:SetCaption( GetUnitCaption(self.unitTag) )
  
  if IsUnitPlayer(self.unitTag) then
    self:SetClass( GetUnitClass(self.unitTag) )                                             -- Class Texture
    self:SetLeader( IsUnitGroupLeader(self.unitTag) )                                       -- Is Group Leader (Non-Players are never Group Leaders)
  else 
    self:SetClass( nil )
  end

  self:SetPower( nil, POWERTYPE_HEALTH, GetUnitPower(self.unitTag, POWERTYPE_HEALTH) )      -- Set Health
  if self.unitTag == "player" then
    self:SetPower( nil, POWERTYPE_MAGICKA, GetUnitPower(self.unitTag, POWERTYPE_MAGICKA) )  -- Set Magicka
    self:SetPower( nil, POWERTYPE_STAMINA, GetUnitPower(self.unitTag, POWERTYPE_STAMINA) )  -- Set Stamina
    
    if IsUnitVeteran(self.unitTag) then
      self:SetExp( GetUnitVeteranPoints(self.unitTag), GetUnitVeteranPointsMax(self.unitTag), true )
    else
      self:SetExp( GetUnitXP(self.unitTag), GetUnitXPMax(self.unitTag), false )
    end
    self:SetMounted( IsMounted() )
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

  self[field.friendly] = {current = powerValue, max = powerMax, percent = math.floor( ( powerValue / powerEffectiveMax ) * 100 )}
  self.frames[field.friendly.."St"]:SetWidth( ( self[field.friendly].percent / 100 ) * self.template[field.label].Bar.Width )
  if self.template[field.label].TextLeft then self.frames[field.friendly.."LeftLb"]:SetText( powerValue ) end
  if self.template[field.label].RightLeft then self.frames[field.friendly.."RightLb"]:SetText( self[field.friendly].percent .. "%" ) end
end

function GGF.Unit:SetMountPower( powerIndex, powerType, powerValue, powerMax, powerEffectiveMax )
  if not self.template.Mount then return end
  self.mount = {current = powerValue, max = powerMax, percent = math.floor( ( powerValue / powerEffectiveMax ) * 100 )}
  self.frames.mountSt:SetWidth( ( self.mount.percent / 100 ) * self.template.Mount.BarArea.Bar.Width )
end

function GGF.Unit:SetMounted( isMounted )
  if not self.template.Mount then return end
  self.isMounted = isMounted
  self.frames.mount:SetHidden( not self.isMounted )
end

function GGF.Unit:SetName( name )
  self.name = name
  GGF.Window:SetLabelText( self.frames.nameLb, self.name, (string.sub(self.unitName,0,10) ~= "LargeGroup") )

  self.reactionType = GetUnitReaction( self.unitTag )
  if( self.unitName == "Target" and (self.reactionType == UNIT_REACTION_FRIENDLY) )then
    self.frames.nameLb:SetColor(GGF.SavedVars['Target_FontColor_Friendly'][1], GGF.SavedVars['Target_FontColor_Friendly'][2], GGF.SavedVars['Target_FontColor_Friendly'][3], GGF.SavedVars['Target_FontColor_Friendly'][4])
    if self.template.Caption then self.frames.captionLb:SetColor(GGF.SavedVars['Target_FontColor_Friendly'][1], GGF.SavedVars['Target_FontColor_Friendly'][2], GGF.SavedVars['Target_FontColor_Friendly'][3], GGF.SavedVars['Target_FontColor_Friendly'][4]) end
  elseif self.unitName == "Target" and self.reactionType == UNIT_REACTION_HOSTILE then
    self.frames.nameLb:SetColor(GGF.SavedVars['Target_FontColor_Hostile'][1], GGF.SavedVars['Target_FontColor_Hostile'][2], GGF.SavedVars['Target_FontColor_Hostile'][3], GGF.SavedVars['Target_FontColor_Hostile'][4])
    if self.template.Caption then self.frames.captionLb:SetColor(GGF.SavedVars['Target_FontColor_Hostile'][1], GGF.SavedVars['Target_FontColor_Hostile'][2], GGF.SavedVars['Target_FontColor_Hostile'][3], GGF.SavedVars['Target_FontColor_Hostile'][4]) end
  elseif self.unitName == "Target" and self.reactionType == UNIT_REACTION_INTERACT then
    self.frames.nameLb:SetColor(GGF.SavedVars['Target_FontColor_Interact'][1], GGF.SavedVars['Target_FontColor_Interact'][2], GGF.SavedVars['Target_FontColor_Interact'][3], GGF.SavedVars['Target_FontColor_Interact'][4])
    if self.template.Caption then self.frames.captionLb:SetColor(GGF.SavedVars['Target_FontColor_Interact'][1], GGF.SavedVars['Target_FontColor_Interact'][2], GGF.SavedVars['Target_FontColor_Interact'][3], GGF.SavedVars['Target_FontColor_Interact'][4]) end
  else
    self.frames.nameLb:SetColor(GGF.SavedVars['Target_FontColor'][1], GGF.SavedVars['Target_FontColor'][2], GGF.SavedVars['Target_FontColor'][3], GGF.SavedVars['Target_FontColor'][4])
    if self.template.Caption then self.frames.captionLb:SetColor(GGF.SavedVars['Target_FontColor'][1], GGF.SavedVars['Target_FontColor'][2], GGF.SavedVars['Target_FontColor'][3], GGF.SavedVars['Target_FontColor'][4]) end
  end
end

function GGF.Unit:SetLevel( level, rank )
  if not self.isOnline or not self.template.Level then return end
  self.level = level
  self.vlevel = rank
  self.frames.levelLb:SetText( "("..(self.vlevel > 0 and "Vet "..self.vlevel or self.level)..")" )
  self.frames.levelLb:SetHidden( self.reactionType == UNIT_REACTION_FRIENDLY )
end

-- For now, only display caption for friend npcs (aka merchants and stuff)
function GGF.Unit:SetCaption( caption )
  if not self.template.Caption then return end
  self.caption = self.reactionType == UNIT_REACTION_FRIENDLY and caption or ""
  self.frames.captionLb:SetText( self.caption )
end

function GGF.Unit:SetClass( className )
  if not self.template.Class then return end
  self.class = className
  if className then
    self.frames.classTx:SetTexture( GGF.classTextures[className] )
    self.frames.classTx:SetHidden(false)
  else
    self.frames.classTx:SetHidden(true)
  end
end

function GGF.Unit:SetExp( current, max, veteran )
  if not self.template.Experience then return end
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
  if string.sub(self.unitName,0,10) ~= "LargeGroup" then
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


-- GetUnitReaction(unitTag)
  -- UNIT_REACTION_PLAYER_ALLY
  -- UNIT_REACTION_FRIENDLY -- green
  -- UNIT_REACTION_HOSTILE  -- red
  -- UNIT_REACTION_INTERACT -- yellow
  -- UNIT_REACTION_DEAD 
  -- UNIT_REACTION_DEFAULT
  -- UNIT_REACTION_NEUTRAL
  -- UNIT_REACTION_NPC_ALLY (Pet)

-- GetUnitDifficulty
-- MONSTER_DIFFICULTY_NORMAL
-- MONSTER_DIFFICULTY_EASY
-- MONSTER_DIFFICULTY_HARD
-- MONSTER_DIFFICULTY_DEADLY
-- MONSTER_DIFFICULTY_NONE