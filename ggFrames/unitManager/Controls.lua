function GGF.UnitManager.Controls()
  local playerTemplate = GGF.Theme.Load("PlayerContainer")
  GGF.UnitManager.frames.player     = GGF.Window:Create("GGF_Player", nil, CT_TOPLEVELCONTROL, playerTemplate)
  GGF.UnitManager.frames.player:SetMouseEnabled( true )
  GGF.UnitManager.frames.playerBd   = GGF.Window:CreateBackDrop("GGF_PlayerBd", GGF.UnitManager.frames.player, playerTemplate['Label'])
  GGF.UnitManager.frames.playerBd:SetHidden(true)
  GGF.UnitManager.frames.playerLb   = GGF.Window:CreateLabel("GGF_PlayerLb", GGF.UnitManager.frames.playerBd, playerTemplate['Label'])
  GGF.UnitManager.frames.playerLb:SetText("Player")
  
  local groupTemplate = GGF.Theme.Load("GroupContainer")
  GGF.UnitManager.frames.group      = GGF.Window:Create("GGF_Group",  nil, CT_TOPLEVELCONTROL, groupTemplate)
  GGF.UnitManager.frames.group:SetMouseEnabled( true )
  GGF.UnitManager.frames.groupBd   = GGF.Window:CreateBackDrop("GGF_GroupBd", GGF.UnitManager.frames.group, groupTemplate['Label'])
  GGF.UnitManager.frames.groupBd:SetHidden(true)
  GGF.UnitManager.frames.groupLb   = GGF.Window:CreateLabel("GGF_GroupLb", GGF.UnitManager.frames.groupBd, groupTemplate['Label'])
  GGF.UnitManager.frames.groupLb:SetText("Group")

  local largeGroupTemplate = GGF.Theme.Load("LargeGroupContainer")
  GGF.UnitManager.frames.largeGroup   = GGF.Window:Create("GGF_LargeGroup", nil, CT_TOPLEVELCONTROL, largeGroupTemplate)
  GGF.UnitManager.frames.largeGroup:SetMouseEnabled( true )
  GGF.UnitManager.frames.largeGroupBd   = GGF.Window:CreateBackDrop("GGF_LargeGroupBd", GGF.UnitManager.frames.largeGroup, largeGroupTemplate['Label'])
  GGF.UnitManager.frames.largeGroupBd:SetHidden(true)
  GGF.UnitManager.frames.largeGroupLb   = GGF.Window:CreateLabel("GGF_LargeGroupLb", GGF.UnitManager.frames.largeGroupBd, largeGroupTemplate['Label'])
  GGF.UnitManager.frames.largeGroupLb:SetText("Large Group (Raid)")
  
  local targetTemplate = GGF.Theme.Load("TargetContainer")
  GGF.UnitManager.frames.target   = GGF.Window:Create("GGF_Target", nil, CT_TOPLEVELCONTROL, targetTemplate)
  GGF.UnitManager.frames.target:SetMouseEnabled( true )
  GGF.UnitManager.frames.targetBd   = GGF.Window:CreateBackDrop("GGF_TargetBd", GGF.UnitManager.frames.target, targetTemplate['Label'])
  GGF.UnitManager.frames.targetBd:SetHidden(true)
  GGF.UnitManager.frames.targetLb   = GGF.Window:CreateLabel("GGF_TargetLb", GGF.UnitManager.frames.targetBd, targetTemplate['Label'])
  GGF.UnitManager.frames.targetLb:SetText("Target")
end

function GGF.UnitManager.SetMovable()
  GGF.UnitManager.frames.player:SetHidden( false )
  GGF.UnitManager.frames.player:SetMovable( GGF.move )
  GGF.UnitManager.frames.playerBd:SetHidden( not GGF.move )
  GGF.UnitManager.unit["Player"].frames.main:SetAlpha( GGF.move and 0 or 1 )

  GGF.UnitManager.frames.group:SetHidden( false )
  GGF.UnitManager.frames.group:SetMovable( GGF.move )
  GGF.UnitManager.frames.groupBd:SetHidden( not GGF.move )
  for i=1, 3 do
    GGF.UnitManager.unit["Group"..i].frames.main:SetAlpha( GGF.move and 0 or 1 )
  end

  GGF.UnitManager.frames.largeGroup:SetHidden( false )
  GGF.UnitManager.frames.largeGroup:SetMovable( GGF.move )
  GGF.UnitManager.frames.largeGroupBd:SetHidden( not GGF.move )
  for i=1, 24 do
    GGF.UnitManager.unit["LargeGroup"..i].frames.main:SetAlpha( GGF.move and 0 or 1 )
  end

  GGF.UnitManager.frames.target:SetHidden( false )
  GGF.UnitManager.frames.target:SetMovable( GGF.move )
  GGF.UnitManager.frames.targetBd:SetHidden( not GGF.move )
  GGF.UnitManager.unit["Target"].frames.main:SetAlpha( GGF.move and 0 or 1 )
end
