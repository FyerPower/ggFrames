GGF.Unit = ZO_Object:Subclass()

-- Create and Initialize a NEW Unit Object (OOP FTW)
function GGF.Unit:New(unitName, baseTemplate, parent)
  local self = ZO_Object.New( self )
  self.unitName = unitName
  self.parent = parent
  self.template = GGF.Utils:TableMerge(GGF.Template[baseTemplate or "Base"], GGF.Template[unitName])   -- Load Template (For Rendering)
  self:Controls()                                                                                      -- Create Frames / Controls
  return self
end

-- Load Unit Data
function GGF.Unit:Load(unitTag)
  self.unitTag = unitTag
  
  -- Name
  self.name = GetUnitName(self.unitTag)
  GGF.Window:SetLabelText( self.frames.nameLb, self.name, (string.sub(self.unitName,0,10) ~= "LargeGroup") )
  
  self:SetConnected( IsUnitOnline(self.unitTag) )
  self:SetDeath( IsUnitDead(self.unitTag) )
  self:SetLevel( GetUnitLevel(self.unitTag), GetUnitVeteranRank(self.unitTag) )             -- Level / Experience
  self:SetClass( GetUnitClass(self.unitTag) )                                               -- Class Texture
  self:SetRange( IsUnitInGroupSupportRange(self.unitTag) )                                  -- Is Within Support Range
  self:SetLeader( IsUnitGroupLeader(self.unitTag) )                                         -- Is Group Leader

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

function GGF.Unit:SetLevel( level, rank )
  if not self.isOnline or not self.template.Level then return end
  self.level = level
  self.vlevel = rank
  self.frames.levelLb:SetText( "("..(self.level == 50 and "Vet "..self.vlevel or self.level)..")" )
end

function GGF.Unit:SetClass( className )
  if not self.template.Class then return end
  self.class = className
  self.frames.classTx:SetTexture( GGF.classTextures[className] )
end

function GGF.Unit:SetExp( current, max, veteran )
  if not self.template.Experience then return end
  self.frames.experienceSt:SetWidth( current / max * self.template.Experience.Bar.Width )
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
  if self.frames.experienceBd then self.frames.experienceBd:SetHidden( isDeadOrOffline ) end
end

function GGF.Unit:SetRange( isWithinRange )
  self.frames.main:SetAlpha( isWithinRange and 1 or 0.5 )
end