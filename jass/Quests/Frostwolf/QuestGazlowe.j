library QuestGazlowe initializer OnInit requires QuestData, ControlPoint, FrostwolfConfig, LegendFrostwolf

  globals
    private constant integer RESEARCH_ID = 'R01F'
    private constant integer HERO_ID = 'Ntin'
  endglobals

  struct QuestGazlowe extends QuestData

    private method operator CompletionPopup takes nothing returns string
      return "With the Goblin homeland of Kezan now under " + this.Holder.Name + " control, the goblin Gazlowe offers his services as an expert engineer."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "You can summon Gazlowe from the Altar of Storms"
    endmethod

    private method OnComplete takes nothing returns nothing
      call SetPlayerTechResearched(Holder.Player, RESEARCH_ID, 1)
    endmethod

    private method OnAdd takes nothing returns nothing
      call Holder.modObjectLimit(HERO_ID, 1)
      call Holder.modObjectLimit(RESEARCH_ID, UNLIMITED)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Explosive Engineering", "The Horde needs engineering skills if it is to thrive. The Goblins of Kezan could provide such expertise.", "ReplaceableTextures\\CommandButtons\\BTNHeroTinker.blp")
      call this.AddQuestItem(QuestItemControlPoint.create(ControlPoint.ByUnitType('n04Z')))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_FROSTWOLF.AddQuest(QuestGazlowe.create())
  endfunction

endlibrary