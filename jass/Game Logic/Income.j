library Income initializer OnInit requires Persons

  //**CONFIG**
  globals
    private constant real PERIOD = 1.           //Note that changing this will not change the amount of gold players receive over time
    private constant real OVERWEIGHT_PENALTY = 0.15  //Percentage of income lost per Faction weight over the Team's weight limit
  endglobals
  //**ENDCONFIG

  private function Income takes nothing returns nothing
    local integer i = 0

    loop
    exitwhen i > MAX_PLAYERS
      if not (Persons[i] == 0) then
        if Persons[i].income > 0 then
          call Persons[i].addGold( RMinBJ( Persons[i].income * (1 - (RMaxBJ(I2R(Persons[i].team.weight - Persons[i].team.maxWeight), 0))*OVERWEIGHT_PENALTY) / 60 * PERIOD, 0) * GetPlayerState(Persons[i].p, PLAYER_STATE_GOLD_UPKEEP_RATE) )
        endif
      endif
      set i = i + 1
    endloop
  endfunction

  private function OnInit takes nothing returns nothing
    local trigger trig = CreateTrigger()
    call TriggerRegisterTimerEvent(trig, PERIOD, true)
    call TriggerAddCondition(trig, Condition(function Income))
  endfunction    

endlibrary