library ElunesGaze initializer OnInit requires DummyCast

  globals
    private constant integer ABIL_ID = 'A0VX'
    private constant integer INVIS_ID = 'A0VY'
    private constant real RADIUS = 350.0
  endglobals

  private function ElunesGazeFilter takes unit caster, unit target returns boolean
    if IsUnitAlly(target, GetOwningPlayer(caster)) and not IsUnitType(target, UNIT_TYPE_STRUCTURE) and not IsUnitType(target, UNIT_TYPE_ANCIENT) and UnitAlive(target) then
      return true
    endif
    return false
  endfunction

  private function Cast takes nothing returns nothing
    if GetSpellAbilityId() == ABIL_ID then
      call DummyCastOnUnitsInCircle(GetTriggerUnit(), INVIS_ID, "invisibility", 1, GetSpellTargetX(), GetSpellTargetY(), RADIUS, CastFilter.ElunesGazeFilter)
		endif
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddCondition( trig, Condition(function Cast))
  endfunction 

endlibrary