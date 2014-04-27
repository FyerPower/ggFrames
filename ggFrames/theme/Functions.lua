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
  GGF.Theme.LMP:Register('font', 'Accidental President',             'ggFrames\\theme\\themes\\fonts\\AccidentalPresident.ttf')
  GGF.Theme.LMP:Register('font', 'Alegre Sans',                      'ggFrames\\theme\\themes\\fonts\\AlegreSans.ttf')
  GGF.Theme.LMP:Register('font', 'Alte Haas Grotesk',                'ggFrames\\theme\\themes\\fonts\\AlteHaasGroteskRegular.ttf')
  GGF.Theme.LMP:Register('font', 'Alte Haas Grotesk Bold',           'ggFrames\\theme\\themes\\fonts\\AlteHaasGroteskBold.ttf')
  GGF.Theme.LMP:Register('font', 'Antonio',                          'ggFrames\\theme\\themes\\fonts\\AntonioRegular.ttf')
  GGF.Theme.LMP:Register('font', 'Arial Bold',                       'ggFrames\\theme\\themes\\fonts\\ArialBold.ttf')
  GGF.Theme.LMP:Register('font', 'Bebas Neue',                       'ggFrames\\theme\\themes\\fonts\\BebasNeue.otf')
  GGF.Theme.LMP:Register('font', 'Bench Nine',                       'ggFrames\\theme\\themes\\fonts\\BenchNineRegular.otf')
  GGF.Theme.LMP:Register('font', 'Bench Nine Bold',                  'ggFrames\\theme\\themes\\fonts\\BenchNineBold.otf')
  GGF.Theme.LMP:Register('font', 'Economica',                        'ggFrames\\theme\\themes\\fonts\\EconomicaRegular.otf')
  GGF.Theme.LMP:Register('font', 'Economica Bold',                   'ggFrames\\theme\\themes\\fonts\\EconomicaBold.otf')
  GGF.Theme.LMP:Register('font', 'Enigma Bold',                      'ggFrames\\theme\\themes\\fonts\\EnigmaBold.ttf')
  GGF.Theme.LMP:Register('font', 'Enigma',                           'ggFrames\\theme\\themes\\fonts\\EnigmaReg.ttf')
  GGF.Theme.LMP:Register('font', 'Fertigo Pro',                      'ggFrames\\theme\\themes\\fonts\\FertigoProRegular.ttf')
  GGF.Theme.LMP:Register('font', 'Futura Extended',                  'ggFrames\\theme\\themes\\fonts\\FuturaExtended.ttf')
  GGF.Theme.LMP:Register('font', 'Univers 55 Bold',                  'ggFrames\\theme\\themes\\fonts\\Univers55Bold.ttf')

  GGF.Theme.fonts = GGF.Theme.LMP:List('font')
end

function GGF.Theme.LoadTextures()
  GGF.Theme.LMP:Register('statusbar', 'Aluminium',              'ggFrames\\theme\\themes\\textures\\Aluminium.dds')
  GGF.Theme.LMP:Register('statusbar', 'Elder Scrolls Gradiant', 'ggFrames\\theme\\themes\\textures\\ElderScrollsGrad.dds')
  GGF.Theme.LMP:Register('statusbar', 'Glass',                  'ggFrames\\theme\\themes\\textures\\Glass.dds')
  GGF.Theme.LMP:Register('statusbar', 'Glaze',                  'ggFrames\\theme\\themes\\textures\\Glaze.dds')
  GGF.Theme.LMP:Register('statusbar', 'Horizontal Gradiant 1',  'ggFrames\\theme\\themes\\textures\\HorizontalGrad.dds')
  GGF.Theme.LMP:Register('statusbar', 'Horizontal Gradiant 2',  'ggFrames\\theme\\themes\\textures\\HorizontalGradV2.dds')
  GGF.Theme.LMP:Register('statusbar', 'Inner Glow',             'ggFrames\\theme\\themes\\textures\\InnerGlow.dds')
  GGF.Theme.LMP:Register('statusbar', 'Inner Shadow',           'ggFrames\\theme\\themes\\textures\\InnerShadow.dds')
  GGF.Theme.LMP:Register('statusbar', 'Inner Shadow Glossy',    'ggFrames\\theme\\themes\\textures\\InnerShadowGloss.dds')
  GGF.Theme.LMP:Register('statusbar', 'Minimalistic',           'ggFrames\\theme\\themes\\textures\\Minimalistic.dds')
  GGF.Theme.LMP:Register('statusbar', 'Normal',                 'ggFrames\\theme\\themes\\textures\\Normal.dds')
  GGF.Theme.LMP:Register('statusbar', 'Round',                  'ggFrames\\theme\\themes\\textures\\Round.dds')
  GGF.Theme.LMP:Register('statusbar', 'Sand Paper 1',           'ggFrames\\theme\\themes\\textures\\SandPaper.dds')
  GGF.Theme.LMP:Register('statusbar', 'Sand Paper 2',           'ggFrames\\theme\\themes\\textures\\SandPaperV2.dds')
  GGF.Theme.LMP:Register('statusbar', 'Shadow',                 'ggFrames\\theme\\themes\\textures\\Shadow.dds')
  GGF.Theme.LMP:Register('statusbar', 'Smooth',                 'ggFrames\\theme\\themes\\textures\\Smooth.dds')
  
  GGF.Theme.textures = GGF.Theme.LMP:List('statusbar')
end

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

function GGF.Theme.LoadPlayer()
  local currentHeight = 0
  
  GGF.Theme.themes['Player']                                      = GGF.Utils:DeepCopy(GGF.Template["Unit"])
  GGF.Theme.themes['Player']['Width']                             = GGF.SavedVars['Player_Width']
  
  GGF.Theme.themes['Player']['Name']['Height']                    = GGF.SavedVars['Player_FontSize'] + 4
  GGF.Theme.themes['Player']['Name']['Font']                      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Font']).."|"..tostring(GGF.SavedVars['Player_FontSize'])
  GGF.Theme.themes['Player']['Name']['FontColor']                 = GGF.SavedVars['Player_FontColor']
  GGF.Theme.themes['Player']['Level']['Height']                   = GGF.SavedVars['Player_FontSize'] + 4
  GGF.Theme.themes['Player']['Level']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Font']).."|"..tostring(GGF.SavedVars['Player_FontSize'])
  GGF.Theme.themes['Player']['Level']['FontColor']                = GGF.SavedVars['Player_FontColor']
  GGF.Theme.themes['Player']['Class']['Height']                   = GGF.SavedVars['Player_FontSize'] + 4
  GGF.Theme.themes['Player']['Class']['Width']                    = GGF.SavedVars['Player_FontSize'] + 4
  GGF.Theme.themes['Player']['Death']['Width']                    = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Death']['Height']                   = GGF.SavedVars['Player_Health_Height']
  GGF.Theme.themes['Player']['Death']['Label']['Font']            = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Font']).."|"..tostring(GGF.SavedVars['Player_FontSize'])
  GGF.Theme.themes['Player']['Death']['Label']['FontColor']       = GGF.SavedVars['Player_FontColor']
  GGF.Theme.themes['Player']['Offline']['Width']                  = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Offline']['Height']                 = GGF.SavedVars['Player_Health_Height']
  GGF.Theme.themes['Player']['Offline']['Label']['Font']          = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Font']).."|"..tostring(GGF.SavedVars['Player_FontSize'])
  GGF.Theme.themes['Player']['Offline']['Label']['FontColor']     = GGF.SavedVars['Player_FontColor']
  currentHeight = currentHeight + GGF.Theme.themes['Player']['Name']['Height']
  
  GGF.Theme.themes['Player']['Health']['OffsetY']                 = currentHeight
  GGF.Theme.themes['Player']['Health']['Width']                   = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Health']['Bar']['Width']            = GGF.SavedVars['Player_Width'] - 2
  GGF.Theme.themes['Player']['Health']['Height']                  = GGF.SavedVars['Player_Health_Height']
  GGF.Theme.themes['Player']['Health']['Bar']['Height']           = GGF.SavedVars['Player_Health_Height'] - 2
  GGF.Theme.themes['Player']['Health']['Bar']['BarColor']         = GGF.SavedVars['Player_Health_BarColor']
  GGF.Theme.themes['Player']['Health']['Bar']['Texture']          = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Player_Health_Texture'])
  GGF.Theme.themes['Player']['Health']['TextLeft']['Height']      = GGF.SavedVars['Player_Health_Height'] - 2
  GGF.Theme.themes['Player']['Health']['TextLeft']['Font']        = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Health_Font']).."|"..tostring(GGF.SavedVars['Player_Health_FontSize'])
  GGF.Theme.themes['Player']['Health']['TextLeft']['FontColor']   = GGF.SavedVars['Player_Health_FontColor']
  GGF.Theme.themes['Player']['Health']['TextRight']['Height']     = GGF.SavedVars['Player_Health_Height'] - 2
  GGF.Theme.themes['Player']['Health']['TextRight']['Font']       = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Health_Font']).."|"..tostring(GGF.SavedVars['Player_Health_FontSize'])
  GGF.Theme.themes['Player']['Health']['TextRight']['FontColor']  = GGF.SavedVars['Player_Health_FontColor']
  currentHeight = currentHeight + GGF.Theme.themes['Player']['Health']['Height'] - 1
  
  GGF.Theme.themes['Player']['Magicka']['OffsetY']                = currentHeight
  GGF.Theme.themes['Player']['Magicka']['Width']                  = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Magicka']['Bar']['Width']           = GGF.SavedVars['Player_Width'] - 2
  GGF.Theme.themes['Player']['Magicka']['Height']                 = GGF.SavedVars['Player_Magicka_Height']
  GGF.Theme.themes['Player']['Magicka']['Bar']['Height']          = GGF.SavedVars['Player_Magicka_Height'] - 2
  GGF.Theme.themes['Player']['Magicka']['Bar']['BarColor']        = GGF.SavedVars['Player_Magicka_BarColor']
  GGF.Theme.themes['Player']['Magicka']['Bar']['Texture']         = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Player_Magicka_Texture'])
  GGF.Theme.themes['Player']['Magicka']['TextLeft']['Height']     = GGF.SavedVars['Player_Magicka_Height'] - 2
  GGF.Theme.themes['Player']['Magicka']['TextLeft']['Font']       = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Magicka_Font']).."|"..tostring(GGF.SavedVars['Player_Magicka_FontSize'])
  GGF.Theme.themes['Player']['Magicka']['TextLeft']['FontColor']  = GGF.SavedVars['Player_Magicka_FontColor']
  GGF.Theme.themes['Player']['Magicka']['TextRight']['Height']    = GGF.SavedVars['Player_Magicka_Height'] - 2
  GGF.Theme.themes['Player']['Magicka']['TextRight']['Font']      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Magicka_Font']).."|"..tostring(GGF.SavedVars['Player_Magicka_FontSize'])
  GGF.Theme.themes['Player']['Magicka']['TextRight']['FontColor'] = GGF.SavedVars['Player_Magicka_FontColor']
  currentHeight = currentHeight + GGF.Theme.themes['Player']['Magicka']['Height'] - 1
  
  GGF.Theme.themes['Player']['Stamina']['OffsetY']                = currentHeight
  GGF.Theme.themes['Player']['Stamina']['Width']                  = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['Player']['Stamina']['Bar']['Width']           = GGF.SavedVars['Player_Width'] - 2
  GGF.Theme.themes['Player']['Stamina']['Height']                 = GGF.SavedVars['Player_Stamina_Height']
  GGF.Theme.themes['Player']['Stamina']['Bar']['Height']          = GGF.SavedVars['Player_Stamina_Height'] - 2
  GGF.Theme.themes['Player']['Stamina']['Bar']['BarColor']        = GGF.SavedVars['Player_Stamina_BarColor']
  GGF.Theme.themes['Player']['Stamina']['Bar']['Texture']         = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Player_Stamina_Texture'])
  GGF.Theme.themes['Player']['Stamina']['TextLeft']['Height']     = GGF.SavedVars['Player_Stamina_Height'] - 2
  GGF.Theme.themes['Player']['Stamina']['TextLeft']['Font']       = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Stamina_Font']).."|"..tostring(GGF.SavedVars['Player_Stamina_FontSize'])
  GGF.Theme.themes['Player']['Stamina']['TextLeft']['FontColor']  = GGF.SavedVars['Player_Stamina_FontColor']
  GGF.Theme.themes['Player']['Stamina']['TextRight']['Height']    = GGF.SavedVars['Player_Stamina_Height'] - 2
  GGF.Theme.themes['Player']['Stamina']['TextRight']['Font']      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Stamina_Font']).."|"..tostring(GGF.SavedVars['Player_Stamina_FontSize'])
  GGF.Theme.themes['Player']['Stamina']['TextRight']['FontColor'] = GGF.SavedVars['Player_Stamina_FontColor']
  currentHeight = currentHeight + GGF.Theme.themes['Player']['Stamina']['Height'] - 1

  if GGF.SavedVars['Player_Experience_Display'] then
    GGF.Theme.themes['Player']['Experience']['OffsetY']             = currentHeight
    GGF.Theme.themes['Player']['Experience']['Width']               = GGF.SavedVars['Player_Width']
    GGF.Theme.themes['Player']['Experience']['Height']              = GGF.SavedVars['Player_Experience_Height']
    GGF.Theme.themes['Player']['Experience']['Bar']['Width']        = GGF.SavedVars['Player_Width'] - 2
    GGF.Theme.themes['Player']['Experience']['Bar']['Height']       = GGF.SavedVars['Player_Experience_Height'] - 2
    GGF.Theme.themes['Player']['Experience']['Bar']['BarColor']     = GGF.SavedVars['Player_Experience_BarColor']
    GGF.Theme.themes['Player']['Experience']['Bar']['Texture']      = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Player_Experience_Texture'])
    currentHeight = currentHeight + GGF.Theme.themes['Player']['Stamina']['Height'] - 1
    if GGF.SavedVars['Player_Experience_Text_Display'] then
      GGF.Theme.themes['Player']['Experience']['Label'] = {}
      GGF.Theme.themes['Player']['Experience']['Label']['Height']     = GGF.SavedVars['Player_Experience_Height'] - 2
      GGF.Theme.themes['Player']['Experience']['Label']['Width']     = GGF.SavedVars['Player_Width'] - 2
      GGF.Theme.themes['Player']['Experience']['Label']['Font']      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Player_Experience_Font']).."|"..tostring(GGF.SavedVars['Player_Experience_FontSize'])
      GGF.Theme.themes['Player']['Experience']['Label']['FontColor'] = GGF.SavedVars['Player_Experience_FontColor']
      GGF.Theme.themes['Player']['Experience']['Label']['HorizontalAlign'] = TEXT_ALIGN_CENTER
    else
      GGF.Theme.themes['Player']['Experience']['Label'] = false
    end
  else
    GGF.Theme.themes['Player']['Experience'] = false
  end
  
  GGF.Theme.themes['Player']['Mount']['OffsetY']                    = currentHeight + 4
  GGF.Theme.themes['Player']['Mount']['BarArea']['Height']          = GGF.SavedVars['Player_Mount_Height']
  GGF.Theme.themes['Player']['Mount']['BarArea']['Bar']['Height']   = GGF.SavedVars['Player_Mount_Height'] - 2
  GGF.Theme.themes['Player']['Mount']['BarArea']['Bar']['BarColor'] = GGF.SavedVars['Player_Mount_BarColor']
  GGF.Theme.themes['Player']['Mount']['BarArea']['Bar']['Texture']  = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Player_Mount_Texture'])
  currentHeight = currentHeight + 29
  
  GGF.Theme.themes['Player']['Caption'] = false
  
  -- Player Container
  GGF.Theme.themes['PlayerContainer']                               = {}
  GGF.Theme.themes['PlayerContainer']['OffsetX']                    = GGF.SavedVars['PlayerContainer_OffsetX']
  GGF.Theme.themes['PlayerContainer']['OffsetY']                    = GGF.SavedVars['PlayerContainer_OffsetY']
  GGF.Theme.themes['PlayerContainer']['Width']                      = GGF.SavedVars['Player_Width']
  GGF.Theme.themes['PlayerContainer']['Height']                     = currentHeight
end

function GGF.Theme.LoadGroup()
  GGF.Theme.themes['Group']                                     = GGF.Utils:DeepCopy(GGF.Template["Unit"])
  GGF.Theme.themes['Group']['Width']                            = GGF.SavedVars['Group_Width']
  
  GGF.Theme.themes['Group']['Name']['Height']                   = GGF.SavedVars['Group_FontSize'] + 4
  GGF.Theme.themes['Group']['Name']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Group_Font']).."|"..tostring(GGF.SavedVars['Group_FontSize'])
  GGF.Theme.themes['Group']['Name']['FontColor']                = GGF.SavedVars['Group_FontColor']
  GGF.Theme.themes['Group']['Level']['Height']                  = GGF.SavedVars['Group_FontSize'] + 4
  GGF.Theme.themes['Group']['Level']['Font']                    = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Group_Font']).."|"..tostring(GGF.SavedVars['Group_FontSize'])
  GGF.Theme.themes['Group']['Level']['FontColor']               = GGF.SavedVars['Group_FontColor']
  GGF.Theme.themes['Group']['Class']['Height']                  = GGF.SavedVars['Group_FontSize'] + 4
  GGF.Theme.themes['Group']['Class']['Width']                   = GGF.SavedVars['Group_FontSize'] + 4
  GGF.Theme.themes['Group']['Death']['Width']                   = GGF.SavedVars['Group_Width']
  GGF.Theme.themes['Group']['Death']['Height']                  = GGF.SavedVars['Group_Health_Height']
  GGF.Theme.themes['Group']['Death']['Label']['Font']           = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Group_Font']).."|"..tostring(GGF.SavedVars['Group_FontSize'])
  GGF.Theme.themes['Group']['Death']['Label']['FontColor']      = GGF.SavedVars['Group_FontColor']
  GGF.Theme.themes['Group']['Offline']['Width']                 = GGF.SavedVars['Group_Width']
  GGF.Theme.themes['Group']['Offline']['Height']                = GGF.SavedVars['Group_Health_Height']
  GGF.Theme.themes['Group']['Offline']['Label']['Font']         = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Group_Font']).."|"..tostring(GGF.SavedVars['Group_FontSize'])
  GGF.Theme.themes['Group']['Offline']['Label']['FontColor']    = GGF.SavedVars['Group_FontColor']
  
  GGF.Theme.themes['Group']['Health']['OffsetY']                = GGF.Theme.themes['Group']['Name']['Height']
  GGF.Theme.themes['Group']['Health']['Width']                  = GGF.SavedVars['Group_Width']
  GGF.Theme.themes['Group']['Health']['Bar']['Width']           = GGF.SavedVars['Group_Width'] - 2
  GGF.Theme.themes['Group']['Health']['Height']                 = GGF.SavedVars['Group_Health_Height']
  GGF.Theme.themes['Group']['Health']['Bar']['Height']          = GGF.SavedVars['Group_Health_Height'] - 2
  GGF.Theme.themes['Group']['Health']['Bar']['BarColor']        = GGF.SavedVars['Group_Health_BarColor']
  GGF.Theme.themes['Group']['Health']['Bar']['Texture']         = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Group_Health_Texture'])
  GGF.Theme.themes['Group']['Health']['TextLeft']['Height']     = GGF.SavedVars['Group_Health_Height'] - 2
  GGF.Theme.themes['Group']['Health']['TextLeft']['Font']       = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Group_Health_Font']).."|"..tostring(GGF.SavedVars['Group_Health_FontSize'])
  GGF.Theme.themes['Group']['Health']['TextLeft']['FontColor']  = GGF.SavedVars['Group_Health_FontColor']
  GGF.Theme.themes['Group']['Health']['TextRight']['Height']    = GGF.SavedVars['Group_Health_Height'] - 2
  GGF.Theme.themes['Group']['Health']['TextRight']['Font']      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Group_Health_Font']).."|"..tostring(GGF.SavedVars['Group_Health_FontSize'])
  GGF.Theme.themes['Group']['Health']['TextRight']['FontColor'] = GGF.SavedVars['Group_Health_FontColor']

  GGF.Theme.themes['Group']['Magicka'] = false
  GGF.Theme.themes['Group']['Stamina'] = false
  GGF.Theme.themes['Group']['Experience'] = false
  GGF.Theme.themes['Group']['Mount'] = false
  GGF.Theme.themes['Group']['Caption'] = false
  
  -- Group Container
  GGF.Theme.themes['GroupContainer']                               = {}
  GGF.Theme.themes['GroupContainer']['OffsetX']                    = GGF.SavedVars['GroupContainer_OffsetX']
  GGF.Theme.themes['GroupContainer']['OffsetY']                    = GGF.SavedVars['GroupContainer_OffsetY']
  GGF.Theme.themes['GroupContainer']['Width']                      = GGF.SavedVars['Group_Width']

  for i = 1, 3 do
    GGF.Theme.themes['Group'..i] = GGF.Utils:DeepCopy(GGF.Theme.themes['Group'])
    GGF.Theme.themes['Group'..i]['OffsetY'] = (GGF.Theme.themes['Group']['Health']['Height'] + GGF.Theme.themes['Group']['Name']['Height'] + 14) * (i-1)
  end
  GGF.Theme.themes['GroupContainer']['Height'] = (GGF.Theme.themes['Group']['Health']['OffsetY'] + GGF.Theme.themes['Group']['Name']['Height'] + 20) * 3
end


function GGF.Theme.LoadLargeGroup()
  GGF.Theme.themes['LargeGroup']                                  = GGF.Utils:DeepCopy(GGF.Template["RaidUnit"])
  GGF.Theme.themes['LargeGroup']['Width']                         = GGF.SavedVars['LargeGroup_Width']
  GGF.Theme.themes['LargeGroup']['Height']                        = GGF.SavedVars['LargeGroup_Height']
  
  GGF.Theme.themes['LargeGroup']['Name']['Height']                = GGF.SavedVars['LargeGroup_FontSize'] + 4
  GGF.Theme.themes['LargeGroup']['Name']['Font']                  = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['LargeGroup_Font']).."|"..tostring(GGF.SavedVars['LargeGroup_FontSize'])
  GGF.Theme.themes['LargeGroup']['Name']['FontColor']             = GGF.SavedVars['LargeGroup_FontColor']
  GGF.Theme.themes['LargeGroup']['Death']['Width']                = GGF.SavedVars['LargeGroup_Width']
  GGF.Theme.themes['LargeGroup']['Death']['Height']               = GGF.SavedVars['LargeGroup_Height']
  GGF.Theme.themes['LargeGroup']['Death']['Label']['Font']        = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['LargeGroup_Font']).."|"..tostring(GGF.SavedVars['LargeGroup_FontSize'])
  GGF.Theme.themes['LargeGroup']['Death']['Label']['FontColor']   = GGF.SavedVars['LargeGroup_FontColor']
  GGF.Theme.themes['LargeGroup']['Offline']['Width']              = GGF.SavedVars['LargeGroup_Width']
  GGF.Theme.themes['LargeGroup']['Offline']['Height']             = GGF.SavedVars['LargeGroup_Height']
  GGF.Theme.themes['LargeGroup']['Offline']['Label']['Font']      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['LargeGroup_Font']).."|"..tostring(GGF.SavedVars['LargeGroup_FontSize'])
  GGF.Theme.themes['LargeGroup']['Offline']['Label']['FontColor'] = GGF.SavedVars['LargeGroup_FontColor']
  
  GGF.Theme.themes['LargeGroup']['Health']['Width']               = GGF.SavedVars['LargeGroup_Width']
  GGF.Theme.themes['LargeGroup']['Health']['Bar']['Width']        = GGF.SavedVars['LargeGroup_Width'] - 2
  GGF.Theme.themes['LargeGroup']['Health']['Height']              = GGF.SavedVars['LargeGroup_Height']
  GGF.Theme.themes['LargeGroup']['Health']['Bar']['Height']       = GGF.SavedVars['LargeGroup_Height'] - 2
  GGF.Theme.themes['LargeGroup']['Health']['Bar']['BarColor']     = GGF.SavedVars['LargeGroup_Health_BarColor']
  GGF.Theme.themes['LargeGroup']['Health']['Bar']['Texture']      = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['LargeGroup_Health_Texture'])
  
  GGF.Theme.themes['LargeGroup']['Magicka']                       = false
  GGF.Theme.themes['LargeGroup']['Stamina']                       = false
  GGF.Theme.themes['LargeGroup']['Experience']                    = false
  GGF.Theme.themes['LargeGroup']['Mount']                         = false
  
  -- Group Container
  GGF.Theme.themes['LargeGroupContainer']                         = {}
  GGF.Theme.themes['LargeGroupContainer']['OffsetX']              = GGF.SavedVars['LargeGroupContainer_OffsetX']
  GGF.Theme.themes['LargeGroupContainer']['OffsetY']              = GGF.SavedVars['LargeGroupContainer_OffsetY']

  for i = 1, 24 do 
    GGF.Theme.themes['LargeGroup'..i] = GGF.Utils:DeepCopy(GGF.Theme.themes['LargeGroup'])
    GGF.Theme.themes['LargeGroup'..i]['OffsetX'] = GGF.Theme.themes['LargeGroup']['Width'] * math.floor((i-1)/4)
    GGF.Theme.themes['LargeGroup'..i]['OffsetY'] = GGF.Theme.themes['LargeGroup']['Height'] * ((i-1)%4)
  end
  GGF.Theme.themes['LargeGroupContainer']['Width'] = GGF.Theme.themes['LargeGroup']['Width'] * 6
  GGF.Theme.themes['LargeGroupContainer']['Height'] = GGF.Theme.themes['LargeGroup']['Height'] * 4
end

function GGF.Theme.LoadTarget() 
  GGF.Theme.themes['Target']                                     = GGF.Utils:DeepCopy(GGF.Template["Unit"])
  GGF.Theme.themes['Target']['Width']                            = GGF.SavedVars['Target_Width']
  
  GGF.Theme.themes['Target']['Name']['Height']                   = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Name']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Target_Font']).."|"..tostring(GGF.SavedVars['Target_FontSize'])
  GGF.Theme.themes['Target']['Name']['FontColor']                = GGF.SavedVars['Target_FontColor']
  GGF.Theme.themes['Target']['Level']['Height']                  = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Level']['Font']                    = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Target_Font']).."|"..tostring(GGF.SavedVars['Target_FontSize'])
  GGF.Theme.themes['Target']['Level']['FontColor']               = GGF.SavedVars['Target_FontColor']
  GGF.Theme.themes['Target']['Class']['Height']                  = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Class']['Width']                   = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Death']['Width']                   = GGF.SavedVars['Target_Width']
  GGF.Theme.themes['Target']['Death']['Height']                  = GGF.SavedVars['Target_Health_Height']
  GGF.Theme.themes['Target']['Death']['Label']['Font']           = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Target_Font']).."|"..tostring(GGF.SavedVars['Target_FontSize'])
  GGF.Theme.themes['Target']['Death']['Label']['FontColor']      = GGF.SavedVars['Target_FontColor']
  GGF.Theme.themes['Target']['Offline']['Width']                 = GGF.SavedVars['Target_Width']
  GGF.Theme.themes['Target']['Offline']['Height']                = GGF.SavedVars['Target_Health_Height']
  GGF.Theme.themes['Target']['Offline']['Label']['Font']         = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Target_Font']).."|"..tostring(GGF.SavedVars['Target_FontSize'])
  GGF.Theme.themes['Target']['Offline']['Label']['FontColor']    = GGF.SavedVars['Target_FontColor']
  
  GGF.Theme.themes['Target']['Health']['OffsetY']                = GGF.Theme.themes['Target']['Name']['Height']
  GGF.Theme.themes['Target']['Health']['Width']                  = GGF.SavedVars['Target_Width']
  GGF.Theme.themes['Target']['Health']['Bar']['Width']           = GGF.SavedVars['Target_Width'] - 2
  GGF.Theme.themes['Target']['Health']['Height']                 = GGF.SavedVars['Target_Health_Height']
  GGF.Theme.themes['Target']['Health']['Bar']['Height']          = GGF.SavedVars['Target_Health_Height'] - 2
  GGF.Theme.themes['Target']['Health']['Bar']['BarColor']        = GGF.SavedVars['Target_Health_BarColor']
  GGF.Theme.themes['Target']['Health']['Bar']['Texture']         = GGF.Theme.LMP:Fetch('statusbar',GGF.SavedVars['Target_Health_Texture'])
  GGF.Theme.themes['Target']['Health']['TextLeft']['Height']     = GGF.SavedVars['Target_Health_Height'] - 2
  GGF.Theme.themes['Target']['Health']['TextLeft']['Font']       = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Target_Health_Font']).."|"..tostring(GGF.SavedVars['Target_Health_FontSize'])
  GGF.Theme.themes['Target']['Health']['TextLeft']['FontColor']  = GGF.SavedVars['Target_Health_FontColor']
  GGF.Theme.themes['Target']['Health']['TextRight']['Height']    = GGF.SavedVars['Target_Health_Height'] - 2
  GGF.Theme.themes['Target']['Health']['TextRight']['Font']      = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Target_Health_Font']).."|"..tostring(GGF.SavedVars['Target_Health_FontSize'])
  GGF.Theme.themes['Target']['Health']['TextRight']['FontColor'] = GGF.SavedVars['Target_Health_FontColor']

  GGF.Theme.themes['Target']['Caption']['Height']                   = GGF.SavedVars['Target_FontSize'] + 4
  GGF.Theme.themes['Target']['Caption']['Font']                     = GGF.Theme.LMP:Fetch('font',GGF.SavedVars['Target_Font']).."|"..tostring(GGF.SavedVars['Target_FontSize'])
  GGF.Theme.themes['Target']['Caption']['FontColor']                = GGF.SavedVars['Target_FontColor']

  GGF.Theme.themes['Target']['Magicka'] = false
  GGF.Theme.themes['Target']['Stamina'] = false
  GGF.Theme.themes['Target']['Experience'] = false
  GGF.Theme.themes['Target']['Mount'] = false
  
  -- Target Container
  GGF.Theme.themes['TargetContainer']            = {}
  GGF.Theme.themes['TargetContainer']['OffsetX'] = GGF.SavedVars['TargetContainer_OffsetX']
  GGF.Theme.themes['TargetContainer']['OffsetY'] = GGF.SavedVars['TargetContainer_OffsetY']
  GGF.Theme.themes['TargetContainer']['Width']   = GGF.SavedVars['Target_Width']
  GGF.Theme.themes['TargetContainer']['Height']  = (GGF.Theme.themes['Target']['Health']['OffsetY'] + GGF.Theme.themes['Target']['Name']['Height'] + 20)
end

