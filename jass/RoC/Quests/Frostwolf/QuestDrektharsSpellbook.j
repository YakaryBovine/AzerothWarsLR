library QuestDrektharsSpellbook initializer OnInit requires QuestData, Artifact, FrostwolfConfig, LegendFrostwolf, LegendDruids, QuestItemControlLegend, QuestItemAnyUnitInRect

  struct QuestDrektharsSpellbook extends QuestData
    private method operator CompletionPopup takes nothing returns string
      return "The World Tree, Nordrassil, has been captured by the forces of the Horde. Drek'thar has gifted Warchief Thrall his magical spellbook for this achievement."
    endmethod

    private method operator CompletionDescription takes nothing returns string
      return "Drek'thar's Spellbook"
    endmethod   

    private method OnComplete takes nothing returns nothing
      call SetItemPosition(ARTIFACT_DREKTHARSSPELLBOOK.item, GetUnitX(LEGEND_THRALL.Unit), GetUnitY(LEGEND_THRALL.Unit))
      call UnitAddItem(LEGEND_THRALL.Unit, ARTIFACT_DREKTHARSSPELLBOOK.item)
    endmethod

    public static method create takes nothing returns thistype
      local thistype this = thistype.allocate("Drekthar's Spellbook", "The savage Night Elves threaten the safety of the entire Horde. Capture their World Tree and bring Thrall to its roots.", "ReplaceableTextures\\CommandButtons\\BTNSorceressMaster.blp")
      call this.AddQuestItem(QuestItemControlLegend.create(LEGEND_NORDRASSIL, false))
      call this.AddQuestItem(QuestItemLegendInRect.create(LEGEND_THRALL, gg_rct_Drekthars_Spellbook, "Nordrassil"))
      return this
    endmethod
  endstruct

  private function OnInit takes nothing returns nothing
    call FACTION_FROSTWOLF.AddQuest(QuestDrektharsSpellbook.create())
  endfunction

endlibrary