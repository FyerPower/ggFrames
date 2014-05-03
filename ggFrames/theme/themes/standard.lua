-- /esoui/art/campaign/overview_scoringbg_ebonheart_left.dds

GGF.Template = {
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
    ["Caption"] = {
      ["Width"] = 100,
      ["MyAnchor"] = BOTTOMLEFT,
      ["ParentAnchor"] = BOTTOMLEFT,  
      ["HorizontalAlign"] = TEXT_ALIGN_LEFT
    },
    ["RankLb"] = {
      ["Width"] = 40,
      ["MyAnchor"] = BOTTOMRIGHT,
      ["ParentAnchor"] = BOTTOMRIGHT,  
      ["HorizontalAlign"] = TEXT_ALIGN_RIGHT
    },
    ["RankTx"] = {
      ["Width"] = 20,
      ["Height"] = 20,
      ["MyAnchor"] = TOPRIGHT,
      ["ParentAnchor"] = TOPLEFT  
    },
    ["Difficulty"] = {
      ["Width"] = 52,
      ["Height"] = 14,
      ['OffsetY'] = 4,
      ["MyAnchor"] = TOPRIGHT,
      ["ParentAnchor"] = TOPRIGHT
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
      ["LabelOne"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
      },
      ["LabelTwo"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
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
      ["LabelOne"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
      },
      ["LabelTwo"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
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
      ["LabelOne"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
      },
      ["LabelTwo"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
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
        ["Width"] = 94,
        ["Height"] = 16,
        ["OffsetX"] = 2,
        ["OffsetY"] = -2,
        ["MyAnchor"] = BOTTOMLEFT,
        ["ParentAnchor"] = BOTTOMLEFT,  
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
        ["Width"] = 94,
        ["Height"] = 16,
        ["OffsetX"] = 2,
        ["OffsetY"] = -2,
        ["MyAnchor"] = BOTTOMLEFT,
        ["ParentAnchor"] = BOTTOMLEFT,  
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
      ["LabelOne"] = false,
      ["LabelTwo"] = false
    },
    ["Magicka"] = false,
    ["Stamina"] = false,
    ["Experience"] = false,
    ["Mount"] = false,
    ["Caption"] = false,
    ["RankLb"] = false,
    ["RankTx"] = false,
    ["Difficulty"] = false
  }
}
