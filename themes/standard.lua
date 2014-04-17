-- /esoui/art/campaign/overview_scoringbg_ebonheart_left.dds

GGF.Template = {
-- ------------------------------------------------------------ --
--                            BASE                              --
-- ------------------------------------------------------------ --
  ["Base"] = {
    ["Width"] = 300,
    ["Height"] = 91,
    ["MyAnchor"] = TOPLEFT,
    ["ParentAnchor"] = TOPLEFT,
    ["OffsetX"] = 3,
    ["OffsetY"] = 3,
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
      ["FontAlpha"] = .8
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
      ["Width"] = 30,
      ["Height"] = 30,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 0,
      ["Scale"] = 1,
      ["Alpha"] = 1,
      ["Texture"] = "/esoui/art/lfg/lfg_leader_icon.dds"
    },
    ["Tank"] = {
      ["Width"] = 30,
      ["Height"] = 30,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 140,
      ["OffsetY"] = 0,
      ["Scale"] = 1,
      ["Alpha"] = .2,
      ["Texture"] = "/esoui/art/lfg/lfg_tank_down.dds"
    },
    ["Heal"] = {
      ["Width"] = 30,
      ["Height"] = 30,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 160,
      ["OffsetY"] = 0,
      ["Scale"] = 1,
      ["Alpha"] = .2,
      ["Texture"] = "/esoui/art/lfg/lfg_healer_down.dds"
    },
    ["Dps"] = {
      ["Width"] = 30,
      ["Height"] = 30,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 180,
      ["OffsetY"] = 0,
      ["Scale"] = 1,
      ["Alpha"] = .2,
      ["Texture"] = "/esoui/art/lfg/lfg_dps_up.dds"
    },
    ["Death"] = {
      ["Width"] = 295,
      ["Height"] = 20,
      ["MyAnchor"] = TOPRIGHT,
      ["ParentAnchor"] = TOPRIGHT,
      ["OffsetX"] = 5,
      ["OffsetY"] = 5,
      ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
      ["Scale"] = 1,
      ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
      ["VerticalAlign"] = TEXT_ALIGN_LEFT,
      ["FontColor"] = "FFFFFF",
      ["FontAlpha"] = .8,
      ["Hidden"] = true,
      ["Text"] = "Death"
    },
    ["Offline"] = {
      ["Width"] = 295,
      ["Height"] = 20,
      ["MyAnchor"] = TOPRIGHT,
      ["ParentAnchor"] = TOPRIGHT,
      ["OffsetX"] = 5,
      ["OffsetY"] = 5,
      ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
      ["Scale"] = 1,
      ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
      ["VerticalAlign"] = TEXT_ALIGN_LEFT,
      ["FontColor"] = "FFFFFF",
      ["FontAlpha"] = .8,
      ["Hidden"] = true,
      ["Text"] = "Offline"
    },
    ["Health"] = {
      ["Width"] = 300,
      ["Height"] = 36,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 20,
      ["BackColor"] = "000000",
      ["BackAlpha"] = .3,
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
        ["BarAlpha"] = .8,
        ["Texture"] = "ggFrames\\textures\\cement.dds"
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
        ["FontAlpha"] = .8
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
        ["FontAlpha"] = .8
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
      ["BackAlpha"] = .3,
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
        ["BarAlpha"] = .8,
        ["Texture"] = "ggFrames\\textures\\cement.dds"
      },
      ["TextLeft"] = {
        ["Width"] = 95,
        ["Height"] = 14,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["OffsetY"] = -2,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = .8
      },
      ["TextRight"] = {
        ["Width"] = 95,
        ["Height"] = 14,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["OffsetX"] = -5,
        ["OffsetY"] = -2,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = .8
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
      ["BackAlpha"] = .3,
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
        ["Texture"] = "ggFrames\\textures\\cement.dds"
      },
      ["TextLeft"] = {
        ["Width"] = 95,
        ["Height"] = 14,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["OffsetY"] = -2,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_LEFT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = .8
      },
      ["TextRight"] = {
        ["Width"] = 95,
        ["Height"] = 14,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["OffsetX"] = -5,
        ["OffsetY"] = -2,
        ["Font"] = "ggFrames\\themes\\fonts\\Lintel.otf|14",
        ["Scale"] = 1,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,
        ["FontColor"] = "FFFFFF",
        ["FontAlpha"] = .8
      }
    },
    ["Experience"] = {
      ["Width"] = 300,
      ["Height"] = 6,
      ["MyAnchor"] = TOPLEFT,
      ["ParentAnchor"] = TOPLEFT,
      ["OffsetX"] = 0,
      ["OffsetY"] = 85, -- 70 + 16 - 1 (border overlap)
      ["BackColor"] = "000000",
      ["BackAlpha"] = .3,
      ["EdgeColor"] = "000000",
      ["EdgeAlpha"] = .8,
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["Width"] = 298,
        ["Height"] = 4,
        ["MyAnchor"] = TOPLEFT,
        ["ParentAnchor"] = TOPLEFT,
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["BarColor"] = "FFFFFF",
        ["BarAlpha"] = 1,
        ["Texture"] = "ggFrames\\textures\\cement.dds"
      }
    }
  },
  
-- ------------------------------------------------------------ --
--                          PLAYER                              --
-- ------------------------------------------------------------ --
  
  ["player"] = {
  },
  
-- ------------------------------------------------------------ --
--                          GROUP                               --
-- ------------------------------------------------------------ --
  
  ["group1"] = {
    ["OffsetX"] = 0,
    ["OffsetY"] = 110
  },

  ["group2"] = {
    ["OffsetX"] = 0,
    ["OffsetY"] = 220
  },

  ["group3"] = {
    ["OffsetX"] = 0,
    ["OffsetY"] = 330
  },

-- ------------------------------------------------------------ --
--                          TARGET                              --
-- ------------------------------------------------------------ --
  
  ["Target"] = {
    ["OffsetX"] = 800,
    ["OffsetY"] = 0,
    ["Leader"] = nil,
    ["Tank"] = nil,
    ["Heal"] = nil,
    ["Dps"] = nil,
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
    ["Magicka"] = nil,
    ["Stamina"] = nil,
    ["Leader"] = nil,
    ["Tank"] = nil,
    ["Heal"] = nil,
    ["Dps"] = nil,
    ["Name"] = {
      ["Width"] = 200,
      ["OffsetX"] = 0
    }
  }
}
