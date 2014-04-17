
--
-- Unit Manager
--
-- "player" -you
-- "reticleover" -your target
-- "reticleovertarget" - target of your target
-- "group1" ... "group4" -other group members
--

GGF.UnitManager = { units = {} }

function GGF.UnitManager.Initialize()
  GGF.UnitManager.CreateUnit('player')
  GGF.UnitManager.RegisterEvents()
end

function GGF.UnitManager.CreateUnit(unitTag)
  GGF.UnitManager.units[unitTag] = GGF.Unit.Initialize(unitTag)
end

function GGF.UnitManager.RegisterEvents()
  -- Power Update (AKA: Health / Magicka / Stamina / Horse Stamina)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_POWER_UPDATE, GGF.UnitManager.OnPowerUpdate)
  
  -- Death
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_UNIT_DEATH_STATE_CHANGED, GGF.UnitManager.OnUnitDeath)
  
  -- Experience / Level
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_LEVEL_UPDATE, GGF.UnitManager.OnUnitLevel)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_EXPERIENCE_UPDATE, GGF.UnitManager.OnExpUpdate)
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_VETERAN_POINTS_UPDATE, GGF.UnitManager.OnExpUpdate)
  -- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_ALLIANCE_POINT_UPDATE, GGF.OnAPUpdate)

  -- Mount
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_MOUNTED_STATE_CHANGED, GGF.UnitManager.OnMount )


  -- Group
  -- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_MEMBER_ROLES_CHANGED, GGF.UnitManager.OnGroupRoleChange)  
  -- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_MEMBER_CONNECTED_STATUS, GGF.UnitManager.OnGroupMemberConnected)
  -- EVENT_MANAGER:RegisterForEvent("GGF", EVENT_GROUP_SUPPORT_RANGE_UPDATE, GGF.UnitManager.OnGroupRangeUpdate)
end

function GGF.UnitManager.OnUnitLevel( eventCode, unitTag, level )
  if GGF.UnitManager.units[unitTag] == nil then return  end
  GGF.UnitManager.units[unitTag]:SetLevel(level)
end

function GGF.UnitManager.OnPowerUpdate( eventCode , unitTag, powerIndex, powerType, powerValue, powerMax, powerEffectiveMax )
  if ( GGF.UnitManager.units[unitTag] == nil or IsReticleHidden() ) then return  end
  if ( powerType == POWERTYPE_HEALTH or powerType == POWERTYPE_MAGICKA or powerType == POWERTYPE_STAMINA ) then 
    GGF.UnitManager.units[unitTag]:SetPower( powerIndex, powerType , powerValue , powerMax , powerEffectiveMax )
  elseif ( powerType == POWERTYPE_MOUNT_STAMINA ) then
    GGF.UnitManager.units[unitTag]:SetMountPower( powerIndex, powerType , powerValue , powerMax , powerEffectiveMax )
  end 
end

function GGF.UnitManager.OnUnitDeath( eventCode, unitTag, isDead )
  if GGF.UnitManager.units[unitTag] == nil then return  end
  GGF.UnitManager.units[unitTag]:SetDeath(isDead)
  -- UpdateStatus(unitTag, isDead, IsUnitOnline(unitTag))
end

function GGF.UnitManager.OnExpUpdate( eventCode, unitTag, currentExp, maxExp, reason )
  if ( unitTag ~= "player" or reason == XP_REASON_FINESSE or GGF.UnitManager.units[unitTag] == nil ) then return end
  GGF.UnitManager.units[unitTag]:SetExp(currentExp, maxExp, (eventCode==EVENT_VETERAN_POINTS_UPDATE))
end

--
-- Mount
--
function GGF.UnitManager.OnMount( eventCode, isMounted )
  if GGF.UnitManager.units['player'] == nil then return  end
  GGF.UnitManager.units['player']:SetMounted(isMounted)
end


--
-- GROUP
-- It appears as if all group functions will return "groupX" instead of "player" for whenever the player is affected. (Need to route that to player)
--

function GGF.UnitManager.OnGroupRoleChange( eventCode, unitTag, isDps, isHeal, isTank )
end

-- Players who change zones (aka trigger a loading screen) causes the game to think they disconnected and reconnect when the player finishes loading
function GGF.UnitManager.OnGroupMemberConnected( eventCode, unitTag, isOnline )
end

-- Players within range when group is formed gets this triggered
function GGF.UnitManager.OnGroupRangeUpdate( event, unitTag, isWithinRange )
end