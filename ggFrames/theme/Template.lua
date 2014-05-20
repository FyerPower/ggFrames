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
      ["OffsetX"] = 0
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
        ["DrawLayer"] = 5
      },
      ["LabelOne"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["DrawLayer"] = 1
      },
      ["LabelTwo"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["DrawLayer"] = 1
      },
      ["Shield"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = -1,
        ['Width'] = 0,
        ["MyAnchor"] = BOTTOMLEFT,
        ["ParentAnchor"] = BOTTOMLEFT,
        ["DrawLayer"] = 8
      },
      ["Regen"] = {
        ["Alpha"] = .45,
        ["OffsetX"] = 1,
        ["OffsetY"] = 0,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["Texture"] = "ggFrames\\theme\\textures\\Regen.dds",
        ['ImageData'] = {1,16},
        ['FrameRate'] = 16,
        ['Duration'] = 1000,
        ['Hidden'] = true,
        ["DrawLayer"] = 2
      },
      ["Degen"] = {
        ["Alpha"] = .45,
        ["OffsetX"] = 1,
        ["OffsetY"] = 0,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["Texture"] = "ggFrames\\theme\\textures\\Regen.dds",
        ['Rotate'] = 3.14159,
        ['ImageData'] = {1,16},
        ['FrameRate'] = 16,
        ['Duration'] = 1000,
        ['Hidden'] = true,
        ["DrawLayer"] = 2
      }
    },
    ["Magicka"] = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["DrawLayer"] = 5
      },
      ["LabelOne"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["DrawLayer"] = 1
      },
      ["LabelTwo"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["DrawLayer"] = 1
      },
      ["Regen"] = {
        ["Alpha"] = .45,
        ["OffsetX"] = 1,
        ["OffsetY"] = 0,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["Texture"] = "ggFrames\\theme\\textures\\Regen.dds",
        ['ImageData'] = {1,16},
        ['FrameRate'] = 16,
        ['Duration'] = 1000,
        ['Hidden'] = true,
        ["DrawLayer"] = 2
      },
      ["Degen"] = {
        ["Alpha"] = .45,
        ["OffsetX"] = 1,
        ["OffsetY"] = 0,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["Texture"] = "ggFrames\\theme\\textures\\Regen.dds",
        ['Rotate'] = 3.14159,
        ['ImageData'] = {1,16},
        ['FrameRate'] = 16,
        ['Duration'] = 1000,
        ['Hidden'] = true,
        ["DrawLayer"] = 2
      }
    },
    ["Stamina"] = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["DrawLayer"] = 5
      },
      ["LabelOne"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["DrawLayer"] = 1
      },
      ["LabelTwo"] = {
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["OffsetX"] = 5,
        ["DrawLayer"] = 1
      },
      ["Regen"] = {
        ["Alpha"] = .45,
        ["OffsetX"] = 1,
        ["OffsetY"] = 0,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["Texture"] = "ggFrames\\theme\\textures\\Regen.dds",
        ['ImageData'] = {1,16},
        ['FrameRate'] = 16,
        ['Duration'] = 1000,
        ['Hidden'] = true,
        ["DrawLayer"] = 1
      },
      ["Degen"] = {
        ["Alpha"] = .45,
        ["OffsetX"] = 1,
        ["OffsetY"] = 0,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["Texture"] = "ggFrames\\theme\\textures\\Regen.dds",
        ['Rotate'] = 3.14159,
        ['ImageData'] = {1,16},
        ['FrameRate'] = 16,
        ['Duration'] = 1000,
        ['Hidden'] = true,
        ["DrawLayer"] = 1
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
    ["Mount_Joined"] = {
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Bar"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
      }
    },
    ["Mount_Seperated"] = {
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
    },
    ["Stealth"] = false,
    ["Combat"] = false
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
      ["Width"] = 100,
      ["Height"] = 36,
      ["OffsetY"] = -1,
      ["OffsetX"] = 3,
      ["MyAnchor"] = LEFT,
      ["ParentAnchor"] = LEFT,
      ["VerticalAlign"] = TEXT_ALIGN_CENTER,  
      ["DrawLayer"] = 1
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
      ["DrawLayer"] = 10,
      ["Label"] = {
        ["Width"] = 100,
        ["Height"] = 36,
        ["OffsetY"] = -1,
        ["OffsetX"] = -3,
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,  
        ["DrawLayer"] = 1
      }
    },
    ["Offline"] = {
      ["Width"] = 100,
      ["Height"] = 36,      
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["Hidden"] = true,
      ["DrawLayer"] = 10,
      ["Label"] = {
        ["Width"] = 100,
        ["Height"] = 36,
        ["OffsetY"] = -1,
        ["OffsetX"] = -3, 
        ["MyAnchor"] = RIGHT,
        ["ParentAnchor"] = RIGHT,
        ["HorizontalAlign"] = TEXT_ALIGN_RIGHT,
        ["VerticalAlign"] = TEXT_ALIGN_CENTER,  
        ["DrawLayer"] = 1
      }
    },
    ["Leader"] = {
      ["Width"] = 20,
      ["Height"] = 20,
      ["OffsetX"] = -20,
      ["MyAnchor"] = RIGHT,
      ["ParentAnchor"] = RIGHT,      
      ["Hidden"] = true,
      ["Texture"] = "/esoui/art/lfg/lfg_leader_icon.dds",
      ["DrawLayer"] = 2
    },
    ["Stealth"] = {
      ["Width"] = 20,
      ["Height"] = 20,
      ["OffsetX"] = 0,
      ["MyAnchor"] = RIGHT,
      ["ParentAnchor"] = RIGHT,      
      ['Alpha'] = .2,
      ["Texture"] = "ggFrames\\theme\\textures\\Stealth.dds",
      ["DrawLayer"] = 2
    },
    ["Combat"] = false,
    -- ["Combat"] = {
    --   ["Width"] = 20,
    --   ["Height"] = 20,
    --   ["MyAnchor"] = RIGHT,
    --   ["ParentAnchor"] = RIGHT,      
    --   ['Alpha'] = .2,
    --   ["Texture"] = "/esoui/art/campaign/campaignbrowser_indexicon_normal_down.dds",
    --   ["DrawLayer"] = 2
    -- },
    ["Health"] = {
      ["Width"] = 100,
      ["Height"] = 36,      
      ["BackColor"] = {0,0,0,.6},
      ["EdgeColor"] = {0,0,0,1},
      ["EdgeWeight"] = 1,
      ["DrawLayer"] = 10,
      ["Bar"] = {
        ["Width"] = 98,
        ["Height"] = 34,
        ["OffsetX"] = 1,
        ["OffsetY"] = 1,
        ["DrawLayer"] = 5,
      },
      ["Regen"] = {
        ["Alpha"] = .45,
        ["OffsetX"] = 1,
        ["OffsetY"] = 0,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["Texture"] = "ggFrames\\theme\\textures\\Regen.dds",
        ['ImageData'] = {1,16},
        ['FrameRate'] = 16,
        ['Duration'] = 1000,
        ['Hidden'] = true,
        ["DrawLayer"] = 2
      },
      ["Degen"] = {
        ["Alpha"] = .45,
        ["OffsetX"] = 1,
        ["OffsetY"] = 0,
        ["MyAnchor"] = LEFT,
        ["ParentAnchor"] = LEFT,
        ["Texture"] = "ggFrames\\theme\\textures\\Regen.dds",
        ['Rotate'] = 3.14159,
        ['ImageData'] = {1,16},
        ['FrameRate'] = 16,
        ['Duration'] = 1000,
        ['Hidden'] = true,
        ["DrawLayer"] = 2
      },
      ["LabelOne"] = false,
      ["LabelTwo"] = false,
      ["Shield"] = {
        ["OffsetX"] = 1,
        ["OffsetY"] = -1,
        ['Width'] = 0,
        ["MyAnchor"] = BOTTOMLEFT,
        ["ParentAnchor"] = BOTTOMLEFT,
        ["DrawLayer"] = 8 -- No idea why this has to be greater than the health bar, but thats the Bar.  
      }
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
