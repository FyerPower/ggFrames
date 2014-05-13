-- Performance Enhancement
local GGF = GGF

-- Initializations
GGF.UnitManager = {} 
GGF.UnitManager.unit = {}
GGF.UnitManager.unitRouter = {}
GGF.UnitManager.isInCombat = false

function GGF.UnitManager.Initialize()
  GGF.UnitManager.frames = {}
  GGF.UnitManager.Controls()
  GGF.UnitManager.frames.player:SetHidden(false)

  -- Create Unit Frames
  GGF.UnitManager.unit['Player'] = GGF.Unit:New('Player', nil, GGF.UnitManager.frames.player)
  GGF.UnitManager.unit['Target'] = GGF.Unit:New('Target', nil, GGF.UnitManager.frames.target)
  for i = 1, 3 do 
    GGF.UnitManager.unit['Group'..i] = GGF.Unit:New('Group'..i, nil, GGF.UnitManager.frames.group) 
  end
  for i = 1, 24 do 
    GGF.UnitManager.unit['LargeGroup'..i] = GGF.Unit:New('LargeGroup'..i, "LargeGroupBase", GGF.UnitManager.frames.largeGroup) 
  end

  -- Route & Load Player
  GGF.UnitManager.playerName = GetUnitName('player')
  if GGF.SavedVars['Display_Player'] then
    GGF.UnitManager.SetUnit('Player', 'player')
  end
  
  -- Route & Load Target
  if GGF.SavedVars['Display_Player'] then
    GGF.UnitManager.SetUnit('Target', 'reticleover')
    GGF.UnitManager.unit["Target"]:Unload()
  end

  -- Initialize Group
  GGF.UnitManager.UpdateGroup()

  -- Register Events
  GGF.UnitManager.RegisterEvents()

  -- Ensure Player / Group Frames are Hidden
  GGF.UnitManager.SetDisplayVisability()
end

function GGF.UnitManager.SetDisplayVisability()
  ZO_PlayerAttributeHealth:SetHidden( not GGF.SavedVars['Display_Default_Player'] )
  ZO_PlayerAttributeMagicka:SetHidden( not GGF.SavedVars['Display_Default_Player'] )
  ZO_PlayerAttributeStamina:SetHidden( not GGF.SavedVars['Display_Default_Player'] )
  ZO_PlayerAttributeMountStamina:SetHidden( not GGF.SavedVars['Display_Default_Player'] )
  ZO_TargetUnitFramereticleover:SetHidden( not GGF.SavedVars['Display_Default_Target'] )
  ZO_UnitFramesGroups:SetHidden( not GGF.SavedVars['Display_Default_Group'] )
end

function GGF.UnitManager.SetUnit(unitName, unitTag)
  if GGF.UnitManager.unitRouter[unitTag] == nil then GGF.UnitManager.unitRouter[unitTag] = {} end
  table.insert(GGF.UnitManager.unitRouter[unitTag], unitName)
  GGF.UnitManager.unit[unitName]:Load(unitTag)
end

-- All function calls to the unit must go through this function
function GGF.UnitManager.UnitFunction(unitTag, func, ... )
  if GGF.UnitManager.unitRouter[unitTag] == nil or GGF.move then return end
  for key, unitName in pairs(GGF.UnitManager.unitRouter[unitTag]) do
    GGF.UnitManager.unit[unitName][func](GGF.UnitManager.unit[unitName], ...)
  end
end

function GGF.UnitManager.UpdateGroup()
  if GGF.move then return end
  local unitRouter = {}
  if GGF.SavedVars['Display_Player'] then unitRouter["player"] = {"Player"} end
  if GGF.SavedVars['Display_Target'] then unitRouter["reticleover"] = {"Target"} end

  local groupSlot = 1
  local largeGroupSlot = 1
  for i = 1, 24 do
    unitRouter["group"..i] = {}
    if DoesUnitExist("group"..i) and GGF.SavedVars['Display_Group'] then
      -- TODO: If the Player Frame is OFF, Include Player in group
      if groupSlot < 4 and GetUnitName("group"..i) ~= GGF.UnitManager.playerName then
        table.insert(unitRouter["group"..i], "Group"..groupSlot)
        GGF.UnitManager.unit["Group"..groupSlot]:Load("group"..i)
        groupSlot = groupSlot + 1
      end
      table.insert(unitRouter["group"..i], "LargeGroup"..largeGroupSlot)
      GGF.UnitManager.unit["LargeGroup"..largeGroupSlot]:Load("group"..i)
      largeGroupSlot = largeGroupSlot + 1
    else
      if GGF.UnitManager.unitRouter["group"..i] then
        for key, unitName in pairs(GGF.UnitManager.unitRouter["group"..i]) do
          if unitName ~= "Player" then GGF.UnitManager.unit[unitName]:Unload() end
        end
      end
    end
  end

  -- Unload all unit slots after our last slot (this should NOT be necessary)
  for j = groupSlot, 3 do GGF.UnitManager.unit["Group"..j]:Unload() end
  for k = largeGroupSlot, 24 do GGF.UnitManager.unit["LargeGroup"..k]:Unload() end

  GGF.UnitManager.unitRouter = unitRouter
  GGF.UnitManager.groupSize = GetGroupSize()
  GGF.UnitManager.isLargeGroup = (GGF.UnitManager.groupSize > 4)
  
  local displayRaid = GGF.UnitManager.isLargeGroup or GGF.SavedVars['Group_Condensed']
  GGF.UnitManager.frames.group:SetHidden( displayRaid )
  GGF.UnitManager.frames.largeGroup:SetHidden( not displayRaid )
  
  GGF.UnitManager.UnitFunction('player', 'SetLeader', IsUnitGroupLeader("player"))
end

function GGF.UnitManager.ToggleVisibility(isHidden)
  if GGF.move then return end
  GGF.UnitManager.frames.player:SetHidden(isHidden)
  GGF.UnitManager.frames.target:SetHidden(isHidden)
  
  local displayRaid = GGF.UnitManager.isLargeGroup or GGF.SavedVars['Group_Condensed']
  GGF.UnitManager.frames.group:SetHidden(isHidden or displayRaid)
  GGF.UnitManager.frames.largeGroup:SetHidden(isHidden or not displayRaid)
end

function GGF.UnitManager.RefreshControls(section)
  if( section == nil or section == "Player" ) then
    GGF.Theme.LoadPlayer()
    GGF.UnitManager.UnitFunction('player', 'Controls')
    GGF.UnitManager.UnitFunction('player', 'Reload')
    GGF.UnitManager.frames.player:SetHidden(false)
  end
  if( section == nil or section == "Group" ) then
    GGF.Theme.LoadGroup()
    for i = 1, 4 do
      GGF.UnitManager.UnitFunction('group'..i, 'Controls')
    end
    GGF.UnitManager.UpdateGroup()
  end
  if( section == nil or section == "LargeGroup" ) then
    GGF.Theme.LoadLargeGroup()
    for i = 1, 24 do
      GGF.UnitManager.UnitFunction('group'..i, 'Controls')
    end
    GGF.UnitManager.UpdateGroup()
  end
  if( section == nil or section == "Target" ) then
    GGF.Theme.LoadTarget()
    GGF.UnitManager.UnitFunction('reticleover', 'Controls')
    GGF.UnitManager.UnitFunction('reticleover', 'Reload')
  end
  GGF.UnitManager.SetDisplayVisability()
  GGF.UnitManager.Controls()
end

--
-- Events
--

function GGF.UnitManager.RegisterEvents()
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_POWER_UPDATE,                  GGF.UnitManager.OnPowerUpdate)             -- Power Update (AKA: Health / Magicka / Stamina / Horse Stamina)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_MOUNTED_STATE_CHANGED,         GGF.UnitManager.OnMount )                  -- Mount
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_DEATH_STATE_CHANGED,      GGF.UnitManager.OnUnitDeath)               -- Death
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_PLAYER_ALIVE,                  GGF.UnitManager.OnPlayerAlive)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_LEVEL_UPDATE,                  GGF.UnitManager.OnUnitLevel)               -- Level
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_VETERAN_RANK_UPDATE,           GGF.UnitManager.OnUnitVetLevel)            -- Level
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_EXPERIENCE_UPDATE,             GGF.UnitManager.OnExpUpdate)               -- Experience
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_VETERAN_POINTS_UPDATE,         GGF.UnitManager.OnExpUpdate)               -- Experience
  -- EVENT_ALLIANCE_POINT_UPDATE
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_MEMBER_CONNECTED_STATUS, GGF.UnitManager.OnGroupMemberConnected)    -- Group
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_SUPPORT_RANGE_UPDATE,    GGF.UnitManager.OnGroupRangeUpdate)        -- Group
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_LEADER_UPDATE,                 GGF.UnitManager.OnLeaderUpdate)            -- Group
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_CREATED,                  GGF.UnitManager.OnUnitUpdate)              -- Group
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_DESTROYED,                GGF.UnitManager.OnUnitUpdate)              -- Group
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_DISBANDED,               GGF.UnitManager.OnUnitUpdate)              -- Group
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_TARGET_CHANGED,                GGF.UnitManager.OnTargetChange)            -- Target
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_RETICLE_TARGET_CHANGED,        GGF.UnitManager.OnReticleTargetChange)     -- Target
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED,   GGF.UnitManager.OnVisualizationAdded)      -- Sheilds
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED, GGF.UnitManager.OnVisualizationRemoved)    -- Sheilds
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED, GGF.UnitManager.OnVisualizationUpdated)    -- Sheilds
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_PLAYER_COMBAT_STATE,           GGF.UnitManager.OnCombatStateChange)       -- Misc
end

----------------------------------------
-- Power Update
----------------------------------------

function GGF.UnitManager.OnPowerUpdate( eventCode , unitTag, powerIndex, powerType, powerValue, powerMax, powerEffectiveMax )
  if ( powerType == POWERTYPE_HEALTH or ((powerType == POWERTYPE_MAGICKA or powerType == POWERTYPE_STAMINA) and unitTag == 'player' ) ) then 
    GGF.UnitManager.UnitFunction(unitTag, 'SetPower', powerIndex, powerType , powerValue , powerMax , powerEffectiveMax )
  elseif ( powerType == POWERTYPE_MOUNT_STAMINA and unitTag == 'player' ) then
    GGF.UnitManager.UnitFunction(unitTag, 'SetMountPower', powerIndex, powerType , powerValue , powerMax , powerEffectiveMax )
  end 
  if unitTag == 'player' then GGF.UnitManager.UpdateFrameOpacity() end
end

----------------------------------------
-- Death
----------------------------------------

function GGF.UnitManager.OnUnitDeath( eventCode, unitTag, isDead )
  GGF.UnitManager.UnitFunction(unitTag, 'SetDeath', isDead)
end

function GGF.UnitManager.OnPlayerAlive( eventCode )
  GGF.UnitManager.UnitFunction('player', 'SetDeath', false)
  GGF.UnitManager.UnitFunction('player', 'Reload')
end

----------------------------------------
-- Level / Experience
----------------------------------------

function GGF.UnitManager.OnUnitLevel( eventCode, unitTag, level )
  GGF.UnitManager.UnitFunction(unitTag, 'SetLevel', level, GetUnitVeteranRank(unitTag))
end
function GGF.UnitManager.OnUnitVetLevel( eventCode, unitTag, rank )
  GGF.UnitManager.UnitFunction(unitTag, 'SetLevel', GetUnitLevel(unitTag), rank)
end

function GGF.UnitManager.OnExpUpdate( eventCode, unitTag, currentExp, maxExp, reason )
  if ( unitTag ~= "player" or reason == XP_REASON_FINESSE ) then return end
  GGF.UnitManager.UnitFunction(unitTag, 'SetExp', currentExp, maxExp, (eventCode==EVENT_VETERAN_POINTS_UPDATE))
end

----------------------------------------
-- Events: Mount
----------------------------------------

function GGF.UnitManager.OnMount( eventCode, isMounted )
  GGF.UnitManager.UnitFunction('player', 'SetMounted', isMounted)
end

----------------------------------------
-- Events: Groups
----------------------------------------

function GGF.UnitManager.OnLeaderUpdate( eventCode, ... )
  GGF.UnitManager.UpdateGroup()
end

function GGF.UnitManager.OnGroupMemberConnected( eventCode, unitTag, isOnline )
  GGF.UnitManager.UnitFunction(unitTag, 'SetConnected', isOnline)
end

function GGF.UnitManager.OnGroupRangeUpdate( event, unitTag, isWithinRange )
  GGF.UnitManager.UnitFunction(unitTag, 'SetRange', isWithinRange)
end

-- zo_strfind(unitTag, "group") == 1
function GGF.UnitManager.OnUnitUpdate( eventCode, unitTag )
  if unitTag ~= nil and string.sub(unitTag,0,5) == "group" then
    GGF.UnitManager.UpdateGroup()
  end
end

----------------------------------------
-- Events: Target
----------------------------------------

function GGF.UnitManager.OnTargetChange( eventCode, unitTag )
  if unitTag ~= "player" then return end
  GGF.UnitManager.OnReticleTargetChange(eventCode)
end

function GGF.UnitManager.OnReticleTargetChange( eventCode )
  if DoesUnitExist("reticleover") then
    GGF.UnitManager.UnitFunction('reticleover', 'Reload', nil)
  else
    GGF.UnitManager.UnitFunction('reticleover', 'Unload', nil)
  end
  ZO_TargetUnitFramereticleover:SetHidden( not GGF.SavedVars['Display_Default_Target'] )
end

----------------------------------------
-- Events: Shields
----------------------------------------

-- Others: Decreased / Increased Max Power, Regen Power, or Stat | Unwavering Power | Automatic | None
function GGF.UnitManager.OnVisualizationAdded( eventCode, unitTag, unitAttributeVisual, statType, attributeType, powerType, value, maxValue )
  if unitAttributeVisual ~= ATTRIBUTE_VISUAL_POWER_SHIELDING then return end
  GGF.UnitManager.UnitFunction(unitTag, 'UpdateShield', value, maxValue)
end

function GGF.UnitManager.OnVisualizationRemoved( eventCode, unitTag, unitAttributeVisual, statType, attributeType, powerType, value, maxValue )
  if unitAttributeVisual ~= ATTRIBUTE_VISUAL_POWER_SHIELDING then return end
  GGF.UnitManager.UnitFunction(unitTag, 'UpdateShield', 0, maxValue)
end

function GGF.UnitManager.OnVisualizationUpdated( eventCode, unitTag, unitAttributeVisual, statType, attributeType, powerType, oldValue, newValue, oldMax, newMax )
  if unitAttributeVisual ~= ATTRIBUTE_VISUAL_POWER_SHIELDING then return end
  GGF.UnitManager.UnitFunction(unitTag, 'UpdateShield', newValue, newMax)
end

----------------------------------------
-- Events: Misc
----------------------------------------

function GGF.UnitManager.OnCombatStateChange( eventCode, isInCombat )
  GGF.UnitManager.isInCombat = isInCombat
  GGF.UnitManager.UpdateFrameOpacity()
end

function GGF.UnitManager.UpdateFrameOpacity()
  if GGF.SavedVars['Display_Player'] then
    local player = GGF.UnitManager.unit.Player
    showFully = GGF.UnitManager.isInCombat or player.health.percent ~= 100 or player.magicka.percent ~= 100 or player.stamina.percent ~= 100 or player.mount.percent ~= 100
    GGF.UnitManager.frames.player:SetAlpha( showFully and 1 or GGF.SavedVars['Player_Combat_Alpha']/100 )
    GGF.UnitManager.frames.target:SetAlpha( showFully and 1 or GGF.SavedVars['Target_Combat_Alpha']/100 )
  end
end







-- Events:
  -- ZO: EVENT_BOSSES_CHANGED
  -- ZO: EVENT_DISPOSITION_UPDATE
  -- ZO: EVENT_RANK_POINT_UPDATE
  -- Visual: EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED 
  -- Visual: EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED 
  -- Visual: EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED 
  -- Siege: EVENT_BEGIN_SIEGE_CONTROL
  -- Siege: EVENT_END_SIEGE_CONTROL
  -- Combat: EVENT_PLAYER_COMBAT_STATE 
  -- Zone: EVENT_ZONE_UPDATE 
-- Zone: EVENT_ZONE_CHANGED 

-- IsUnitPlayer(unitTag)
-- IsUnitAttackable(unitTag) -> boolean

-- CombatUnitType
  -- COMBAT_UNIT_TYPE_GROUP
  -- COMBAT_UNIT_TYPE_NONE
  -- COMBAT_UNIT_TYPE_OTHER
  -- COMBAT_UNIT_TYPE_PLAYER
  -- COMBAT_UNIT_TYPE_PLAYER_PET