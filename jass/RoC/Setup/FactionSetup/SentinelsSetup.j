library SentinelsSetup requires Faction, TeamSetup

  globals
    Faction FACTION_SENTINELS
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    
    set FACTION_SENTINELS = Faction.create("Sentinels", PLAYER_COLOR_MINT, "|CFFBFFF80","ReplaceableTextures\\CommandButtons\\BTNPriestessOfTheMoon.blp", 0)
    set f = FACTION_SENTINELS
    set f.Team = TEAM_NIGHT_ELVES
    set f.UndefeatedResearch = 'R05Y'
    set f.StartingGold = 150
    set f.StartingLumber = 500

    call f.registerObjectLimit('e00V', UNLIMITED)   //Temple of Elune
    call f.registerObjectLimit('e00R', UNLIMITED)   //Altar of Watchers 
    call f.registerObjectLimit('e00L', UNLIMITED)   //War Academy
    call f.registerObjectLimit('edob', UNLIMITED)   //Hunter's Hall
    call f.registerObjectLimit('eden', UNLIMITED)   //Ancient of Wonders
    call f.registerObjectLimit('e011', UNLIMITED)   //Night Elf Shipyard
    call f.registerObjectLimit('h03N', UNLIMITED)   //Enchanged Runestone
    call f.registerObjectLimit('h03M', UNLIMITED)   //Runestone
    call f.registerObjectLimit('n06O', UNLIMITED)   //Sentinel Embassy
    call f.registerObjectLimit('n06P', UNLIMITED)   //Sentinel Enclave
    call f.registerObjectLimit('n06J', UNLIMITED)   //Sentinel Outpost
    call f.registerObjectLimit('n06M', UNLIMITED)   //Residence 
    call f.registerObjectLimit('edos', UNLIMITED)   //Roost 
    call f.registerObjectLimit('e00T', UNLIMITED)   //Bastion

    call f.registerObjectLimit('ewsp', UNLIMITED)   //Wisp 
    call f.registerObjectLimit('e006', UNLIMITED)   //Priestess
    call f.registerObjectLimit('n06C', UNLIMITED)   //Trapper
    call f.registerObjectLimit('h04L', 6)           //Priestess of the Moon
    call f.registerObjectLimit('earc', UNLIMITED)   //Archer
    call f.registerObjectLimit('esen', UNLIMITED)   //Huntress
    call f.registerObjectLimit('h08V', UNLIMITED)   //Nightsaber Knight
    call f.registerObjectLimit('ebal', 8)           //Glaive Thrower
    call f.registerObjectLimit('ehpr', 6)           //Hippogryph Rider
    call f.registerObjectLimit('n034', 12)           //Guild Ranger
    call f.registerObjectLimit('nwat', UNLIMITED)   //Nightblade  
    call f.registerObjectLimit('etrs', 12)   	    //Night Elf Transport Ship
    call f.registerObjectLimit('edes', 12)  	    //Night Elf Frigate
    call f.registerObjectLimit('ebsh', 6)          //Night Elf Battleship
    call f.registerObjectLimit('nnmg', 12)          //Redeemed Highborne 

    call f.registerObjectLimit('e009', 1)           //Naisha
    call f.registerObjectLimit('Etyr', 1)           //Tyrande
    call f.registerObjectLimit('E002', 1)           //Shandris
    call f.registerObjectLimit('Ewrd', 1)           //Maiev
    call f.registerObjectLimit('O02E', 1)           //Jarod

    call f.registerObjectLimit('R00S', UNLIMITED)   //Priestess Adept Training
    call f.registerObjectLimit('R064', UNLIMITED)   //Sentinel Fortifications
    call f.registerObjectLimit('R01W', UNLIMITED)   //Trapper Adept Training  
    call f.registerObjectLimit('R026', UNLIMITED)   //Elune's Power Infusion
    call f.registerObjectLimit('Reib', UNLIMITED)   //Improved Bows
    call f.registerObjectLimit('Reuv', UNLIMITED)   //Ultravision
    call f.registerObjectLimit('Remg', UNLIMITED)   //Upgraded Moon Glaive
    call f.registerObjectLimit('Roen', UNLIMITED)   //Ensnare
    call f.registerObjectLimit('R04E', UNLIMITED)   //Ysera's Gift (World Tree upgrade)
    call f.registerObjectLimit('R002', UNLIMITED)   //Blackwald Enhancement
    call f.registerObjectLimit('R03J', UNLIMITED)   //Wind Walk
    call f.registerObjectLimit('R013', UNLIMITED)   //Elune's Blessing
  endfunction
    
endlibrary