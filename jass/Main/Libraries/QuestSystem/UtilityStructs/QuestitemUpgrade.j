library QuestItemUpgrade requires QuestItemData

  struct QuestItemUpgrade extends QuestItemData
    private static integer count = 0
    private static thistype array byIndex
    private integer objectId

    static method create takes integer objectId returns thistype
      local thistype this = thistype.allocate()
      set this.Description = "Upgrade your building to " + GetObjectName(objectId)
      set this.objectId = objectId
      set thistype.byIndex[thistype.count] = this
      set thistype.count = thistype.count + 1
      return this
    endmethod

    private static method OnAnyUpgrade takes nothing returns nothing
      local integer i = 0
      local thistype loopQuestItem
      local unit triggerUnit = GetTriggerUnit()
      loop
        exitwhen i == thistype.count
        set loopQuestItem = thistype.byIndex[i]
        if loopQuestItem.objectId == GetUnitTypeId(triggerUnit) and loopQuestItem.Holder.Player == GetOwningPlayer(GetTriggerUnit()) then
          set loopQuestItem.Progress = QUEST_PROGRESS_COMPLETE
        endif
        set i = i + 1
      endloop
    endmethod

    private static method onInit takes nothing returns nothing
      local trigger trig = CreateTrigger()
      call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
      call TriggerAddAction(trig, function thistype.OnAnyUpgrade)
    endmethod
  endstruct

endlibrary