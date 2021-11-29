library QuestArgusControl requires QuestData, LegionSetup

  globals
    private constant integer QUESTRESEARCH_ID = 'R055'   //This research is given when the quest is completed
  endglobals

  struct QuestArgusControl extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "Enable to research Astral Walk and build a shop"
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Enable to research Astral Walk and build a shop"
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Argus Incursion", "The planet of Argus is not fully under the control of the Legion, bring it under control!", "ReplaceableTextures\\CommandButtons\\BTNMastersLodge.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BF')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BH')))
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n0BG')))
      call this.AddQuestItem(QuestItemSelfExists.create())
      set this.ResearchId = QUESTRESEARCH_ID
      return this
    endmethod
  endstruct

endlibrary