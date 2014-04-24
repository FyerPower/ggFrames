-- /esoui/art/campaign/overview_scoringbg_ebonheart_left.dds

GGF.Template = {
-- ------------------------------------------------------------ --
--                            BASE                              --
-- ------------------------------------------------------------ --
  ["Base"] = {
    ["Width"] = 300,
    ["Height"] = 120,
    ["MyAnchor"] = TOPLEFT,
    ["ParentAnchor"] = TOPLEFT,
    ["OffsetX"] = 0,
    ["OffsetY"] = 0,
    ["BackColor"] = "000000",
    ["BackAlpha"] = 0,
    ["EdgeColor"] = "000000",
    ["EdgeAlpha"] = 0,
    ["EdgeWeight"] = 0,
    ["Hidden"] = true,
    ["Name"] = {
      ["Width"] = 200,
      ["Height"] = 20,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 0,
      ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|16",
      ["Scale"] = 1,
      ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
      ["VerticalAlign"] = TEXT_ALIGN_LEFT,
      ["FontColor"] = "FFFFFF",
      ["FontAlpha"] = 1
    },
    ["Level"] = {
      ["Width"] = 50,
      ["Height"] = 20,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPRIGHT,
      ["OffsetX"] = 5,
      ["OffsetY"] = 0,
      ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|16",
      ["Scale"] = 1,
      ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
      ["VerticalAlign"] = TEXT_ALIGN_LEFT,
      ["FontColor"] = "FFFFFF",
      ["FontAlpha"] = 1
    },
    ["Class"] = {
      ["Width"] = 20,
      ["Height"] = 20,
      ["MyAnchor"] = TOPRIGHT,
      ["ParentAnchor"] = TOPRIGHT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 0,
      ["Scale"] = 1,
      ["Alpha"] = 1,
      ["Texture"] = "/esoui/art/charactercreate/charactercreate_classicon_up.dds"
    },
    ["Leader"] = {
      ["Width"] = 20,
      ["Height"] = 20,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 0,
      ["Scale"] = 1,
      ["Alpha"] = 1,
      ["Hidden"] = true,
      ["Texture"] = "/esoui/art/lfg/lfg_leader_icon.dds"
    },
    ["Death"] = {
      ["Width"] = 300,
      ["Height"] = 36,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 20,
      ["Hidden"] = true,
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = 1,
      ["EdgeWeight"] = 1,
      ["Label"] = {
        ["Width"] = 295,
        ["Height"] = 20,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 5,
        ["OffsetY"] = 10,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_LEFT,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      }
    },
    ["Offline"] = {
      ["Width"] = 300,
      ["Height"] = 36,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 20,
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = 1,
      ["EdgeWeight"] = 1,
      ["Hidden"] = true,
      ["Label"] = {
        ["Width"] = 295,
        ["Height"] = 20,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 5,
        ["OffsetY"] = 10,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_LEFT,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      }
    },
    ["Health"] = {
      ["Width"] = 300,
      ["Height"] = 36,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 20,
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = 1,
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["Width"] = 298,
        ["Height"] = 34,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["BarColor"] = "D42625",
        ["BarAlpha"] = 1,
        ["Texture"] = "ggFrames\\textures\\cloth.dds"
      },
      ["TextLeft"] = {
        ["Width"] = 195,
        ["Height"] = 36,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["OffsetY"] = 0,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      },
      ["TextRight"] = {
        ["Width"] = 95,
        ["Height"] = 36,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["OffsetX"] = -5,
        ["OffsetY"] = 0,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      }
    },
    ["Magicka"] = {
      ["Width"] = 300,
      ["Height"] = 16,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 55, -- 20 + 36 - 1 (border overlap)
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = 1,
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["Width"] = 298,
        ["Height"] = 14,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["BarColor"] = "164BC6",
        ["BarAlpha"] = 1,
        ["Texture"] = "ggFrames\\textures\\cloth.dds"
      },
      ["TextLeft"] = {
        ["Width"] = 95,
        ["Height"] = 14,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["OffsetY"] = -1,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|12",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      },
      ["TextRight"] = {
        ["Width"] = 95,
        ["Height"] = 14,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["OffsetX"] = -5,
        ["OffsetY"] = -1,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|12",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      }
    },
    ["Stamina"] = {
      ["Width"] = 300,
      ["Height"] = 16,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 70, -- 55 + 16 - 1 (border overlap)
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = .8,
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["Width"] = 298,
        ["Height"] = 14,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["BarColor"] = "CBA40B",
        ["BarAlpha"] = 1,
        ["Texture"] = "ggFrames\\textures\\cloth.dds"
      },
      ["TextLeft"] = {
        ["Width"] = 95,
        ["Height"] = 14,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["OffsetY"] = -1,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|12",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      },
      ["TextRight"] = {
        ["Width"] = 95,
        ["Height"] = 14,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["OffsetX"] = -5,
        ["OffsetY"] = -1,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|12",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      }
    },
    ["Experience"] = {
      ["Width"] = 300,
      ["Height"] = 8,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 85, -- 70 + 16 - 1 (border overlap)
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = .8,
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["Width"] = 298,
        ["Height"] = 6,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["BarColor"] = "FFFFFF",
        ["BarAlpha"] = 1,
        ["Texture"] = "ggFrames\\textures\\cloth.dds"
      }
    },
    ["Mount"] = {
      ["Width"] = 220,
      ["Height"] = 20,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 80,
      ["OffsetY"] = 100, -- 85 + 6 + 9(space)"BackColor"] = "000000",
      ["BackColor"] = "000000",
      ["BackAlpha"] = 0,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = 0,
      ["EdgeWeight"] = 0,
      ["Hidden"] = true;
      ["Icon"] = {
        ["Width"] = 20,
        ["Height"] = 20,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 0,
        ["OffsetY"] = 0,
        ["Scale"] = 1,
        ["Alpha"] = 1,
        ["Texture"] = "/esoui/art/mounts/tabicon_mounts_down.dds"
      },
      ["BarArea"] = {
        ["Width"] = 200,
        ["Height"] = 8,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 20,
        ["OffsetY"] = 6,
        ["BackColor"] = "000000",
        ["BackAlpha"] = .6,
        ["EdgeColor"] = "000000",
        ["EdgeAlpha"] = .8,
        ["EdgeWeight"] = 1,
        ["Bar"] = {
          ["Width"] = 198,
          ["Height"] = 6,
          ["MyAnchor"] = TOPLEFT,
          ["ParentAnchor"] = TOPLEFT,
          ["OffsetX"] = 1,
          ["OffsetY"] = 1,
          ["BarColor"] = "eeee00",
          ["BarAlpha"] = 1,
          ["Texture"] = "ggFrames\\textures\\cloth.dds"
        }
      }
    }
  },
  
-- ------------------------------------------------------------ --
--                          PLAYER                              --
-- ------------------------------------------------------------ --
  
  ["PlayerContainer"] = {
    ["Width"] = 300,
    ["Height"] = 120,
    ["MyAnchor"] = TOPLEFT,
    ["ParentAnchor"] = TOPLEFT,
    ["OffsetX"] = 3,
    ["OffsetY"] = 3,
  },
  ["Player"] = {
  },
  
-- ------------------------------------------------------------ --
--                          GROUP                               --
-- ------------------------------------------------------------ --
  
  ["GroupContainer"] = {
    ["Width"] = 300,
    ["Height"] = 240,
    ["MyAnchor"] = TOPLEFT,
    ["ParentAnchor"] = TOPLEFT,
    ["OffsetX"] = 3,
    ["OffsetY"] = 140,
  },
  ["Group1"] = {
    ["OffsetX"] = 0,
    ["OffsetY"] = 0,
    ["Magicka"] = false,
    ["Stamina"] = false,
    ["Experience"] = false,
    ["Mount"] = false
  },
  ["Group2"] = {
    ["OffsetX"] = 0,
    ["OffsetY"] = 80,
    ["Magicka"] = false,
    ["Stamina"] = false,
    ["Experience"] = false,
    ["Mount"] = false
  },
  ["Group3"] = {
    ["OffsetX"] = 0,
    ["OffsetY"] = 160,
    ["Magicka"] = false,
    ["Stamina"] = false,
    ["Experience"] = false,
    ["Mount"] = false
  },

-- ------------------------------------------------------------ --
--                       LARGE GROUP                            --
-- ------------------------------------------------------------ --
  ["LargeGroupContainer"] = {
    ["Width"] = 600,
    ["Height"] = 300,
    ["MyAnchor"] = TOPLEFT,
    ["ParentAnchor"] = TOPLEFT,
    ["OffsetX"] = 3,
    ["OffsetY"] = 140
  },
  ["LargeGroupBase"] = {
    ["Width"] = 100,
    ["Height"] = 36,
    ["MyAnchor"] = TOPLEFT,
    ["ParentAnchor"] = TOPLEFT,
    ["OffsetX"] = 0,
    ["OffsetY"] = 0,
    ["BackColor"] = "000000",
    ["BackAlpha"] = .6,
    ["EdgeColor"] = "000000",
    ["EdgeAlpha"] = 1,
    ["EdgeWeight"] = 1,
    ["Hidden"] = true,
    ["Name"] = {
      ["Width"] = 98,
      ["Height"] = 16,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 2,
      ["OffsetY"] = 2,
      ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
      ["Scale"] = 1,
      ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
      ["VerticalAlign"] = TEXT_ALIGN_CENTER,
      ["FontColor"] = "FFFFFF",
      ["FontAlpha"] = 1
    },
    ["Level"] = false,
    ["Class"] = false,
    ["Death"] = {
      ["Width"] = 100,
      ["Height"] = 36,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 0,
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = 1,
      ["EdgeWeight"] = 1,
      ["Hidden"] = true,
      ["Label"] = {
        ["Width"] = 98,
        ["Height"] = 16,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 2,
        ["OffsetY"] = 20,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      }
    },
    ["Offline"] = {
      ["Width"] = 100,
      ["Height"] = 36,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 0,
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = 1,
      ["EdgeWeight"] = 1,
      ["Hidden"] = true,
      ["Label"] = {
        ["Width"] = 98,
        ["Height"] = 16,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 2,
        ["OffsetY"] = 20,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = 1
      }
    },
    ["Leader"] = {
      ["Width"] = 20,
      ["Height"] = 20,
      ["MyAnchor"] = BOTTOMRIGHT,
      ["ParentAnchor"] = BOTTOMRIGHT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 0,
      ["Scale"] = 1,
      ["Alpha"] = 1,
      ["Hidden"] = true,
      ["Texture"] = "/esoui/art/lfg/lfg_leader_icon.dds"
    },
    ["Health"] = {
      ["Width"] = 100,
      ["Height"] = 36,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 0,
      ["BackColor"] = "000000",
      ["BackAlpha"] = .6,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = 1,
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["Width"] = 98,
        ["Height"] = 34,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["BarColor"] = "D42625",
        ["BarAlpha"] = 1,
        ["Texture"] = "ggFrames\\textures\\cloth.dds"
      },
      ["TextLeft"] = false,
      ["TextRight"] = false
    },
    ["Magicka"] = false,
    ["Stamina"] = false,
    ["Experience"] = false,
    ["Mount"] = false
  },
  ["LargeGroup1"] =  { ["OffsetX"] = 0, ["OffsetY"] = 0, },
  ["LargeGroup2"] =  { ["OffsetX"] = 0, ["OffsetY"] = 35,},
  ["LargeGroup3"] =  { ["OffsetX"] = 0, ["OffsetY"] = 70,},
  ["LargeGroup4"] =  { ["OffsetX"] = 0, ["OffsetY"] = 105,},
  ["LargeGroup5"] =  { ["OffsetX"] = 99, ["OffsetY"] = 0, },
  ["LargeGroup6"] =  { ["OffsetX"] = 99, ["OffsetY"] = 35,},
  ["LargeGroup7"] =  { ["OffsetX"] = 99, ["OffsetY"] = 70,},
  ["LargeGroup8"] =  { ["OffsetX"] = 99, ["OffsetY"] = 105,},
  ["LargeGroup9"] =  { ["OffsetX"] = 198, ["OffsetY"] = 0, },
  ["LargeGroup10"] = { ["OffsetX"] = 198, ["OffsetY"] = 35,},
  ["LargeGroup11"] = { ["OffsetX"] = 198, ["OffsetY"] = 70,},
  ["LargeGroup12"] = { ["OffsetX"] = 198, ["OffsetY"] = 105,},
  ["LargeGroup13"] = { ["OffsetX"] = 297, ["OffsetY"] = 0, },
  ["LargeGroup14"] = { ["OffsetX"] = 297, ["OffsetY"] = 35,},
  ["LargeGroup15"] = { ["OffsetX"] = 297, ["OffsetY"] = 70,},
  ["LargeGroup16"] = { ["OffsetX"] = 297, ["OffsetY"] = 105,},
  ["LargeGroup17"] = { ["OffsetX"] = 396, ["OffsetY"] = 0, },
  ["LargeGroup18"] = { ["OffsetX"] = 396, ["OffsetY"] = 35,},
  ["LargeGroup19"] = { ["OffsetX"] = 396, ["OffsetY"] = 70,},
  ["LargeGroup20"] = { ["OffsetX"] = 396, ["OffsetY"] = 105,},
  ["LargeGroup21"] = { ["OffsetX"] = 495, ["OffsetY"] = 0, },
  ["LargeGroup22"] = { ["OffsetX"] = 495, ["OffsetY"] = 35,},
  ["LargeGroup23"] = { ["OffsetX"] = 495, ["OffsetY"] = 70,},
  ["LargeGroup24"] = { ["OffsetX"] = 495, ["OffsetY"] = 105,},

-- ------------------------------------------------------------ --
--                          TARGET                              --
-- ------------------------------------------------------------ --
  
  ["Target"] = {
    ["OffsetX"] = 800,
    ["OffsetY"] = 0,
    ["Leader"] = false,
    ["Tank"] = false,
    ["Heal"] = false,
    ["Dps"] = false,
    ["Name"] = {
      ["Width"] = 200,
      ["OffsetX"] = 0
    }
  },
  
-- ------------------------------------------------------------ --
--                     TARGET OF TARGET                         --
-- ------------------------------------------------------------ --
  
  ["TargetOfTarget"] = {
    ["OffsetX"] = 1130,
    ["OffsetY"] = 60,
    ["Magicka"] = false,
    ["Stamina"] = false,
    ["Leader"] = false,
    ["Tank"] = false,
    ["Heal"] = false,
    ["Dps"] = false,
    ["Name"] = {
      ["Width"] = 200,
      ["OffsetX"] = 0
    }
  }
}
