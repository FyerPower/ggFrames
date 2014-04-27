function GGF.Settings:Controls()
  local fontOptions = GGF.Theme.fonts
  local textureOptions = GGF.Theme.textures

  local LAM = LibStub("LibAddonMenu-1.0")
  local panelID = LAM:CreateControlPanel( "ggFrameSettingMenu", "ggFrames")
  header = LAM:AddHeader(panelID, "ggFrameSettingMenuHeader", "Version |cAA0000"..GGF.version.."|r by |c00AA00@gamegenius86|r")

  header:SetHandler("OnShow", function() ZO_OptionsWindowResetToDefaultButton:SetAlpha(0); end)
  header:SetHandler("OnHide", function() ZO_OptionsWindowResetToDefaultButton:SetAlpha(1); end)

  LAM:AddCheckbox(   panelID, "ggFramesSettingFrameLock", GGF.locale['Frame_Lock'], nil, function()  return not self:IsFrameMovable() end, function() self:ToggleFrameMovable() end )
  
  LAM:AddHeader(panelID, 'ggFrameSettingPlayer', 'Frame: Player' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerWidth',            GGF.locale['Player_Width'], nil, 200, 400, 5,              function() return self:GetValue('Player_Width') end,             function( val ) self:SetValue('Player_Width',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerFont",             GGF.locale['Player_Font'], nil, fontOptions,               function() return self:GetValue('Player_Font') end,              function( val ) self:SetValue('Player_Font',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerFontSize',         GGF.locale['Player_FontSize'], nil, 10, 30, 1,             function() return self:GetValue('Player_FontSize') end,          function( val ) self:SetValue('Player_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerFontColor",        GGF.locale['Player_FontColor'], nil,                       function() return self:GetColor('Player_FontColor') end,         function( r,g,b,a ) self:SetColor('Player_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(panelID, 'ggFrameSettingPlayerHealth', 'Player Frame: Health' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerHealthHeight',     GGF.locale['Player_Health_Height'], nil, 10, 60, 2,        function() return self:GetValue('Player_Health_Height') end,     function( val ) self:SetValue('Player_Health_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerHealthColor",      GGF.locale['Player_Health_BarColor'], nil,                 function() return self:GetColor('Player_Health_BarColor') end,   function( r,g,b,a ) self:SetColor('Player_Health_BarColor',r,g,b,a) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerHealthTexture",    GGF.locale['Player_Health_Texture'], nil, textureOptions,  function() return self:GetValue('Player_Health_Texture') end,    function( val ) self:SetValue('Player_Health_Texture',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerHealthFont",       GGF.locale['Player_Health_Font'], nil, fontOptions,        function() return self:GetValue('Player_Health_Font') end,       function( val ) self:SetValue('Player_Health_Font',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerHealthFontSize',   GGF.locale['Player_Health_FontSize'], nil, 10, 30, 1,      function() return self:GetValue('Player_Health_FontSize') end,   function( val ) self:SetValue('Player_Health_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerHealthFontColor",  GGF.locale['Player_Health_FontColor'], nil,                function() return self:GetColor('Player_Health_FontColor') end,  function( r,g,b,a ) self:SetColor('Player_Health_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(panelID, 'ggFrameSettingPlayerMagicka', 'Player Frame: Magicka' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerMagickaHeight',    GGF.locale['Player_Magicka_Height'], nil, 10, 60, 2,       function() return self:GetValue('Player_Magicka_Height') end,    function( val ) self:SetValue('Player_Magicka_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerMagickaColor",     GGF.locale['Player_Magicka_BarColor'], nil,                function() return self:GetColor('Player_Magicka_BarColor') end,  function( r,g,b,a ) self:SetColor('Player_Magicka_BarColor',r,g,b,a) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerMagickaTexture",   GGF.locale['Player_Magicka_Texture'], nil, textureOptions, function() return self:GetValue('Player_Magicka_Texture') end,   function( val ) self:SetValue('Player_Magicka_Texture',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerMagickaFont",      GGF.locale['Player_Magicka_Font'], nil, fontOptions,       function() return self:GetValue('Player_Magicka_Font') end,      function( val ) self:SetValue('Player_Magicka_Font',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerMagickaFontSize',  GGF.locale['Player_Magicka_FontSize'], nil, 10, 30, 1,     function() return self:GetValue('Player_Magicka_FontSize') end,  function( val ) self:SetValue('Player_Magicka_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerMagickaFontColor", GGF.locale['Player_Magicka_FontColor'], nil,               function() return self:GetColor('Player_Magicka_FontColor') end, function( r,g,b,a ) self:SetColor('Player_Magicka_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(panelID, 'ggFrameSettingPlayerStamina', 'Player Frame: Stamina' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerStaminaHeight',    GGF.locale['Player_Stamina_Height'], nil, 10, 60, 2,       function() return self:GetValue('Player_Stamina_Height') end,    function( val ) self:SetValue('Player_Stamina_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerStaminaColor",     GGF.locale['Player_Stamina_BarColor'], nil,                function() return self:GetColor('Player_Stamina_BarColor') end,  function( r,g,b,a ) self:SetColor('Player_Stamina_BarColor',r,g,b,a) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerStaminaTexture",   GGF.locale['Player_Stamina_Texture'], nil, textureOptions, function() return self:GetValue('Player_Stamina_Texture') end,   function( val ) self:SetValue('Player_Stamina_Texture',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerStaminaFont",      GGF.locale['Player_Stamina_Font'], nil, fontOptions,       function() return self:GetValue('Player_Stamina_Font') end,      function( val ) self:SetValue('Player_Stamina_Font',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerStaminaFontSize',  GGF.locale['Player_Stamina_FontSize'], nil, 10, 30, 1,     function() return self:GetValue('Player_Stamina_FontSize') end,  function( val ) self:SetValue('Player_Stamina_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerStaminaFontColor", GGF.locale['Player_Stamina_FontColor'], nil,               function() return self:GetColor('Player_Stamina_FontColor') end, function( r,g,b,a ) self:SetColor('Player_Stamina_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(panelID, 'ggFrameSettingPlayerExperience', 'Player Frame: Experience' )
  LAM:AddCheckbox(   panelID, "ggFramesSettingPlayerExperienceDisplay", GGF.locale['Player_Experience_Display'], nil, function()  return self:GetValue('Player_Experience_Display') end, function() self:SetValue('Player_Experience_Display', not self:GetValue('Player_Experience_Display')) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerExperienceHeight',  GGF.locale['Player_Experience_Height'], nil, 6, 30, 2,    function() return self:GetValue('Player_Experience_Height') end,    function( val ) self:SetValue('Player_Experience_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerExperienceColor",   GGF.locale['Player_Experience_BarColor'], nil,            function() return self:GetColor('Player_Experience_BarColor') end,  function( r,g,b,a ) self:SetColor('Player_Experience_BarColor',r,g,b,a) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerExperienceTexture", GGF.locale['Player_Experience_Texture'], nil, textureOptions, function() return self:GetValue('Player_Experience_Texture') end,   function( val ) self:SetValue('Player_Experience_Texture',val) end )
  LAM:AddCheckbox(   panelID, "ggFramesSettingPlayerExperienceTextDisplay", GGF.locale['Player_Experience_Text_Display'], nil,            function() return self:GetValue('Player_Experience_Text_Display') end, function() self:SetValue('Player_Experience_Text_Display', not self:GetValue('Player_Experience_Text_Display')) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerExperienceFont",        GGF.locale['Player_Experience_Font'], nil, fontOptions,       function() return self:GetValue('Player_Experience_Font') end,      function( val ) self:SetValue('Player_Experience_Font',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerExperienceFontSize',    GGF.locale['Player_Experience_FontSize'], nil, 10, 30, 1,     function() return self:GetValue('Player_Experience_FontSize') end,  function( val ) self:SetValue('Player_Experience_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerExperienceFontColor",   GGF.locale['Player_Experience_FontColor'], nil,               function() return self:GetColor('Player_Experience_FontColor') end, function( r,g,b,a ) self:SetColor('Player_Experience_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(panelID, 'ggFrameSettingPlayerMount', 'Player Frame: Mount' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerMountHeight',    GGF.locale['Player_Mount_Height'], nil, 6, 30, 2,       function() return self:GetValue('Player_Mount_Height') end,    function( val ) self:SetValue('Player_Mount_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerMountColor",     GGF.locale['Player_Mount_BarColor'], nil,                function() return self:GetColor('Player_Mount_BarColor') end,  function( r,g,b,a ) self:SetColor('Player_Mount_BarColor',r,g,b,a) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingPlayerMountTexture",   GGF.locale['Player_Mount_Texture'], nil, textureOptions, function() return self:GetValue('Player_Mount_Texture') end,   function( val ) self:SetValue('Player_Mount_Texture',val) end )


  LAM:AddHeader(panelID, 'ggFrameSettingGroup', 'Group Frame' )
  LAM:AddSlider(     panelID, 'ggFramesSettingGroupWidth',            GGF.locale['Group_Width'], nil, 200, 400, 5,              function() return self:GetValue('Group_Width') end,             function( val ) self:SetValue('Group_Width',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingGroupFont",             GGF.locale['Group_Font'], nil, fontOptions,               function() return self:GetValue('Group_Font') end,              function( val ) self:SetValue('Group_Font',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingGroupFontSize',         GGF.locale['Group_FontSize'], nil, 10, 30, 1,             function() return self:GetValue('Group_FontSize') end,          function( val ) self:SetValue('Group_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingGroupFontColor",        GGF.locale['Group_FontColor'], nil,                       function() return self:GetColor('Group_FontColor') end,         function( r,g,b,a ) self:SetColor('Group_FontColor',r,g,b,a) end )
  LAM:AddHeader(panelID, 'ggFrameSettingGroupHealth', 'Group Frame: Member Health' )
  LAM:AddSlider(     panelID, 'ggFramesSettingGroupHealthHeight',     GGF.locale['Group_Health_Height'], nil, 10, 60, 2,        function() return self:GetValue('Group_Health_Height') end,     function( val ) self:SetValue('Group_Health_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingGroupHealthColor",      GGF.locale['Group_Health_BarColor'], nil,                 function() return self:GetColor('Group_Health_BarColor') end,   function( r,g,b,a ) self:SetColor('Group_Health_BarColor',r,g,b,a) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingGroupHealthTexture",    GGF.locale['Group_Health_Texture'], nil, textureOptions,  function() return self:GetValue('Group_Health_Texture') end,    function( val ) self:SetValue('Group_Health_Texture',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingGroupHealthFont",       GGF.locale['Group_Health_Font'], nil, fontOptions,        function() return self:GetValue('Group_Health_Font') end,       function( val ) self:SetValue('Group_Health_Font',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingGroupHealthFontSize',   GGF.locale['Group_Health_FontSize'], nil, 10, 30, 1,      function() return self:GetValue('Group_Health_FontSize') end,   function( val ) self:SetValue('Group_Health_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingGroupHealthFontColor",  GGF.locale['Group_Health_FontColor'], nil,                function() return self:GetColor('Group_Health_FontColor') end,  function( r,g,b,a ) self:SetColor('Group_Health_FontColor',r,g,b,a) end )
  

  LAM:AddHeader(panelID, 'ggFrameSettingLargeGroup', 'Raid Frame' )
  LAM:AddSlider(     panelID, 'ggFramesSettingLargeGroupWidth',            GGF.locale['LargeGroup_Width'], nil, 60, 200, 5,              function() return self:GetValue('LargeGroup_Width') end,             function( val ) self:SetValue('LargeGroup_Width',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingLargeGroupHeight',           GGF.locale['LargeGroup_Height'], nil, 24, 100, 2,               function() return self:GetValue('LargeGroup_Height') end,            function( val ) self:SetValue('LargeGroup_Height',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingLargeGroupFont",             GGF.locale['LargeGroup_Font'], nil, fontOptions,               function() return self:GetValue('LargeGroup_Font') end,              function( val ) self:SetValue('LargeGroup_Font',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingLargeGroupFontSize',         GGF.locale['LargeGroup_FontSize'], nil, 10, 30, 1,             function() return self:GetValue('LargeGroup_FontSize') end,          function( val ) self:SetValue('LargeGroup_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingLargeGroupFontColor",        GGF.locale['LargeGroup_FontColor'], nil,                       function() return self:GetColor('LargeGroup_FontColor') end,         function( r,g,b,a ) self:SetColor('LargeGroup_FontColor',r,g,b,a) end )
  LAM:AddHeader(panelID, 'ggFrameSettingLargeGroupHealth', 'Raid Frame: Member Health' )
  LAM:AddColorPicker(panelID, "ggFramesSettingLargeGroupHealthColor",      GGF.locale['LargeGroup_Health_BarColor'], nil,                 function() return self:GetColor('LargeGroup_Health_BarColor') end,   function( r,g,b,a ) self:SetColor('LargeGroup_Health_BarColor',r,g,b,a) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingLargeGroupHealthTexture",    GGF.locale['LargeGroup_Health_Texture'], nil, textureOptions,  function() return self:GetValue('LargeGroup_Health_Texture') end,    function( val ) self:SetValue('LargeGroup_Health_Texture',val) end )
  
  LAM:AddHeader(panelID, 'ggFrameSettingResetSection', 'Reset To Defaults' )
  LAM:AddDescription(panelID, 'ggFramesSettingResetDescription', 'Caution: By resetting to the defaults you will lose all custom configuration you\'ve setup.  Please make sure this is what you want to do before clicking the button below.')  
  LAM:AddButton(     panelID, "ggFramesSettingResetButton", "Reset Defaults", nil, function() self:ResetDefaults() end)
end