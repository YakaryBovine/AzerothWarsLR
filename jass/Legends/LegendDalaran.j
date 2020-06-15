library LegendDalaran initializer OnInit requires Legend

  globals
    Legend LEGEND_ANTONIDAS

    Legend LEGEND_DALARAN
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_ANTONIDAS = Legend.create()
    set LEGEND_ANTONIDAS.Unit = gg_unit_Hant_1675
    call LEGEND_ANTONIDAS.AddUnitDependency(gg_unit_h002_0230)
    set LEGEND_ANTONIDAS.DeathMessage = "Archmage Antonidas has been cut down, his vast knowledge forever lost with his death. The mages of Dalaran have lost their brightest mind."
  
    set LEGEND_DALARAN = Legend.create()
    set LEGEND_DALARAN.Unit = gg_unit_h002_0230
    set LEGEND_DALARAN.DeathMessage = "The Violet Citadel, the ultimate bastion of arcane knowledge in the Eastern Kingdoms, crumbles like a sand castle."
  endfunction

endlibrary