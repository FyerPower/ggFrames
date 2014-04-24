GGF.UnitManager = {} 
GGF.UnitManager.unit = {}
GGF.UnitManager.unitRouter = {}

function GGF.UnitManager.Initialize()
  GGF.UnitManager.Controls()
  GGF.UnitManager.frames.player:SetHidden(false)

  -- Create Unit Frames
  GGF.UnitManager.CreateUnit('Player', 'player', nil, GGF.UnitManager.frames.player)
  for i = 1, 3 do GGF.UnitManager.CreateUnit('Group'..i, nil, nil, GGF.UnitManager.frames.group) end
  for i = 1, 24 do GGF.UnitManager.CreateUnit('LargeGroup'..i, nil, "LargeGroupBase", GGF.UnitManager.frames.largeGroup) end

  -- Initialize Group
  GGF.UnitManager.UpdateGroup()

  -- Register Events
  GGF.UnitManager.RegisterEvents()

  -- Ensure Player / Group Frames are Hidden
  ZO_PlayerAttributeHealth:SetHidden(true)
  ZO_PlayerAttributeMagicka:SetHidden(true)
  ZO_PlayerAttributeStamina:SetHidden(true)
  ZO_PlayerAttributeMountStamina:SetHidden(true)
  ZO_UnitFramesGroups:SetHidden(true)
end

function GGF.UnitManager.CreateUnit(unitName, unitTag, baseTemplate, parent)
  GGF.UnitManager.unit[unitName] = GGF.Unit:New(unitName, baseTemplate, parent)
  if unitTag ~= nil then GGF.UnitManager.SetUnit(unitName, unitTag) end
end

function GGF.UnitManager.UnitFunction(unitTag, func, ... )
  if GGF.UnitManager.unitRouter[unitTag] == nil then return end
  for key, unitName in pairs(GGF.UnitManager.unitRouter[unitTag]) do
    GGF.UnitManager.unit[unitName][func](GGF.UnitManager.unit[unitName], ...)
  end
end

function GGF.UnitManager.SetUnit(unitName, unitTag)
  if GGF.UnitManager.unitRouter[unitTag] == nil then GGF.UnitManager.unitRouter[unitTag] = {} end
  table.insert(GGF.UnitManager.unitRouter[unitTag], unitName)
  GGF.UnitManager.unit[unitName]:Load(unitTag)
end

function GGF.UnitManager.UpdateGroup()
  local unitRouter = {["player"] = {"Player"}}
  local groupSlot = 1
  local largeGroupSlot = 1
  for i = 1, 24 do
    unitRouter["group"..i] = {}
    if DoesUnitExist("group"..i) then
      if GetUnitName("group"..i) == GGF.UnitManager.unit['Player'].name then 
        table.insert(unitRouter["group"..i], "Player")
      elseif groupSlot < 4 then
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
  GGF.UnitManager.frames.group:SetHidden( GGF.UnitManager.isLargeGroup )
  GGF.UnitManager.frames.largeGroup:SetHidden( not GGF.UnitManager.isLargeGroup )
end

function GGF.UnitManager.ToggleVisibility(isHidden)
  GGF.UnitManager.frames.player:SetHidden(isHidden)
  GGF.UnitManager.frames.group:SetHidden(isHidden or GGF.UnitManager.isLargeGroup)
  GGF.UnitManager.frames.largeGroup:SetHidden(isHidden or not GGF.UnitManager.isLargeGroup)
end

--
-- Events
--

function GGF.UnitManager.RegisterEvents()
  -- Power Update (AKA: Health / Magicka / Stamina / Horse Stamina)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_POWER_UPDATE, GGF.UnitManager.OnPowerUpdate)
  
  -- Death
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_DEATH_STATE_CHANGED, GGF.UnitManager.OnUnitDeath)
  
  -- Experience / Level
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_LEVEL_UPDATE, GGF.UnitManager.OnUnitLevel)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_VETERAN_RANK_UPDATE, GGF.UnitManager.OnUnitVetLevel)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_EXPERIENCE_UPDATE, GGF.UnitManager.OnExpUpdate)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_VETERAN_POINTS_UPDATE, GGF.UnitManager.OnExpUpdate)

  -- Mount
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_MOUNTED_STATE_CHANGED, GGF.UnitManager.OnMount )

  -- Group
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_MEMBER_CONNECTED_STATUS, GGF.UnitManager.OnGroupMemberConnected)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_SUPPORT_RANGE_UPDATE,    GGF.UnitManager.OnGroupRangeUpdate)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_LEADER_UPDATE,                 GGF.UnitManager.OnLeaderUpdate)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_CREATED,                  GGF.UnitManager.OnUnitUpdate)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_DESTROYED,                GGF.UnitManager.OnUnitUpdate)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_DISBANDED,               GGF.UnitManager.OnUnitUpdate)
end

----------------------------------------
-- Power Update
----------------------------------------

function GGF.UnitManager.OnPowerUpdate( eventCode , unitTag, powerIndex, powerType, powerValue, powerMax, powerEffectiveMax )
  if ( IsReticleHidden() ) then return  end
  if ( powerType == POWERTYPE_HEALTH or ((powerType == POWERTYPE_MAGICKA or powerType == POWERTYPE_STAMINA) and unitTag == 'player' ) ) then 
    GGF.UnitManager.UnitFunction(unitTag, 'SetPower', powerIndex, powerType , powerValue , powerMax , powerEffectiveMax )
  elseif ( powerType == POWERTYPE_MOUNT_STAMINA and unitTag == 'player' ) then
    GGF.UnitManager.UnitFunction(unitTag, 'SetMountPower', powerIndex, powerType , powerValue , powerMax , powerEffectiveMax )
  end 
end

----------------------------------------
-- Death
----------------------------------------

function GGF.UnitManager.OnUnitDeath( eventCode, unitTag, isDead )
  GGF.UnitManager.UnitFunction(unitTag, 'SetDeath', isDead)
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
  GGF.UnitManager.unit["Player"]:SetLeader(IsUnitGroupLeader("player"))
  GGF.UnitManager.UpdateGroup()
end

function GGF.UnitManager.OnGroupMemberConnected( eventCode, unitTag, isOnline )
  GGF.UnitManager.UnitFunction(unitTag, 'SetConnected', isOnline)
end

function GGF.UnitManager.OnGroupRangeUpdate( event, unitTag, isWithinRange )
  GGF.UnitManager.UnitFunction(unitTag, 'SetRange', isWithinRange)
end

function GGF.UnitManager.OnUnitUpdate( eventCode, unitTag )
  if unitTag ~= nil and string.sub(unitTag,0,5) == "group" then
    GGF.UnitManager.UpdateGroup()
  end
end


-- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_ALLIANCE_POINT_UPDATE, GGF.OnAPUpdate)
-- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_MEMBER_ROLES_CHANGED,    GGF.UnitManager.OnGroupRoleChange)  
-- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_MEMBER_JOINED,           GGF.UnitManager.OnGroupMemberJoined)
-- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_INVITE_RESPONSE,         GGF.UnitManager.OnGroupInviteResponse)
-- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_MEMBER_LEFT,             GGF.UnitManager.OnGroupMemberLeft)
-- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_TYPE_CHANGE,             GGF.UnitManager.OnGroupTypeChange)
-- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_DISBANDED,               GGF.UnitManager.OnGroupDisbanded)
-- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_PLAYER_ACTIVATED,              GGF.UnitManager.OnPlayerActivated)
-- control:RegisterForEvent(EVENT_ZONE_UPDATE, OnZoneUpdate)
-- control:RegisterForEvent(EVENT_LEADER_UPDATE, RefreshData)
-- function GGF.UnitManager.OnGroupRoleChange( eventCode, unitTag, isDps, isHeal, isTank ) end
-- function GGF.UnitManager.OnGroupMemberJoined( eventCode, memberName ) end
-- function GGF.UnitManager.OnGroupMemberLeft( eventCode, memberName, reason, wasLocalPlayer ) end
-- function GGF.UnitManager.OnGroupTypeChange( eventCode, isLargeGroup ) end
-- function GGF.UnitManager.OnGroupInviteResponse( eventCode, characterName, response ) end
-- function GGF.UnitManager.OnUnitCreated( eventCode, unitTag ) end
-- function GGF.UnitManager.OnUnitDestroyed( eventCode, unitTag ) end
-- function GGF.UnitManager.OnGroupDisbanded() end