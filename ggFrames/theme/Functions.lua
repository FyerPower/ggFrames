GGF.TextPositions = {
  ["Left"]   = TEXT_ALIGN_LEFT,
  ["Center"] = TEXT_ALIGN_CENTER,
  ["Right"]  = TEXT_ALIGN_RIGHT
}

GGF.Theme = { ["themes"] = {} }
function GGF.Theme.Initialize()
  GGF.Theme.LMP = LibStub("LibMediaProvider-1.0")
  GGF.Theme.LoadFonts()
  GGF.Theme.LoadTextures()

  -- Load Unit Themes
  GGF.Theme.LoadPlayer()       -- Player
  GGF.Theme.LoadGroup()        -- Groups
  GGF.Theme.LoadLargeGroup()   -- Large Groups
  GGF.Theme.LoadTarget()       -- Target
end

function GGF.Theme.Load( unitName )
  return GGF.Theme.themes[ unitName ]
end

function GGF.Theme.LoadFonts()
  GGF.Theme.LMP:Register('font', 'Accidental President',             'ggFrames\\theme\\fonts\\AccidentalPresident.ttf')
  GGF.Theme.LMP:Register('font', 'Alegre Sans',                      'ggFrames\\theme\\fonts\\AlegreSans.ttf')
  GGF.Theme.LMP:Register('font', 'Alte Haas Grotesk',                'ggFrames\\theme\\fonts\\AlteHaasGroteskRegular.ttf')
  GGF.Theme.LMP:Register('font', 'Alte Haas Grotesk Bold',           'ggFrames\\theme\\fonts\\AlteHaasGroteskBold.ttf')
  GGF.Theme.LMP:Register('font', 'Antonio',                          'ggFrames\\theme\\fonts\\AntonioRegular.ttf')
  GGF.Theme.LMP:Register('font', 'Arial Bold',                       'ggFrames\\theme\\fonts\\ArialBold.ttf')
  GGF.Theme.LMP:Register('font', 'Bebas Neue',                       'ggFrames\\theme\\fonts\\BebasNeue.otf')
  GGF.Theme.LMP:Register('font', 'Bench Nine',                       'ggFrames\\theme\\fonts\\BenchNineRegular.otf')
  GGF.Theme.LMP:Register('font', 'Bench Nine Bold',                  'ggFrames\\theme\\fonts\\BenchNineBold.otf')
  GGF.Theme.LMP:Register('font', 'Economica',                        'ggFrames\\theme\\fonts\\EconomicaRegular.otf')
  GGF.Theme.LMP:Register('font', 'Economica Bold',                   'ggFrames\\theme\\fonts\\EconomicaBold.otf')
  GGF.Theme.LMP:Register('font', 'Enigma Bold',                      'ggFrames\\theme\\fonts\\EnigmaBold.ttf')
  GGF.Theme.LMP:Register('font', 'Enigma',                           'ggFrames\\theme\\fonts\\EnigmaReg.ttf')
  GGF.Theme.LMP:Register('font', 'Fertigo Pro',                      'ggFrames\\theme\\fonts\\FertigoProRegular.ttf')
  GGF.Theme.LMP:Register('font', 'Futura Extended',                  'ggFrames\\theme\\fonts\\FuturaExtended.ttf')
  GGF.Theme.LMP:Register('font', 'Univers 55 Bold',                  'ggFrames\\theme\\fonts\\Univers55Bold.ttf')

  GGF.Theme.fonts = GGF.Theme.LMP:List('font')
end

function GGF.Theme.LoadTextures()
  GGF.Theme.LMP:Register('statusbar', 'Aluminium',              'ggFrames\\theme\\textures\\Aluminium.dds')
  GGF.Theme.LMP:Register('statusbar', 'Elder Scrolls Gradiant', 'ggFrames\\theme\\textures\\ElderScrollsGrad.dds')
  GGF.Theme.LMP:Register('statusbar', 'Glass',                  'ggFrames\\theme\\textures\\Glass.dds')
  GGF.Theme.LMP:Register('statusbar', 'Glaze',                  'ggFrames\\theme\\textures\\Glaze.dds')
  GGF.Theme.LMP:Register('statusbar', 'Horizontal Gradiant 1',  'ggFrames\\theme\\textures\\HorizontalGrad.dds')
  GGF.Theme.LMP:Register('statusbar', 'Horizontal Gradiant 2',  'ggFrames\\theme\\textures\\HorizontalGradV2.dds')
  GGF.Theme.LMP:Register('statusbar', 'Inner Glow',             'ggFrames\\theme\\textures\\InnerGlow.dds')
  GGF.Theme.LMP:Register('statusbar', 'Inner Shadow',           'ggFrames\\theme\\textures\\InnerShadow.dds')
  GGF.Theme.LMP:Register('statusbar', 'Inner Shadow Glossy',    'ggFrames\\theme\\textures\\InnerShadowGloss.dds')
  GGF.Theme.LMP:Register('statusbar', 'Minimalistic',           'ggFrames\\theme\\textures\\Minimalistic.dds')
  GGF.Theme.LMP:Register('statusbar', 'Normal',                 'ggFrames\\theme\\textures\\Normal.dds')
  GGF.Theme.LMP:Register('statusbar', 'Round',                  'ggFrames\\theme\\textures\\Round.dds')
  GGF.Theme.LMP:Register('statusbar', 'Sand Paper 1',           'ggFrames\\theme\\textures\\SandPaper.dds')
  GGF.Theme.LMP:Register('statusbar', 'Sand Paper 2',           'ggFrames\\theme\\textures\\SandPaperV2.dds')
  GGF.Theme.LMP:Register('statusbar', 'Shadow',                 'ggFrames\\theme\\textures\\Shadow.dds')
  GGF.Theme.LMP:Register('statusbar', 'Smooth',                 'ggFrames\\theme\\textures\\Smooth.dds')
  
  GGF.Theme.textures = GGF.Theme.LMP:List('statusbar')
end

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

function GGF.Theme.LoadPlayer()


  local currentHeight = 0
  GGF.Theme.themes['Player']                                      = GGF.Utils:DeepCopy(GGF.Template["Unit"])
  GGF.Theme.themes['Player']['Width']                             = GGF.SavedVars['Player_Width']
  
  if GGF.SavedVars['Player_Info_Display'] then
    GGF.Theme.themes['Player']['Name']['Height']                    = GGF.SavedVars['Player_FontSize'] + 4
    GGF.Theme.themes['Player']['Name']['Font']                      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_FontSize']).."|"..GGF.SavedVars['Font_Style']
    GGF.Theme.themes['Player']['Name']['FontColor']                 = GGF.SavedVars['Player_FontColor']
    GGF.Theme.themes['Player']['Name']['MaxWidth']                  = GGF.SavedVars['Player_Width'] - 60
    GGF.Theme.themes['Player']['Level']['Height']                   = GGF.SavedVars['Player_FontSize'] + 4
    GGF.Theme.themes['Player']['Level']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_FontSize']).."|"..GGF.SavedVars['Font_Style']
    GGF.Theme.themes['Player']['Level']['FontColor']                = GGF.SavedVars['Player_FontColor']
    GGF.Theme.themes['Player']['Class']['Height']                   = GGF.SavedVars['Player_FontSize'] + 4
    GGF.Theme.themes['Player']['Class']['Width']                    = GGF.SavedVars['Player_FontSize'] + 4
    currentHeight = currentHeight + GGF.Theme.themes['Player']['Name']['Height']
  else
    GGF.Theme.themes['Player']['Name'] = false
    GGF.Theme.themes['Player']['Level'] = false
    GGF.Theme.themes['Player']['Class'] = false
  end

  GGF.Theme.themes['Player']['Death']['Width']                    = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Death']['Height']                   = GGF.SavedVars['Player_Health_Height']
  GGF.Theme.themes['Player']['Death']['Label']['Font']            = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Player']['Death']['Label']['FontColor']       = GGF.SavedVars['Player_FontColor']
  GGF.Theme.themes['Player']['Offline']['Width']                  = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Offline']['Height']                 = GGF.SavedVars['Player_Health_Height']
  GGF.Theme.themes['Player']['Offline']['Label']['Font']          = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Player']['Offline']['Label']['FontColor']     = GGF.SavedVars['Player_FontColor']
  
  GGF.Theme.themes['Player']['Health']['OffsetY']                 = currentHeight
  GGF.Theme.themes['Player']['Health']['Width']                   = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Health']['Bar']['Width']            = GGF.SavedVars['Player_Width'] - 2
  GGF.Theme.themes['Player']['Health']['Height']                  = GGF.SavedVars['Player_Health_Height']
  GGF.Theme.themes['Player']['Health']['Bar']['Height']           = GGF.SavedVars['Player_Health_Height'] - 2
  GGF.Theme.themes['Player']['Health']['Bar']['BarColor']         = GGF.SavedVars['Player_Health_BarColor']
  GGF.Theme.themes['Player']['Health']['Bar']['Texture']          = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  GGF.Theme.themes['Player']['Health']['LabelOne']['Width']         = GGF.SavedVars['Player_Width'] - 12
  GGF.Theme.themes['Player']['Health']['LabelTwo']['Width']         = GGF.SavedVars['Player_Width'] - 12
  GGF.Theme.themes['Player']['Health']['LabelOne']['Height']         = GGF.SavedVars['Player_Health_Height'] - 2
  GGF.Theme.themes['Player']['Health']['LabelTwo']['Height']         = GGF.SavedVars['Player_Health_Height'] - 2
  GGF.Theme.themes['Player']['Health']['LabelOne']['Font']           = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_Health_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Player']['Health']['LabelTwo']['Font']           = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_Health_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Player']['Health']['LabelOne']['FontColor']      = GGF.SavedVars['Player_Health_FontColor']
  GGF.Theme.themes['Player']['Health']['LabelTwo']['FontColor']      = GGF.SavedVars['Player_Health_FontColor']
  GGF.Theme.themes['Player']['Health']['LabelOne']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location']]
  GGF.Theme.themes['Player']['Health']['LabelTwo']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location_Two']]
  currentHeight = currentHeight + GGF.Theme.themes['Player']['Health']['Height'] + GGF.SavedVars['Player_Padding']
  
  GGF.Theme.themes['Player']['Magicka']['OffsetY']                = currentHeight
  GGF.Theme.themes['Player']['Magicka']['Width']                  = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Magicka']['Bar']['Width']           = GGF.SavedVars['Player_Width'] - 2
  GGF.Theme.themes['Player']['Magicka']['Height']                 = GGF.SavedVars['Player_Magicka_Height']
  GGF.Theme.themes['Player']['Magicka']['Bar']['Height']          = GGF.SavedVars['Player_Magicka_Height'] - 2
  GGF.Theme.themes['Player']['Magicka']['Bar']['BarColor']        = GGF.SavedVars['Player_Magicka_BarColor']
  GGF.Theme.themes['Player']['Magicka']['Bar']['Texture']         = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  GGF.Theme.themes['Player']['Magicka']['LabelOne']['Width']         = GGF.SavedVars['Player_Width'] - 12
  GGF.Theme.themes['Player']['Magicka']['LabelTwo']['Width']         = GGF.SavedVars['Player_Width'] - 12
  GGF.Theme.themes['Player']['Magicka']['LabelOne']['Height']        = GGF.SavedVars['Player_Magicka_Height'] - 2
  GGF.Theme.themes['Player']['Magicka']['LabelTwo']['Height']        = GGF.SavedVars['Player_Magicka_Height'] - 2
  GGF.Theme.themes['Player']['Magicka']['LabelOne']['Font']          = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_Magicka_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Player']['Magicka']['LabelTwo']['Font']          = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_Magicka_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Player']['Magicka']['LabelOne']['FontColor']     = GGF.SavedVars['Player_Magicka_FontColor']
  GGF.Theme.themes['Player']['Magicka']['LabelTwo']['FontColor']     = GGF.SavedVars['Player_Magicka_FontColor']
  GGF.Theme.themes['Player']['Magicka']['LabelOne']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location']]
  GGF.Theme.themes['Player']['Magicka']['LabelTwo']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location_Two']]
  currentHeight = currentHeight + GGF.Theme.themes['Player']['Magicka']['Height'] + GGF.SavedVars['Player_Padding']
  
  GGF.Theme.themes['Player']['Stamina']['OffsetY']                = currentHeight
  GGF.Theme.themes['Player']['Stamina']['Width']                  = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Stamina']['Bar']['Width']           = GGF.SavedVars['Player_Width'] - 2
  GGF.Theme.themes['Player']['Stamina']['Height']                 = GGF.SavedVars['Player_Stamina_Height']
  GGF.Theme.themes['Player']['Stamina']['Bar']['Height']          = GGF.SavedVars['Player_Stamina_Height'] - 2
  GGF.Theme.themes['Player']['Stamina']['Bar']['BarColor']        = GGF.SavedVars['Player_Stamina_BarColor']
  GGF.Theme.themes['Player']['Stamina']['Bar']['Texture']         = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  GGF.Theme.themes['Player']['Stamina']['LabelOne']['Width']         = GGF.SavedVars['Player_Width'] - 12
  GGF.Theme.themes['Player']['Stamina']['LabelTwo']['Width']         = GGF.SavedVars['Player_Width'] - 12
  GGF.Theme.themes['Player']['Stamina']['LabelOne']['Height']        = GGF.SavedVars['Player_Stamina_Height'] - 2
  GGF.Theme.themes['Player']['Stamina']['LabelTwo']['Height']        = GGF.SavedVars['Player_Stamina_Height'] - 2
  GGF.Theme.themes['Player']['Stamina']['LabelOne']['Font']          = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_Stamina_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Player']['Stamina']['LabelTwo']['Font']          = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_Stamina_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Player']['Stamina']['LabelOne']['FontColor']     = GGF.SavedVars['Player_Stamina_FontColor']
  GGF.Theme.themes['Player']['Stamina']['LabelTwo']['FontColor']     = GGF.SavedVars['Player_Stamina_FontColor']
  GGF.Theme.themes['Player']['Stamina']['LabelOne']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location']]
  GGF.Theme.themes['Player']['Stamina']['LabelTwo']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location_Two']]
  currentHeight = currentHeight + GGF.Theme.themes['Player']['Stamina']['Height'] + GGF.SavedVars['Player_Padding']

  if not GGF.SavedVars['Player_Mount_Seperated'] then
    GGF.Theme.themes['Player']['Mount'] = GGF.Theme.themes['Player']['Mount_Joined']
    GGF.Theme.themes['Player']['Mount']['OffsetY']             = currentHeight
    GGF.Theme.themes['Player']['Mount']['Width']               = GGF.SavedVars['Player_Width']
    GGF.Theme.themes['Player']['Mount']['Height']              = GGF.SavedVars['Player_Mount_Height']
    GGF.Theme.themes['Player']['Mount']['Bar']['Width']        = GGF.SavedVars['Player_Width'] - 2
    GGF.Theme.themes['Player']['Mount']['Bar']['Height']       = GGF.SavedVars['Player_Mount_Height'] - 2
    GGF.Theme.themes['Player']['Mount']['Bar']['BarColor']     = GGF.SavedVars['Player_Mount_BarColor']
    GGF.Theme.themes['Player']['Mount']['Bar']['Texture']      = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
    currentHeight = currentHeight + GGF.Theme.themes['Player']['Mount']['Height'] + GGF.SavedVars['Player_Padding']
  end

  if GGF.SavedVars['Player_Experience_Display'] then
    GGF.Theme.themes['Player']['Experience']['OffsetY']             = currentHeight
    GGF.Theme.themes['Player']['Experience']['UnmountedOffsetY']    = currentHeight - GGF.SavedVars['Player_Mount_Height'] + 1
    GGF.Theme.themes['Player']['Experience']['Width']               = GGF.SavedVars['Player_Width']
    GGF.Theme.themes['Player']['Experience']['Height']              = GGF.SavedVars['Player_Experience_Height']
    GGF.Theme.themes['Player']['Experience']['Bar']['Width']        = GGF.SavedVars['Player_Width'] - 2
    GGF.Theme.themes['Player']['Experience']['Bar']['Height']       = GGF.SavedVars['Player_Experience_Height'] - 2
    GGF.Theme.themes['Player']['Experience']['Bar']['BarColor']     = GGF.SavedVars['Player_Experience_BarColor']
    GGF.Theme.themes['Player']['Experience']['Bar']['Texture']      = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
    currentHeight = currentHeight + GGF.Theme.themes['Player']['Experience']['Height'] + GGF.SavedVars['Player_Padding']
    if GGF.SavedVars['Player_Experience_Text_Display'] then
      GGF.Theme.themes['Player']['Experience']['Label'] = {}
      GGF.Theme.themes['Player']['Experience']['Label']['Height']    = GGF.SavedVars['Player_Experience_Height'] - 2
      GGF.Theme.themes['Player']['Experience']['Label']['Width']     = GGF.SavedVars['Player_Width'] - 12
      GGF.Theme.themes['Player']['Experience']['Label']['Font']      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Player_Experience_FontSize']).."|"..GGF.SavedVars['Font_Style']
      GGF.Theme.themes['Player']['Experience']['Label']['FontColor'] = GGF.SavedVars['Player_Experience_FontColor']
      GGF.Theme.themes['Player']['Experience']['Label']['HorizontalAlign'] = TEXT_ALIGN_CENTER
    else
      GGF.Theme.themes['Player']['Experience']['Label'] = false
    end
  else
    GGF.Theme.themes['Player']['Experience'] = false
  end
  
  if GGF.SavedVars['Player_Mount_Seperated'] then
    GGF.Theme.themes['Player']['Mount'] = GGF.Theme.themes['Player']['Mount_Seperated']
    GGF.Theme.themes['Player']['Mount']['OffsetY']                    = currentHeight + 2
    GGF.Theme.themes['Player']['Mount']['BarArea']['Height']          = GGF.SavedVars['Player_Mount_Height']
    GGF.Theme.themes['Player']['Mount']['BarArea']['Bar']['Height']   = GGF.SavedVars['Player_Mount_Height'] - 2
    GGF.Theme.themes['Player']['Mount']['BarArea']['Bar']['BarColor'] = GGF.SavedVars['Player_Mount_BarColor']
    GGF.Theme.themes['Player']['Mount']['BarArea']['Bar']['Texture']  = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
    currentHeight = currentHeight + 27
  end
  
  GGF.Theme.themes['Player']['Health']['Shield']['Height']   = GGF.SavedVars['Player_Shield_Height'] - 2
  GGF.Theme.themes['Player']['Health']['Shield']['BarColor'] = GGF.SavedVars['Player_Shield_BarColor']
  GGF.Theme.themes['Player']['Health']['Shield']['Texture']  = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  
  GGF.Theme.themes['Player']['Caption'] = false
  GGF.Theme.themes['Player']['RankLb'] = false
  GGF.Theme.themes['Player']['RankTx'] = false
  GGF.Theme.themes['Player']['Difficulty'] = false
  
  -- Player Container
  GGF.Theme.themes['PlayerContainer'] = {
    ['OffsetX'] = GGF.SavedVars['PlayerContainer_OffsetX'],
    ['OffsetY'] = GGF.SavedVars['PlayerContainer_OffsetY'],
    ['Width']   = GGF.SavedVars['Player_Width'],
    ['Height']  = currentHeight,
    ['Alpha']   = GGF.SavedVars['Player_Combat_Alpha']/100,
    ['Label']   = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ['Width']     = GGF.SavedVars['Player_Width'],
      ['Height']    = currentHeight,
      ['Font']      = 'ggFrames\\theme\\fonts\\BebasNeue.otf|20',
      ['FontColor'] = {1,1,1,1},
      ["VerticalAlign"] = TEXT_ALIGN_CENTER,
      ["HorizontalAlign"] = TEXT_ALIGN_CENTER
    }
  }
end

function GGF.Theme.LoadGroup()
  GGF.Theme.themes['Group']                                     = GGF.Utils:DeepCopy(GGF.Template["Unit"])
  GGF.Theme.themes['Group']['Width']                            = GGF.SavedVars['Group_Width']
  
  GGF.Theme.themes['Group']['Name']['Height']                   = GGF.SavedVars['Group_FontSize'] + 4
  GGF.Theme.themes['Group']['Name']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Group_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Group']['Name']['FontColor']                = GGF.SavedVars['Group_FontColor']
  GGF.Theme.themes['Group']['Name']['MaxWidth']                 = GGF.SavedVars['Group_Width'] - 60
  GGF.Theme.themes['Group']['Level']['Height']                  = GGF.SavedVars['Group_FontSize'] + 4
  GGF.Theme.themes['Group']['Level']['Font']                    = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Group_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Group']['Level']['FontColor']               = GGF.SavedVars['Group_FontColor']
  GGF.Theme.themes['Group']['Class']['Height']                  = GGF.SavedVars['Group_FontSize'] + 4
  GGF.Theme.themes['Group']['Class']['Width']                   = GGF.SavedVars['Group_FontSize'] + 4
  GGF.Theme.themes['Group']['Death']['Width']                   = GGF.SavedVars['Group_Width']
  GGF.Theme.themes['Group']['Death']['Height']                  = GGF.SavedVars['Group_Health_Height']
  GGF.Theme.themes['Group']['Death']['Label']['Font']           = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Group_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Group']['Death']['Label']['FontColor']      = GGF.SavedVars['Group_FontColor']
  GGF.Theme.themes['Group']['Offline']['Width']                 = GGF.SavedVars['Group_Width']
  GGF.Theme.themes['Group']['Offline']['Height']                = GGF.SavedVars['Group_Health_Height']
  GGF.Theme.themes['Group']['Offline']['Label']['Font']         = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Group_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Group']['Offline']['Label']['FontColor']    = GGF.SavedVars['Group_FontColor']
  
  GGF.Theme.themes['Group']['Health']['OffsetY']                = GGF.Theme.themes['Group']['Name']['Height']
  GGF.Theme.themes['Group']['Health']['Width']                  = GGF.SavedVars['Group_Width']
  GGF.Theme.themes['Group']['Health']['Bar']['Width']           = GGF.SavedVars['Group_Width'] - 2
  GGF.Theme.themes['Group']['Health']['Height']                 = GGF.SavedVars['Group_Health_Height']
  GGF.Theme.themes['Group']['Health']['Bar']['Height']          = GGF.SavedVars['Group_Health_Height'] - 2
  GGF.Theme.themes['Group']['Health']['Bar']['BarColor']        = GGF.SavedVars['Group_Health_BarColor']
  GGF.Theme.themes['Group']['Health']['Bar']['Texture']         = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  GGF.Theme.themes['Group']['Health']['LabelOne']['Width']         = GGF.SavedVars['Group_Width'] - 12
  GGF.Theme.themes['Group']['Health']['LabelTwo']['Width']         = GGF.SavedVars['Group_Width'] - 12
  GGF.Theme.themes['Group']['Health']['LabelOne']['Height']     = GGF.SavedVars['Group_Health_Height'] - 2
  GGF.Theme.themes['Group']['Health']['LabelTwo']['Height']     = GGF.SavedVars['Group_Health_Height'] - 2
  GGF.Theme.themes['Group']['Health']['LabelOne']['Font']       = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Group_Health_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Group']['Health']['LabelTwo']['Font']       = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Group_Health_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Group']['Health']['LabelOne']['FontColor']  = GGF.SavedVars['Group_Health_FontColor']
  GGF.Theme.themes['Group']['Health']['LabelTwo']['FontColor']  = GGF.SavedVars['Group_Health_FontColor']
  GGF.Theme.themes['Group']['Health']['LabelOne']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location']]
  GGF.Theme.themes['Group']['Health']['LabelTwo']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location_Two']]

  GGF.Theme.themes['Group']['Health']['Shield']['Height']   = GGF.SavedVars['Group_Shield_Height'] - 2
  GGF.Theme.themes['Group']['Health']['Shield']['BarColor'] = GGF.SavedVars['Group_Shield_BarColor']
  GGF.Theme.themes['Group']['Health']['Shield']['Texture']  = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  
  GGF.Theme.themes['Group']['Magicka'] = false
  GGF.Theme.themes['Group']['Stamina'] = false
  GGF.Theme.themes['Group']['Experience'] = false
  GGF.Theme.themes['Group']['Mount'] = false
  GGF.Theme.themes['Group']['Caption'] = false
  GGF.Theme.themes['Group']['RankLb'] = false
  GGF.Theme.themes['Group']['RankTx'] = false
  GGF.Theme.themes['Group']['Difficulty'] = false
  
  for i = 1, 3 do
    GGF.Theme.themes['Group'..i] = GGF.Utils:DeepCopy(GGF.Theme.themes['Group'])
    GGF.Theme.themes['Group'..i]['OffsetY'] = (GGF.Theme.themes['Group']['Health']['Height'] + GGF.Theme.themes['Group']['Name']['Height'] + 14) * (i-1)
  end

  local height = (GGF.Theme.themes['Group']['Health']['OffsetY'] + GGF.Theme.themes['Group']['Name']['Height'] + 20) * 3

  GGF.Theme.themes['GroupContainer'] = {
    ['OffsetX'] = GGF.SavedVars['GroupContainer_OffsetX'],
    ['OffsetY'] = GGF.SavedVars['GroupContainer_OffsetY'],                                                                                                                                    
    ['Width']   = GGF.SavedVars['Group_Width'],                                                                                                                                                                     
    ['Height']  = height,
    ['Alpha']   = GGF.SavedVars['GroupContainer_Alpha']/100,
    ['Label']   = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ['Width']     = GGF.SavedVars['Group_Width'],
      ['Height']    = height,
      ['Font']      = 'ggFrames\\theme\\fonts\\BebasNeue.otf|20',
      ['FontColor'] = {1,1,1,1},
      ["VerticalAlign"] = TEXT_ALIGN_CENTER,
      ["HorizontalAlign"] = TEXT_ALIGN_CENTER
    }
  }



end


function GGF.Theme.LoadLargeGroup()
  GGF.Theme.themes['LargeGroup']                                  = GGF.Utils:DeepCopy(GGF.Template["RaidUnit"])
  GGF.Theme.themes['LargeGroup']['Width']                         = GGF.SavedVars['LargeGroup_Width']
  GGF.Theme.themes['LargeGroup']['Height']                        = GGF.SavedVars['LargeGroup_Height']
  
  GGF.Theme.themes['LargeGroup']['Name']['Width']                 = GGF.SavedVars['LargeGroup_Width'] - 6
  GGF.Theme.themes['LargeGroup']['Name']['Height']                = GGF.SavedVars['LargeGroup_FontSize'] + 4
  GGF.Theme.themes['LargeGroup']['Name']['Font']                  = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['LargeGroup_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['LargeGroup']['Name']['FontColor']             = GGF.SavedVars['LargeGroup_FontColor']
  GGF.Theme.themes['LargeGroup']['Name']['MaxWidth']              = GGF.SavedVars['LargeGroup_Width'] - 4
  GGF.Theme.themes['LargeGroup']['Death']['Width']                = GGF.SavedVars['LargeGroup_Width']
  GGF.Theme.themes['LargeGroup']['Death']['Height']               = GGF.SavedVars['LargeGroup_Height']
  GGF.Theme.themes['LargeGroup']['Death']['Label']['Width']       = GGF.SavedVars['LargeGroup_Width'] - 6
  GGF.Theme.themes['LargeGroup']['Death']['Label']['Font']        = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['LargeGroup_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['LargeGroup']['Death']['Label']['FontColor']   = GGF.SavedVars['LargeGroup_FontColor']
  GGF.Theme.themes['LargeGroup']['Offline']['Width']              = GGF.SavedVars['LargeGroup_Width']
  GGF.Theme.themes['LargeGroup']['Offline']['Height']             = GGF.SavedVars['LargeGroup_Height']
  GGF.Theme.themes['LargeGroup']['Offline']['Label']['Width']     = GGF.SavedVars['LargeGroup_Width'] - 6
  GGF.Theme.themes['LargeGroup']['Offline']['Label']['Font']      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['LargeGroup_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['LargeGroup']['Offline']['Label']['FontColor'] = GGF.SavedVars['LargeGroup_FontColor']
  
  GGF.Theme.themes['LargeGroup']['Health']['Width']               = GGF.SavedVars['LargeGroup_Width']
  GGF.Theme.themes['LargeGroup']['Health']['Bar']['Width']        = GGF.SavedVars['LargeGroup_Width'] - 2
  GGF.Theme.themes['LargeGroup']['Health']['Height']              = GGF.SavedVars['LargeGroup_Height']
  GGF.Theme.themes['LargeGroup']['Health']['Bar']['Height']       = GGF.SavedVars['LargeGroup_Height'] - 2
  GGF.Theme.themes['LargeGroup']['Health']['Bar']['BarColor']     = GGF.SavedVars['LargeGroup_Health_BarColor']
  GGF.Theme.themes['LargeGroup']['Health']['Bar']['Texture']      = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  
  GGF.Theme.themes['LargeGroup']['Magicka']                       = false
  GGF.Theme.themes['LargeGroup']['Stamina']                       = false
  GGF.Theme.themes['LargeGroup']['Experience']                    = false
  GGF.Theme.themes['LargeGroup']['Mount']                         = false
  
  local groupSize = GGF.SavedVars['Raid_Format'] == GGF.locale['Setting_Raid_Layout_Opt'][1] and 4 or 8
  for i = 1, 24 do 
    GGF.Theme.themes['LargeGroup'..i] = GGF.Utils:DeepCopy(GGF.Theme.themes['LargeGroup'])
    GGF.Theme.themes['LargeGroup'..i]['OffsetX'] = GGF.Theme.themes['LargeGroup']['Width'] * math.floor((i-1)/groupSize)
    GGF.Theme.themes['LargeGroup'..i]['OffsetY'] = GGF.Theme.themes['LargeGroup']['Height'] * ((i-1)%groupSize)
  end

  local width = GGF.Theme.themes['LargeGroup']['Width'] * 6
  local height = GGF.Theme.themes['LargeGroup']['Height'] * 4

  GGF.Theme.themes['LargeGroupContainer']= {
    ['OffsetX'] = GGF.SavedVars['LargeGroupContainer_OffsetX'],
    ['OffsetY'] = GGF.SavedVars['LargeGroupContainer_OffsetY'],
    ['Width']   = width,
    ['Height']  = height,
    ['Alpha']   = GGF.SavedVars['LargeGroupContainer_Alpha']/100,
    ['Label']   = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ['Width']     = width,
      ['Height']    = height,
      ['Font']      = 'ggFrames\\theme\\fonts\\BebasNeue.otf|20',
      ['FontColor'] = {1,1,1,1},
      ["VerticalAlign"] = TEXT_ALIGN_CENTER,
      ["HorizontalAlign"] = TEXT_ALIGN_CENTER
    }
  }
end

function GGF.Theme.LoadTarget() 
  GGF.Theme.themes['Target']                                     = GGF.Utils:DeepCopy(GGF.Template["Unit"])
  
  GGF.Theme.themes['Target']['Name']['Height']                   = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Name']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Target_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Target']['Name']['FontColor']                = GGF.SavedVars['Target_FontColor']
  GGF.Theme.themes['Target']['Name']['MaxWidth']                 = GGF.SavedVars['Target_Width'] - 60
  GGF.Theme.themes['Target']['Level']['Height']                  = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Level']['Font']                    = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Target_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Target']['Level']['FontColor']               = GGF.SavedVars['Target_FontColor']
  GGF.Theme.themes['Target']['Class']['Height']                  = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Class']['Width']                   = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Death']['Width']                   = GGF.SavedVars['Target_Width']
  GGF.Theme.themes['Target']['Death']['Height']                  = GGF.SavedVars['Target_Health_Height']
  GGF.Theme.themes['Target']['Death']['Label']['Font']           = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Target_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Target']['Death']['Label']['FontColor']      = GGF.SavedVars['Target_FontColor']
  GGF.Theme.themes['Target']['Offline']['Width']                 = GGF.SavedVars['Target_Width']
  GGF.Theme.themes['Target']['Offline']['Height']                = GGF.SavedVars['Target_Health_Height']
  GGF.Theme.themes['Target']['Offline']['Label']['Font']         = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Target_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Target']['Offline']['Label']['FontColor']    = GGF.SavedVars['Target_FontColor']
  
  GGF.Theme.themes['Target']['Health']['OffsetY']                = GGF.Theme.themes['Target']['Name']['Height']
  GGF.Theme.themes['Target']['Health']['Width']                  = GGF.SavedVars['Target_Width']
  GGF.Theme.themes['Target']['Health']['Bar']['Width']           = GGF.SavedVars['Target_Width'] - 2
  GGF.Theme.themes['Target']['Health']['Height']                 = GGF.SavedVars['Target_Health_Height']
  GGF.Theme.themes['Target']['Health']['Bar']['Height']          = GGF.SavedVars['Target_Health_Height'] - 2
  GGF.Theme.themes['Target']['Health']['Bar']['BarColor']        = GGF.SavedVars['Target_Health_BarColor']
  GGF.Theme.themes['Target']['Health']['Bar']['Texture']         = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  GGF.Theme.themes['Target']['Health']['LabelOne']['Width']          = GGF.SavedVars['Target_Width'] - 12
  GGF.Theme.themes['Target']['Health']['LabelTwo']['Width']          = GGF.SavedVars['Target_Width'] - 12
  GGF.Theme.themes['Target']['Health']['LabelOne']['Height']        = GGF.SavedVars['Target_Health_Height'] - 2
  GGF.Theme.themes['Target']['Health']['LabelTwo']['Height']        = GGF.SavedVars['Target_Health_Height'] - 2
  GGF.Theme.themes['Target']['Health']['LabelOne']['Font']          = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Target_Health_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Target']['Health']['LabelTwo']['Font']          = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Target_Health_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Target']['Health']['LabelOne']['FontColor']     = GGF.SavedVars['Target_Health_FontColor']
  GGF.Theme.themes['Target']['Health']['LabelTwo']['FontColor']     = GGF.SavedVars['Target_Health_FontColor']
  GGF.Theme.themes['Target']['Health']['LabelOne']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location']]
  GGF.Theme.themes['Target']['Health']['LabelTwo']['HorizontalAlign'] = GGF.TextPositions[GGF.SavedVars['Bar_Format_Location_Two']]

  GGF.Theme.themes['Target']['Caption']['Width']                    = GGF.SavedVars['Target_Width'] - 60
  GGF.Theme.themes['Target']['Caption']['Height']                   = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Caption']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Target_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Target']['Caption']['FontColor']                = GGF.SavedVars['Target_FontColor']
  
  GGF.Theme.themes['Target']['RankLb']['Height']                   = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['RankLb']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Font']).."|"..tostring(GGF.SavedVars['Target_FontSize']).."|"..GGF.SavedVars['Font_Style']
  GGF.Theme.themes['Target']['RankLb']['FontColor']                = GGF.SavedVars['Target_FontColor']
  
  GGF.Theme.themes['Target']['Health']['Shield']['Height']   = GGF.SavedVars['Target_Shield_Height'] - 2
  GGF.Theme.themes['Target']['Health']['Shield']['BarColor'] = GGF.SavedVars['Target_Shield_BarColor']
  GGF.Theme.themes['Target']['Health']['Shield']['Texture']  = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Bar_Texture'])
  
  GGF.Theme.themes['Target']['Magicka'] = false
  GGF.Theme.themes['Target']['Stamina'] = false
  GGF.Theme.themes['Target']['Experience'] = false
  GGF.Theme.themes['Target']['Mount'] = false
  GGF.Theme.themes['Target']['Leader'] = false
  
  -- Target Container
  local height = (GGF.Theme.themes['Target']['Health']['Height'] + GGF.Theme.themes['Target']['Name']['Height'] + GGF.Theme.themes['Target']['Name']['Height'] + 2)
  GGF.Theme.themes['Target']['Width']                            = GGF.SavedVars['Target_Width']
  GGF.Theme.themes['Target']['Height']                           = height

  GGF.Theme.themes['TargetContainer'] = {
    ['OffsetX'] = GGF.SavedVars['TargetContainer_OffsetX'],
    ['OffsetY'] = GGF.SavedVars['TargetContainer_OffsetY'],
    ['Width']   = GGF.SavedVars['Target_Width'],
    ['Height']  = height,
    ['Alpha']   = GGF.SavedVars['Target_Combat_Alpha']/100,
    ['Label']   = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ['Width']     = GGF.SavedVars['Target_Width'],
      ['Height']    = height,
      ['Font']      = 'ggFrames\\theme\\fonts\\BebasNeue.otf|20',
      ['FontColor'] = {1,1,1,1},
      ["VerticalAlign"] = TEXT_ALIGN_CENTER,
      ["HorizontalAlign"] = TEXT_ALIGN_CENTER
    }
  }
end

