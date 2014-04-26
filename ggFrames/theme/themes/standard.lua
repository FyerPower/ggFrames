-- /esoui/art/campaign/overview_scoringbg_ebonheart_left.dds

GGF.Template = {
  ["PlayerContainer"] = {
  },
  ["GroupContainer"] = {
  },
  ["LargeGroupContainer"] = {
  },

  ["Unit"] = {
    ["BackColor"] = {0,0,0,0},
    ["EdgeColor"] = {0,0,0,0},
    ["EdgeWeight"] = 0,
    ["Hidden"] = true,
    ["Name"] = {
      ["Width"] = 200
    },
    ["Level"] = {
      ["Width"] = 100,
      ["ParentAnchor"] = TOPRIGHT,
      ["OffsetX"] = 5
    },
    ["Class"] = {
      ["MyAnchor"] = TOPRIGHT,
      ["ParentAnchor"] = TOPRIGHT,      
      ["Texture"] = "/esoui/art/charactercreate/charactercreate_classicon_up.dds"
    },
    ["Leader"] = {
      ["Width"] = 20,
      ["Height"] = 20,      
      ["Hidden"] = true,
      ["Texture"] = "/esoui/art/lfg/lfg_leader_icon.dds"
    },
    ["Death"] = {
      ["OffsetY"] = 20,
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Hidden"] = true,
      ["Label"] = {
        ["Width"] = 100,
        ["Height"] = 20,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,  
        ["OffsetX"] = 5,
        ["FontColor"] = {1,1,1,1},
        ["VerticalAlign"] = TEXT_ALIGN_CENTER
      }
    },
    ["Offline"] = {
      ["OffsetY"] = 20,
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Hidden"] = true,
      ["Label"] = {
        ["Width"] = 100,
        ["Height"] = 20,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,  
        ["OffsetX"] = 5,
        ["FontColor"] = {1,1,1,1},
        ["VerticalAlign"] = TEXT_ALIGN_CENTER
      }
    },
    ["Health"] = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
      },
      ["TextLeft"] = {
        ["Width"] = 100,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
      },
      ["TextRight"] = {
        ["Width"] = 100,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["OffsetX"] = -5,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
      }
    },
    ["Magicka"] = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
      },
      ["TextLeft"] = {
        ["Width"] = 100,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
      },
      ["TextRight"] = {
        ["Width"] = 100,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["OffsetX"] = -5,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
      }
    },
    ["Stamina"] = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
      },
      ["TextLeft"] = {
        ["Width"] = 100,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
      },
      ["TextRight"] = {
        ["Width"] = 100,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["OffsetX"] = -5,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
      }
    },
    ["Experience"] = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
      }
    },
    ["Mount"] = {
      ["MyAnchor"] = TOPRIGHT,
      ["ParentAnchor"] = TOPRIGHT,
      ["Width"] = 200,
      ["Height"] = 20,
      ["BackColor"] = {0,0,0,0},
      ["EdgeColor"] = {0,0,0,0},
      ["EdgeWeight"] = 0,
      ["Hidden"] = true;
      ["Icon"] = {
        ["Width"] = 20,
        ["Height"] = 20,        
        ["Texture"] = "/esoui/art/mounts/tabicon_mounts_down.dds"
      },
      ["BarArea"] = {
        ["Width"] = 180,
        ["OffsetX"] = 20,
        ["OffsetY"] = 6,
        ["BackColor"] = {0,0,0,.6},
        ["EdgeColor"] = {0,0,0,1},
        ["EdgeWeight"] = 1,
        ["Bar"] = {
          ["Width"] = 178,
          ["OffsetX"] = 1,
          ["OffsetY"] = 1,
        }
      }
    }
  },
  
  
  
  

-- ------------------------------------------------------------ --
--                       LARGE GROUP                            --
-- ------------------------------------------------------------ --
  
  ["RaidUnit"] = {
    ["Width"] = 100,
    ["Height"] = 36,    
    ["BackColor"] = {0,0,0,.6},
    ["EdgeColor"] = {0,0,0,1},
    ["EdgeWeight"] = 1,
    ["Hidden"] = true,
    ["Name"] = {
      ["Width"] = 98,
      ["Height"] = 16,
      ["OffsetX"] = 2,
      ["OffsetY"] = 2,
    },
    ["Level"] = false,
    ["Class"] = false,
    ["Death"] = {
      ["Width"] = 100,
      ["Height"] = 36,      
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Hidden"] = true,
      ["Label"] = {
        ["Width"] = 98,
        ["Height"] = 16,
        ["OffsetX"] = 2,
        ["OffsetY"] = 20,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER
      }
    },
    ["Offline"] = {
      ["Width"] = 100,
      ["Height"] = 36,      
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Hidden"] = true,
      ["Label"] = {
        ["Width"] = 98,
        ["Height"] = 16,
        ["OffsetX"] = 2,
        ["OffsetY"] = 20,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER
      }
    },
    ["Leader"] = {
      ["Width"] = 20,
      ["Height"] = 20,
      ["MyAnchor"] = BOTTOMRIGHT,
      ["ParentAnchor"] = BOTTOMRIGHT,      
      ["Hidden"] = true,
      ["Texture"] = "/esoui/art/lfg/lfg_leader_icon.dds"
    },
    ["Health"] = {
      ["Width"] = 100,
      ["Height"] = 36,      
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["Width"] = 98,
        ["Height"] = 34,
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
      },
      ["TextLeft"] = false,
      ["TextRight"] = false
    },
    ["Magicka"] = false,
    ["Stamina"] = false,
    ["Experience"] = false,
    ["Mount"] = false
  },











-- ------------------------------------------------------------ --
--                          TARGET                              --
-- ------------------------------------------------------------ --
  
  ["Target"] = {
    ["OffsetX"] = 800,
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
