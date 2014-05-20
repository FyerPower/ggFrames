-- Global Initalizations
GGF           = {}
GGF.addonName = 'ggFrames'
GGF.version   = '0.8.3'
GGF.move      = false

function GGF.Initialize( eventCode, addOnName )
  if ( addOnName ~= GGF.addonName ) then return end

  -- Load Saved Vars
  GGF.SavedVars = ZO_SavedVars:NewAccountWide( 'GGFSavedVariables' , 1 , nil , GGF.SavedVarsDefaults , nil )
  GGF.UpgradeSavedVars()

  GGF.Theme.Initialize()         -- Load Theme
  GGF.Settings.New()             -- Build Settings Menu
  GGF.UnitManager.Initialize()   -- Initalize UnitManager
  GGF.RegisterSlashCommands()    -- Setup Slash Commands
  GGF.RegisterEvents()           -- Register Global Events

  -- Once we've loaded ours, lets unregister the event listener
  EVENT_MANAGER:UnregisterForEvent('GGF', EVENT_ADD_ON_LOADED)
end

function GGF.RegisterEvents()
  -- EVENT_MANAGER:RegisterForEvent('GGF', EVENT_RETICLE_HIDDEN_UPDATE , GGF.ToggleVisibility )
  EVENT_MANAGER:RegisterForEvent('GGF', EVENT_PLAYER_ACTIVATED , GGF.OnPlayerActivated )
  EVENT_MANAGER:RegisterForEvent('GGF', EVENT_ACTION_LAYER_POPPED, GGF.ToggleVisibility)
  EVENT_MANAGER:RegisterForEvent('GGF', EVENT_ACTION_LAYER_PUSHED, GGF.ToggleVisibility)
end

function GGF.RegisterSlashCommands()
  SLASH_COMMANDS['/ggf'] = function(text) 
    if text == 'help' then
      d( GGF.Locale:Get('Help') )
    elseif text == 'settings' then
      -- ZO_OptionsWindow:SetHidden(false)
      -- ZO_OptionsWindow_ChangePanels( GGF.Settings.panelID )
    elseif text == 'move' or text == "" then
      GGF.Settings:ToggleFrameMovable(true) 
    end
  end
end

function GGF.OnPlayerActivated()
  d( GGF.Locale:Get('Welcome', GGF.addonName, GGF.version) )
  EVENT_MANAGER:UnregisterForEvent('GGF', EVENT_PLAYER_ACTIVATED)
end

function GGF.ToggleVisibility(eventCode, layerIndex, activeLayerIndex)
  GGF.UnitManager.ToggleVisibility( activeLayerIndex > 2 )
end 

function GGF.UpgradeSavedVars()
  if GGF.IsVersionLowerThan(GGF.SavedVars['SavedVarsVersion'], '0.8.1') then
    GGF.SavedVars['LargeGroup_Width'] = 175
    GGF.SavedVars['LargeGroup_Height'] = 30
    GGF.SavedVars['LargeGroup_Shield_Height'] = 30
    GGF.SavedVars['SavedVarsVersion'] = '0.8.1'
  end
end

function GGF.IsVersionLowerThan(version, comparison)
  local major,  minor,  patch  = version:match('([0-9]+).([0-9]+).([0-9]+)')
  local cmajor, cminor, cpatch = comparison:match('([0-9]+).([0-9]+).([0-9]+)')
  
  if tonumber(major) < tonumber(cmajor) then return true end
  if tonumber(major) == tonumber(cmajor) and tonumber(minor) < tonumber(cminor) then return true end
  if tonumber(major) == tonumber(cmajor) and tonumber(minor) == tonumber(cminor) and tonumber(patch) < tonumber(cpatch) then return true end
  return false
end

-- Hook initialization
EVENT_MANAGER:RegisterForEvent('GGF', EVENT_ADD_ON_LOADED , GGF.Initialize )


-- TODO: Play Sound Based On Unit / Group Life
-- TODO: Of The Warlock Timers