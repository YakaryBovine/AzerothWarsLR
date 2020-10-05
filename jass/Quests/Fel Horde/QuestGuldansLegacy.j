library QuestGuldansLegacy initializer OnInit requires QuestData, FelHordeConfig

  globals
    private integer RESEARCH_ID = 'R041'
  endglobals

  struct QuestGuldansLegacy extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Gul'dan's remains have been located within the Tomb of Sargeras. His eldritch knowledge may now be put to purpose."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "A research improving all of your demon units"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
      call DisplayResearchAcquired(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(RESEARCH_ID, 1)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Gul'dans Legacy", "The Orc Warlock Gul'dan is ultimately responsible for the formation of the Fel Horde. Though long dead, his teachings could still be extracted from his body.", "ReplaceableTextures\\CommandButtons\\BTNGuldan.blp")
      call this.AddQuestItem(QuestItemAnyUnitInRect.create(gg_rct_Guldan, "Tomb of Sargeras interior", true))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_FEL_HORDE.AddQuest(QuestGuldansLegacy.create())
  endfunction
  
endlibrary