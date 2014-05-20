ggFrames is a lightweight fully customizable add-on that replaces the default unit frames provided by Elder Scrolls Online.  ggFrames currently supports: [B]Player, Group, Raid, and Target Frames[/B].  

[U]Language support[/U]: [B]English[/B], [B]French[/B], & [B]German[/B]

[COLOR="Yellow"][SIZE="3"][U][B]Features[/B][/U][/SIZE][/COLOR]
[LIST]
[*][B]Player Unit Frame[/B]
  [LIST]
  [*]Info: Name, Level, Class, Group Leader Icon
  [*]Bars: Health, Magicka, Stamina, Experience, Mount
  [*]Features:
    [LIST]
    [*]Shield Indicator
    [*]Optionally Hide Experience Bar
    [*]Optionally Hide Player Information
    [*]Optionally Attach / Detache Mount Stamina Bar
    [*]Health, Magicka, and Stamina Heal/Damage over Time Animated Textures
    [*]Fade when Out of Combat
    [/LIST]
  [/LIST]
[*][B]Group Unit Frames[/B]
  [LIST]
  [*]Info: Name, Level, Class, Group Leader Icon
  [*]Bars: Health
  [*]Features:
    [LIST]
    [*]Shield Indicator
    [*]Members fade out when no within support range
    [*]Health Heal/Damage over Time Animated Textures
    [*]Optionally Include/Exclude Player from Group
    [/LIST]
  [/LIST]
[*][B]Large Group Unit Frames[/B]
  [LIST]
  [*]Info: Name, Group Leader Icon
  [*]Bars: Health
  [*]Features: 
    [LIST]
    [*]Shield Indicator
    [*]Custom Number of members per group
    [*]Health Heal/Damage over Time Animated Textures
    [/LIST]
  [/LIST]
[*][B]Target Unit Frame[/B]
  [LIST]
  [*]Info: Name, Level, Class Icon, Caption / Title, Alliance Rank & Level
  [*]Bars: Health
  [*]Features: 
    [LIST]
    [*]Shield Indicator
    [*]Unit Name Reaction Colors (Friendly, Hostile, Interactable, Default)
    [*]Monster Difficulty (Display Stars to show difficulty: Easy = 0, Normal = 1, Hard = 2, Deadly = 3)
    [*]Health Heal/Damage over Time Animated Textures
    [/LIST]
  [/LIST]
[*][B]Global Frame Settings:[/B]
  [LIST]
  [*]Localization (French & German)
  [*]All Bars:
    [LIST]
    [*]Over 15 Additonal Fonts (And use fonts shared by other addons)
    [*]6 Font Styles (normal, outline, shadow, etc)
    [*]Two Customizable Numerical Representation of Values on Bars
      [LIST]
      [*]Values: "nothing", "current", "max", "percent", "current / max", and "current / max (percentage)"
      [*]Healthbar Labels can also contain shield value (aka: "Current + Shield")
      [*]Locations: Left, Right, and Center
      [/LIST]
    [/LIST]
  [*]Over 100 Customizable Settings
  [*]Movable Frames (Type '/ggf' or unlock/lock from menu)
  [*]All Frames have a standard opacity value (setting) by default and transition to full 
  [*]All Frames Hide whenever in Menus (Backpack, Friends, Guild, etc)
  [*]Optionally Hide All Addon Frames: Player / Group / Raid / Target
  [*]Optionally Hide All Default Frames: Player / Group / Raid / Target
  [/LIST]
[/LIST]

[COLOR="Yellow"][SIZE="3"][U][B]Coming Soon / Planned Updates[/B][/U][/SIZE][/COLOR]
[LIST]
  [*][COLOR="Gray"][I](Planned for: v0.9)[/I][/COLOR]
  [LIST]
    [*][COLOR="Green"][Enhancement][/COLOR] Buff / Debuffs (List and Icon Views) 
    [*][COLOR="Green"][Enhancement][/COLOR] Sound Alerts when player / group members are low on life (Optional, default off, 50% 30% dead)
  [/LIST]
  [*][COLOR="Gray"][I]Plans for: v1.0[/I][/COLOR]
  [LIST]
    [*] Massive overhaul on settings, preview frames while editing (provide fake data and allow frame to always be visible)
    [*] Optionally Set RGBA of Bar Backdrops
    [*] Health Bar Color Options: Reaction Color / Health Color (80/60/40/20)
    [*] Low Health Alert (Player / Target)
    [*] Right Click on Player / Group Frame to "Leave Party", "Add / Remove Friend", etc
    [*] Rethink and find a better way to display the targets difficulty
    [*] Display Friend / Guildmate Status
  [/LIST]
  [*][COLOR="Green"][Enhancement][/COLOR] Target of Target Unit Frame(?)
[/LIST]

[LIST]
  [*] [COLOR="Red"]Not Supported By Event API:[/COLOR] Display Combat State Icon on Raid Frame (No Event Exists ~ Rather event doesn't include other units, only self)
  [*] [COLOR="Red"]Not Supported By API:[/COLOR] Display Castbar for Player and Target (provide textual feedback telling you when to block, interupt, etc)
  [*] [COLOR="Red"]Not Supported By API:[/COLOR] Display Group Members Magicka and Stamina
[/LIST]

[COLOR="Yellow"][SIZE="3"][U][B]Community Suggestions[/B][/U][/SIZE][/COLOR]
[LIST]
[*]Build Raid from Left to Right / Right to Left ..and.. Top to Bottom / Bottom to Top[Suggested By: FourOne]
[*]Option to place labels on any status bar[Suggested By: Tonyleila]
[*]Option to Remove class icon and use class colors instead. [Suggested By: Tonyleila]
[*]Option to Unstack Players Health / Magicka / Stamina and instead display side by side [Suggest By: pinstripesc]
[*]Reorder the Bars within Player Frame
[*]Placement of Absorb Shield
[/LIST]

[COLOR="Yellow"][SIZE="3"][U][B]Comment![/B][/U][/SIZE][/COLOR]
I love feedback! [URL="http://www.esoui.com/downloads/fileinfo.php?id=268#comments"]Tell Me via Addon Comments![/URL]

[COLOR="Yellow"][SIZE="3"][U][B]Feature Request?[/B][/U][/SIZE][/COLOR]
Have a feature you want but dont see it listed above?  [URL="http://www.esoui.com/portal.php?id=72&a=listfeatures"]Add a Feature Request[/URL]

[COLOR="Yellow"][SIZE="3"][U][B]Known Bugs:[/B][/U][/SIZE][/COLOR]
[LIST]
[*] No Known Bugs
[/LIST]

The Error [B]Too Many Anchors Process[/B] is not due to ggFrames however its a bug within the ESO Game whenever too many addons that draw on the screen are active at one time.  Until ZeniMax gets around to fixing it, you can use [URL="http://www.esoui.com/downloads/info434-ZolansAnchorsAway.html"]Zolan's Anchors Away[/URL] add-on to suppress this error.

[COLOR="Yellow"][SIZE="3"][U][B]Found a Bug?[/B][/U][/SIZE][/COLOR]
[I]If you notice any wrong translations, please send me a private message with what the text should say.  Thanks[/I]
[URL="http://www.esoui.com/portal.php?id=72&a=listbugs"]Report Bugs Here[/URL]

[COLOR="Yellow"][SIZE="3"][U][B]Donate![/B][/U][/SIZE][/COLOR]
Donations are [B]NOT[/B] required, just greatly appreciated.  If you are generous enough to do so, I will list the amount and your name below.
[LIST]
[*][COLOR="Yellow"]$10.00[/COLOR] Travin A.
[*][COLOR="Yellow"]$5.00[/COLOR] Allan K. (Rashaverik)
[*][COLOR="Yellow"]$1.00[/COLOR] Michal R.
[/LIST]
[URL="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=2DK5XAPXSVAQS"]
[IMG]https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif[/IMG]
[/URL]