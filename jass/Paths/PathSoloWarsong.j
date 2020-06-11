library PathSoloWarsong initializer OnInit requires WarsongConfig, LegendWarsong, Display

  globals
    private constant integer RESEARCH_ID = 'R02N'
  endglobals

  private function Research takes nothing returns nothing
    local player warsongPlayer
    if GetResearched() == RESEARCH_ID then
      set warsongPlayer = FACTION_WARSONG.Person.p
      call DisplaySoloPath(FACTION_WARSONG, "Without the guidance of the shamans and Thrall, the remaining forces of the Horde have succumbed to the Blood pact of Mannoroth once more.")
      call LEGEND_JERGOSH.Spawn(warsongPlayer, GetRectCenterX(gg_rct_Orgrimmar), GetRectCenterY(gg_rct_Orgrimmar), 0)
      call LEGEND_MANNOROTH.Spawn(warsongPlayer, GetRectCenterX(gg_rct_Orgrimmar), GetRectCenterY(gg_rct_Orgrimmar), 0)
      set LEGEND_REXXAR.Unit = null
      call SetPlayerTechMaxAllowed(warsongPlayer, 'R02O', 1)
      call SetPlayerTechMaxAllowed(warsongPlayer, 'R02Q', 1)
      call SetPlayerTechResearched(warsongPlayer, 'R02O', 1)
      call SetPlayerTechResearched(warsongPlayer, 'R02Q', 1)
      call SetPlayerTechResearched(warsongPlayer, 'R004', 1)
    endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_RESEARCH_FINISH  )
    call TriggerAddCondition(trig, Condition(function Research))    
  endfunction

endlibrary