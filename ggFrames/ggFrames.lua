-- Global Initalizations
GGF           = {}
GGF.addonName = "ggFrames"
GGF.version   = "0.3.1"

-- Config
GGF.init      = {}
GGF.move      = false

function GGF.Initialize( eventCode, addOnName )
  -- Only Initialize our addon
  if ( addOnName ~= GGF.addonName ) then return end

  -- Load Saved Vars
  GGF.SavedVars = ZO_SavedVars:NewAccountWide( "GGFSavedVariables" , 1 , nil , GGF.SavedVarsDefaults , nil )
  GGF.Theme.Initialize()

  -- Initalize UnitManager
  GGF.UnitManager.Initialize()

  -- Build Settings Menu
  GGF.Settings:New()

  -- Register Global Events
  GGF.RegisterEvents()

  -- Once we've loaded ours, lets unregister the event listener
  EVENT_MANAGER:UnregisterForEvent("GGF", EVENT_ADD_ON_LOADED)

  -- Loaded
  -- d("|c000099"..GGF.addonName.." v"..GGF.version.." Successfully Loaded|r")
end

function GGF.ToggleVisibility( eventCode , isReticleHidden )
  hideInterface = (isReticleHidden == true and (ZO_KeybindStripControl:IsHidden() == false or ZO_GameMenu_InGame:IsHidden() == false))
  GGF.UnitManager.ToggleVisibility(hideInterface)
end 

function GGF.RegisterEvents()
  EVENT_MANAGER:RegisterForEvent("GGF", EVENT_RETICLE_HIDDEN_UPDATE , GGF.ToggleVisibility )
end

-- Hook initialization
EVENT_MANAGER:RegisterForEvent("GGF", EVENT_ADD_ON_LOADED , GGF.Initialize )
