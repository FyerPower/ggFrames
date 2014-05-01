function GGF.Settings:Controls()
  local fontOptions = GGF.Theme.fonts
  local textureOptions = GGF.Theme.textures
  local styleOptions = {"normal", "outline", "shadow", "soft-shadow-thick", "soft-shadow-thin", "thick-outline"}
  local formatOptions = {"Nothing", "Current", "Max", "Percentage%", "Current / Max", "Current / Max (Percentage%)", "Current (Percentage%)"}
  local formatLocations = {"Left", "Center", "Right"}

  local LAM = LibStub("LibAddonMenu-1.0")
  local panelID = LAM:CreateControlPanel( "ggFrameSettingMenu", "ggFrames")
  header = LAM:AddHeader( panelID, "ggFrameSettingMenuHeader", "Version |cAA0000"..GGF.version.."|r by |c00AA00@gamegenius86|r")

  header:SetHandler("OnShow", function() 
    ZO_OptionsWindowResetToDefaultButton:SetAlpha(0)
    ZO_OptionsWindowResetToDefaultButton:SetEnabled(false)
    ZO_OptionsWindowResetToDefaultButton:SetKeybindEnabled(false)
  end)
  header:SetHandler("OnHide", function() 
    ZO_OptionsWindowResetToDefaultButton:SetAlpha(1)
    ZO_OptionsWindowResetToDefaultButton:SetEnabled(true)
    ZO_OptionsWindowResetToDefaultButton:SetKeybindEnabled(true)
  end)

  LAM:AddCheckbox(   panelID, "ggFramesSettingFrameLock", GGF.locale['Frame_Lock'], nil, function()  return not self:IsFrameMovable() end, function() self:ToggleFrameMovable() end )
  
  LAM:AddHeader(     panelID, 'ggFrameSettingGlobal',          'Global Addon Settings' )
  LAM:AddSlider(     panelID, 'ggFramesSettingCombatAlpha',    GGF.locale['Combat_Alpha'], nil, 50, 100, 5,              function() return self:GetValue('Combat_Alpha') end,             function( val ) self:SetValue('Combat_Alpha',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingBarFont",        GGF.locale['Font'], nil, fontOptions,        function() return self:GetValue('Font') end,       function( val ) self:SetValue('Font',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingBarFontStyle",   GGF.locale['Font_Style'], nil, styleOptions,  function() return self:GetValue('Font_Style') end, function( val ) self:SetValue('Font_Style',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingBarTexture",     GGF.locale['Bar_Texture'], nil, textureOptions,  function() return self:GetValue('Bar_Texture') end,    function( val ) self:SetValue('Bar_Texture',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingBarFormat",      GGF.locale['Bar_Format'], nil, formatOptions,  function() return self:GetValue('Bar_Format') end,    function( val ) self:SetValue('Bar_Format',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingBarFormatLoc",   GGF.locale['Bar_Format_Location'], nil, formatLocations,  function() return self:GetValue('Bar_Format_Location') end,    function( val ) self:SetValue('Bar_Format_Location',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingBarFormatTwo",   GGF.locale['Bar_Format_Two'], nil, formatOptions,  function() return self:GetValue('Bar_Format_Two') end,    function( val ) self:SetValue('Bar_Format_Two',val) end )
  LAM:AddDropdown(   panelID, "ggFramesSettingBarFormatLocTwo",GGF.locale['Bar_Format_Location_Two'], nil, formatLocations,  function() return self:GetValue('Bar_Format_Location_Two') end,    function( val ) self:SetValue('Bar_Format_Location_Two',val) end )



  LAM:AddHeader(     panelID, 'ggFrameSettingPlayer',                   'Frame: Player' )
  LAM:AddCheckbox(   panelID, "ggFramesSettingPlayerDisplay",           GGF.locale['Display_Player_Info'], nil,       function()  return self:GetValue('Player_Info_Display') end, function() self:SetValue('Player_Info_Display', not self:GetValue('Player_Info_Display')) end )
  LAM:AddCheckbox(   panelID, "ggFramesSettingPlayerExperienceDisplay", GGF.locale['Display_Player_Experience'], nil, function()  return self:GetValue('Player_Experience_Display') end, function() self:SetValue('Player_Experience_Display', not self:GetValue('Player_Experience_Display')) end )

  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerWidth',            GGF.locale['Frame_Width'], nil, 200, 400, 5,              function() return self:GetValue('Player_Width') end,             function( val ) self:SetValue('Player_Width',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerFontSize',         GGF.locale['Info_FontSize'], nil, 10, 30, 1,             function() return self:GetValue('Player_FontSize') end,          function( val ) self:SetValue('Player_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerFontColor",        GGF.locale['Info_FontColor'], nil,                       function() return self:GetColor('Player_FontColor') end,         function( r,g,b,a ) self:SetColor('Player_FontColor',r,g,b,a) end )
  LAM:AddHeader(     panelID, 'ggFrameSettingPlayerHealth',            'Player Frame: Health' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerHealthHeight',     GGF.locale['Health_Height'], nil, 10, 60, 2,        function() return self:GetValue('Player_Health_Height') end,     function( val ) self:SetValue('Player_Health_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerHealthColor",      GGF.locale['Health_BarColor'], nil,                 function() return self:GetColor('Player_Health_BarColor') end,   function( r,g,b,a ) self:SetColor('Player_Health_BarColor',r,g,b,a) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerHealthFontSize',   GGF.locale['Health_FontSize'], nil, 10, 30, 1,      function() return self:GetValue('Player_Health_FontSize') end,   function( val ) self:SetValue('Player_Health_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerHealthFontColor",  GGF.locale['Health_FontColor'], nil,                function() return self:GetColor('Player_Health_FontColor') end,  function( r,g,b,a ) self:SetColor('Player_Health_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(     panelID, 'ggFrameSettingPlayerMagicka',           'Player Frame: Magicka' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerMagickaHeight',    GGF.locale['Magicka_Height'], nil, 10, 60, 2,       function() return self:GetValue('Player_Magicka_Height') end,    function( val ) self:SetValue('Player_Magicka_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerMagickaColor",     GGF.locale['Magicka_BarColor'], nil,                function() return self:GetColor('Player_Magicka_BarColor') end,  function( r,g,b,a ) self:SetColor('Player_Magicka_BarColor',r,g,b,a) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerMagickaFontSize',  GGF.locale['Magicka_FontSize'], nil, 10, 30, 1,     function() return self:GetValue('Player_Magicka_FontSize') end,  function( val ) self:SetValue('Player_Magicka_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerMagickaFontColor", GGF.locale['Magicka_FontColor'], nil,               function() return self:GetColor('Player_Magicka_FontColor') end, function( r,g,b,a ) self:SetColor('Player_Magicka_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(     panelID, 'ggFrameSettingPlayerStamina',           'Player Frame: Stamina' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerStaminaHeight',    GGF.locale['Stamina_Height'], nil, 10, 60, 2,       function() return self:GetValue('Player_Stamina_Height') end,    function( val ) self:SetValue('Player_Stamina_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerStaminaColor",     GGF.locale['Stamina_BarColor'], nil,                function() return self:GetColor('Player_Stamina_BarColor') end,  function( r,g,b,a ) self:SetColor('Player_Stamina_BarColor',r,g,b,a) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerStaminaFontSize',  GGF.locale['Stamina_FontSize'], nil, 10, 30, 1,     function() return self:GetValue('Player_Stamina_FontSize') end,  function( val ) self:SetValue('Player_Stamina_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerStaminaFontColor", GGF.locale['Stamina_FontColor'], nil,               function() return self:GetColor('Player_Stamina_FontColor') end, function( r,g,b,a ) self:SetColor('Player_Stamina_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(     panelID, 'ggFrameSettingPlayerExperience',         'Player Frame: Experience' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerExperienceHeight',  GGF.locale['Experience_Height'], nil, 6, 30, 2,    function() return self:GetValue('Player_Experience_Height') end,    function( val ) self:SetValue('Player_Experience_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerExperienceColor",   GGF.locale['Experience_BarColor'], nil,            function() return self:GetColor('Player_Experience_BarColor') end,  function( r,g,b,a ) self:SetColor('Player_Experience_BarColor',r,g,b,a) end )
  LAM:AddCheckbox(   panelID, "ggFramesSettingPlayerExperienceTextDisplay", GGF.locale['Experience_Text_Display'], nil,            function() return self:GetValue('Player_Experience_Text_Display') end, function() self:SetValue('Player_Experience_Text_Display', not self:GetValue('Player_Experience_Text_Display')) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerExperienceFontSize',    GGF.locale['Experience_FontSize'], nil, 10, 30, 1,     function() return self:GetValue('Player_Experience_FontSize') end,  function( val ) self:SetValue('Player_Experience_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerExperienceFontColor",   GGF.locale['Experience_FontColor'], nil,               function() return self:GetColor('Player_Experience_FontColor') end, function( r,g,b,a ) self:SetColor('Player_Experience_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(     panelID, 'ggFrameSettingPlayerMount',           'Player Frame: Mount' )
  LAM:AddSlider(     panelID, 'ggFramesSettingPlayerMountHeight',    GGF.locale['Mount_Height'], nil, 6, 30, 2,       function() return self:GetValue('Player_Mount_Height') end,    function( val ) self:SetValue('Player_Mount_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingPlayerMountColor",     GGF.locale['Mount_BarColor'], nil,                function() return self:GetColor('Player_Mount_BarColor') end,  function( r,g,b,a ) self:SetColor('Player_Mount_BarColor',r,g,b,a) end )

  LAM:AddHeader(     panelID, 'ggFrameSettingGroup',                 'Group Frame' )
  LAM:AddSlider(     panelID, 'ggFramesSettingGroupWidth',            GGF.locale['Frame_Width'], nil, 200, 400, 5,              function() return self:GetValue('Group_Width') end,             function( val ) self:SetValue('Group_Width',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingGroupFontSize',         GGF.locale['Info_FontSize'], nil, 10, 30, 1,             function() return self:GetValue('Group_FontSize') end,          function( val ) self:SetValue('Group_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingGroupFontColor",        GGF.locale['Info_FontColor'], nil,                       function() return self:GetColor('Group_FontColor') end,         function( r,g,b,a ) self:SetColor('Group_FontColor',r,g,b,a) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingGroupHealthHeight',     GGF.locale['Health_Height'], nil, 10, 60, 2,        function() return self:GetValue('Group_Health_Height') end,     function( val ) self:SetValue('Group_Health_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingGroupHealthColor",      GGF.locale['Health_BarColor'], nil,                 function() return self:GetColor('Group_Health_BarColor') end,   function( r,g,b,a ) self:SetColor('Group_Health_BarColor',r,g,b,a) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingGroupHealthFontSize',   GGF.locale['Health_FontSize'], nil, 10, 30, 1,      function() return self:GetValue('Group_Health_FontSize') end,   function( val ) self:SetValue('Group_Health_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingGroupHealthFontColor",  GGF.locale['Health_FontColor'], nil,                function() return self:GetColor('Group_Health_FontColor') end,  function( r,g,b,a ) self:SetColor('Group_Health_FontColor',r,g,b,a) end )
  

  LAM:AddHeader(     panelID, 'ggFrameSettingLargeGroup',                  'Raid Frame' )
  LAM:AddSlider(     panelID, 'ggFramesSettingLargeGroupWidth',            GGF.locale['Frame_Width'], nil, 60, 200, 5,              function() return self:GetValue('LargeGroup_Width') end,             function( val ) self:SetValue('LargeGroup_Width',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingLargeGroupHeight',           GGF.locale['Frame_Height'], nil, 24, 100, 2,               function() return self:GetValue('LargeGroup_Height') end,            function( val ) self:SetValue('LargeGroup_Height',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingLargeGroupFontSize',         GGF.locale['Info_FontSize'], nil, 10, 30, 1,             function() return self:GetValue('LargeGroup_FontSize') end,          function( val ) self:SetValue('LargeGroup_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingLargeGroupFontColor",        GGF.locale['Info_FontColor'], nil,                       function() return self:GetColor('LargeGroup_FontColor') end,         function( r,g,b,a ) self:SetColor('LargeGroup_FontColor',r,g,b,a) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingLargeGroupHealthColor",      GGF.locale['Health_BarColor'], nil,                 function() return self:GetColor('LargeGroup_Health_BarColor') end,   function( r,g,b,a ) self:SetColor('LargeGroup_Health_BarColor',r,g,b,a) end )
  
  
  LAM:AddHeader(     panelID, 'ggFrameSettingTarget',                  'Target Frame' )
  LAM:AddSlider(     panelID, 'ggFramesSettingTargetWidth',            GGF.locale['Frame_Width'], nil, 200, 400, 5,              function() return self:GetValue('Target_Width') end,             function( val ) self:SetValue('Target_Width',val) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingTargetFontSize',         GGF.locale['Info_FontSize'], nil, 10, 30, 1,             function() return self:GetValue('Target_FontSize') end,          function( val ) self:SetValue('Target_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingTargetFontColor",        GGF.locale['Info_FontColor'], nil,                       function() return self:GetColor('Target_FontColor') end,         function( r,g,b,a ) self:SetColor('Target_FontColor',r,g,b,a) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingTargetFontColor_Friendly", GGF.locale['Target_FontColor_Friendly'], nil,            function() return self:GetColor('Target_FontColor_Friendly') end,  function( r,g,b,a ) self:SetColor('Target_FontColor_Friendly',r,g,b,a) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingTargetFontColor_Hostile",  GGF.locale['Target_FontColor_Hostile'], nil,             function() return self:GetColor('Target_FontColor_Hostile') end,   function( r,g,b,a ) self:SetColor('Target_FontColor_Hostile',r,g,b,a) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingTargetFontColor_Interact", GGF.locale['Target_FontColor_Interact'], nil,            function() return self:GetColor('Target_FontColor_Interact') end,  function( r,g,b,a ) self:SetColor('Target_FontColor_Interact',r,g,b,a) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingTargetHealthHeight',     GGF.locale['Health_Height'], nil, 10, 60, 2,        function() return self:GetValue('Target_Health_Height') end,     function( val ) self:SetValue('Target_Health_Height',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingTargetHealthColor",      GGF.locale['Health_BarColor'], nil,                 function() return self:GetColor('Target_Health_BarColor') end,   function( r,g,b,a ) self:SetColor('Target_Health_BarColor',r,g,b,a) end )
  LAM:AddSlider(     panelID, 'ggFramesSettingTargetHealthFontSize',   GGF.locale['Health_FontSize'], nil, 10, 30, 1,      function() return self:GetValue('Target_Health_FontSize') end,   function( val ) self:SetValue('Target_Health_FontSize',val) end )
  LAM:AddColorPicker(panelID, "ggFramesSettingTargetHealthFontColor",  GGF.locale['Health_FontColor'], nil,                function() return self:GetColor('Target_Health_FontColor') end,  function( r,g,b,a ) self:SetColor('Target_Health_FontColor',r,g,b,a) end )
  
  LAM:AddHeader(     panelID, 'ggFrameSettingResetSection', 'Reset To Defaults' )
  LAM:AddDescription(panelID, 'ggFramesSettingResetDescription', 'Caution: By resetting to the defaults you will lose all custom configuration you\'ve setup.  Please make sure this is what you want to do before clicking the button below.')  
  LAM:AddButton(     panelID, "ggFramesSettingResetButton", "Reset Defaults", nil, function() self:ResetDefaults() end)
end