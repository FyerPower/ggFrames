-- Global Initalizations
GGF           = {}
GGF.addonName = "ggFrames"
GGF.version   = "0.1.6"

-- Config
GGF.init      = {}
GGF.move      = false

function GGF.Initialize( eventCode, addOnName )
  -- Only Initialize our addon
  if ( addOnName ~= GGF.addonName ) then return end

  -- Load Saved Vars

  -- Initalize UnitManager
  GGF.UnitManager.Initialize()

  -- Once we've loaded ours, lets unregister the event listener
  EVENT_MANAGER:UnregisterForEvent("GGF", EVENT_ADD_ON_LOADED)

  -- Loaded
  d("|c000099"..GGF.addonName.." v"..GGF.version.." Successfully Loaded|r")
end

-- Hook initialization
EVENT_MANAGER:RegisterForEvent("GGF", EVENT_ADD_ON_LOADED , GGF.Initialize )

-- Update On Each Frame
function GGF.OnUpdate()
end