-- Global Initalizations
GGF           = {}
GGF.addonName = "ggFrames"
GGF.version   = "0.7.2"

-- Config
GGF.move      = false

function GGF.Initialize( eventCode, addOnName )
  if ( addOnName ~= GGF.addonName ) then return end

  -- Load Saved Vars
  GGF.SavedVars = ZO_SavedVars:NewAccountWide( "GGFSavedVariables" , 1 , nil , GGF.SavedVarsDefaults , nil )
  
  GGF.Theme.Initialize()         -- Load Theme
  GGF.Settings:New()             -- Build Settings Menu
  GGF.UnitManager.Initialize()   -- Initalize UnitManager
  GGF.RegisterSlashCommands()    -- Setup Slash Commands
  GGF.RegisterEvents()           -- Register Global Events

  -- Once we've loaded ours, lets unregister the event listener
  EVENT_MANAGER:UnregisterForEvent("GGF", EVENT_ADD_ON_LOADED)
end

function GGF.ToggleVisibility( eventCode , isReticleHidden )
  GGF.UnitManager.ToggleVisibility( isReticleHidden and not ZO_ChatWindowTextEntryEditBox:HasFocus() )
end 

function GGF.RegisterEvents()
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_RETICLE_HIDDEN_UPDATE , GGF.ToggleVisibility )
end

function GGF.RegisterSlashCommands()
  SLASH_COMMANDS["/ggf"] = function() GGF.Settings:ToggleFrameMovable(true) end
end

-- Hook initialization
EVENT_MANAGER:RegisterForEvent("GGF", EVENT_ADD_ON_LOADED , GGF.Initialize )
