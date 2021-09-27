//If any Horde unit enters the Crossroads area, OR a time elapses, OR someone becomes a solo Horde Path, give the Crossroads to a Horde player.

library QuestCrossroads requires Persons, FrostwolfSetup, WarsongSetup, GeneralHelpers

  struct QuestCrossroads extends QuestData
    private Faction fallbackFaction = 0

    private method operator CompletionPopup takes nothing returns string
      return "The Crossroads have been constructed."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Control of the Crossroads"
    endmethod    

    private method GiveCrossroads takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in Crossroads to one of the above factions
      call GroupEnumUnitsInRect(tempGroup, gg_rct_Crossroads, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop
      //Give resources and display message
      call CreateUnit(whichPlayer, 'oeye', -12844, -1975, 0)
      call CreateUnit(whichPlayer, 'oeye', -10876, -2066, 0)
      call CreateUnit(whichPlayer, 'oeye', -11922, -824, 0)

      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method GiveLumberJack takes player whichPlayer returns nothing
      local group tempGroup = CreateGroup()
      local unit u

      //Transfer all Neutral Passive units in LumberJack to one of the above factions
      call GroupEnumUnitsInRect(tempGroup, gg_rct_LumberJack, null)
      set u = FirstOfGroup(tempGroup)
      loop
      exitwhen u == null
        if GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) then
          call UnitRescue(u, whichPlayer)
        endif
        call GroupRemoveUnit(tempGroup, u)
        set u = FirstOfGroup(tempGroup)
      endloop

      //Cleanup
      call DestroyGroup(tempGroup)
      set tempGroup = null
    endmethod

    private method OnFail takes nothing returns nothing
      if this.fallbackFaction != 0 then
        call this.GiveCrossroads(this.fallbackFaction.Player)
        call this.GiveLumberJack(this.fallbackFaction.Player)
      else
        call this.GiveCrossroads(Player(PLAYER_NEUTRAL_AGGRESSIVE))
        call this.GiveLumberJack(Player(PLAYER_NEUTRAL_AGGRESSIVE))
      endif
    endmethod

    private method OnComplete takes nothing returns nothing
      call this.GiveCrossroads(this.Holder.Player)
      call this.GiveLumberJack(this.Holder.Player)
    endmethod

    public static method create takes Faction fallbackFaction returns thistype
      local thistype this = thistype.allocate("The Crossroads", "The Horde still needs to establish a strong strategic foothold into Kalimdor. There is an opportune crossroads nearby.", "ReplaceableTextures\\CommandButtons\\BTNBarracks.blp")
      set this.fallbackFaction = fallbackFaction
      call this.AddQuestItem(QuestItemKillUnit.create(gg_unit_nrzm_0113)) //Razorman Medicine Man
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n01T')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      return this
    endmethod
  endstruct

endlibrary