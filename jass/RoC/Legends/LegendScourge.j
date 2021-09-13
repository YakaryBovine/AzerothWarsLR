library LegendScourge initializer OnInit requires Legend

  globals
    Legend LEGEND_KELTHUZAD
    Legend LEGEND_ANUBARAK
    Legend LEGEND_RIVENDARE
    Legend LEGEND_SYLVANASV

    Legend LEGEND_SCHOLOMANCE
    Legend LEGEND_LICHKING

    constant integer UNITTYPE_KELTHUZAD_NECROMANCER = 'U001'
    constant integer UNITTYPE_KELTHUZAD_GHOST = 'U00M'
    constant integer UNITTYPE_KELTHUZAD_LICH = 'Uktl'
  endglobals

  private function OnInit takes nothing returns nothing
    set LEGEND_KELTHUZAD = Legend.create()
    set LEGEND_KELTHUZAD.UnitType = 'U001'
    set LEGEND_KELTHUZAD.PermaDies = true
    set LEGEND_KELTHUZAD.DeathMessage = "Kel'thuzad has been slain. He lives on in spectral form, and may yet return if he is brought to the Sunwell."
    set LEGEND_KELTHUZAD.DeathSfx = "Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilSpecialArt.mdl"
    set LEGEND_KELTHUZAD.Essential = true

    set LEGEND_ANUBARAK = Legend.create()
    set LEGEND_ANUBARAK.UnitType = 'Uanb'

    set LEGEND_RIVENDARE = Legend.create()
    set LEGEND_RIVENDARE.UnitType = 'U00A'

    set LEGEND_SYLVANASV = Legend.create()
    set LEGEND_SYLVANASV.UnitType = 'Usyl'
    set LEGEND_SYLVANASV.StartingXP = 5400

    set LEGEND_SCHOLOMANCE = Legend.create()
    set LEGEND_SCHOLOMANCE.Unit = gg_unit_u012_1149
    set LEGEND_SCHOLOMANCE.DeathMessage = "Scholomance, the center of the Scourge's operations in Lordaeron, has been destroyed."

    set LEGEND_LICHKING = Legend.create()
    set LEGEND_LICHKING.Unit = gg_unit_u000_0649
    set LEGEND_LICHKING.Hivemind = true
    set LEGEND_LICHKING.DeathMessage = "The great Lich King has been destroyed. With no central mind to command them, the forces of the Undead have gone rogue."
endfunction

endlibrary