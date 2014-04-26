function GGF.UnitManager.Controls()
  GGF.UnitManager.frames = {}
  GGF.UnitManager.frames.player     = GGF.Window:Create("GGF_Player", nil, CT_TOPLEVELCONTROL, GGF.Theme.Load("PlayerContainer"))
  GGF.UnitManager.frames.group      = GGF.Window:Create("GGF_Group",  nil, CT_TOPLEVELCONTROL, GGF.Theme.Load("GroupContainer"))
  GGF.UnitManager.frames.largeGroup = GGF.Window:Create("GGF_LargeGroup", nil, CT_TOPLEVELCONTROL, GGF.Theme.Load("LargeGroupContainer"))
end
