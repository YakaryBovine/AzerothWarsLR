library GoblinSetup requires Faction, TeamSetup

  globals
    Faction FACTION_GOBLIN
  endglobals

  public function OnInit takes nothing returns nothing
    local Faction f
    set FACTION_GOBLIN = Faction.create("Bilgewater", PLAYER_COLOR_LIGHT_GRAY, "|cff808080","ReplaceableTextures\\CommandButtons\\BTNHeroTinker.blp", 0)
    set f = FACTION_GOBLIN
    set f.Team = TEAM_HORDE
    set f.StartingGold = 150
    set f.StartingLumber = 500

    call f.registerObjectLimit('o03L', UNLIMITED)   //Great Hall
    call f.registerObjectLimit('o03M', UNLIMITED)   //Stronghold
    call f.registerObjectLimit('o03N', UNLIMITED)   //Fortress
    call f.registerObjectLimit('o03O', UNLIMITED)   //Altar of Storms
    call f.registerObjectLimit('o03P', UNLIMITED)   //Barracks
    call f.registerObjectLimit('o03Q', UNLIMITED)   //War Mill
    call f.registerObjectLimit('o03S', UNLIMITED)   //Tauren Totem
    call f.registerObjectLimit('o01M', UNLIMITED)   //Spirit Lodge
    call f.registerObjectLimit('o03T', UNLIMITED)   //Orc Burrow
    call f.registerObjectLimit('o03U', UNLIMITED)   //Watch Tower
    call f.registerObjectLimit('o03W', UNLIMITED)   //Improved Watch Tower
    call f.registerObjectLimit('o03X', UNLIMITED)   //Voodoo Lounge
    call f.registerObjectLimit('o03V', UNLIMITED)   //Shipyard

    call f.registerObjectLimit('o02I', UNLIMITED)   //Peon
    call f.registerObjectLimit('n099', UNLIMITED)   //Ogre
    call f.registerObjectLimit('h08X', UNLIMITED)   //sapper
    call f.registerObjectLimit('h08Y', 12)   //Gunner
    call f.registerObjectLimit('odoc', UNLIMITED)   //GOBLIN Witch Doctor
    call f.registerObjectLimit('o04P', UNLIMITED)   //Mage
    call f.registerObjectLimit('o04O', UNLIMITED)   //Alch
    call f.registerObjectLimit('o04Q', 6)           //Tinker
    call f.registerObjectLimit('obot', 24)  	    //Transport Ship
    call f.registerObjectLimit('odes', 24)  	    //Orc Frigate
    call f.registerObjectLimit('ojgn', 12)          //Juggernaught
    call f.registerObjectLimit('n062', 12)          //Shredder
    call f.registerObjectLimit('h08Z', 3)           //Tank
    call f.registerObjectLimit('nzep', 6)           //Zep

    call f.registerObjectLimit('O04N', 1)           //Jastor
    call f.registerObjectLimit('Ntin', 1)           //Gazlowee
    call f.registerObjectLimit('Nalc', 1)           //Noggenfogger

  endfunction
    
endlibrary