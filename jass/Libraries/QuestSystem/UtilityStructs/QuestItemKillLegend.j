library QuestItemKillLegend requires QuestItemData

  struct QuestItemKillLegend extends QuestItemData
    static method create takes Legend target returns thistype
      local thistype this = thistype.allocate()
      set this.Description = "Kill " + target.Name
      return this
    endmethod
  endstruct

endlibrary