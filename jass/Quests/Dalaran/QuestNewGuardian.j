//Jaina goes to Scholomance while Scholomance building is destroyed and retrieves the Soul Gem
library QuestNewGuardian initializer OnInit requires DalaranConfig, LegendDalaran, Display, ArtifactConfig

  globals
    private constant integer ABIL_ID = 'A0BW'
    private constant integer RESEARCH_VALID = 'R04V'
  endglobals

  struct QuestNewGuardian extends QuestData
    private QuestItemCastSpell questItemCastEmpowerGuardian

    private method operator CompletionPopup takes nothing returns string
      return "Dalaran has empowered " + GetUnitName(questItemCastEmpowerGuardian.Caster) + " as the new Guardian of Tirisfal, endowing them with a portion of the Council of Tirisfal's power."
    endmethod

    private function EmpowerGuardian takes unit whichUnit returns nothing
      local Legend whichLegend = Legend.ByHandle(whichUnit)
      call AddSpecialEffectTarget("war3mapImported\\Soul Armor Cosmic.mdx", whichUnit, "chest")
      call BlzSetUnitName(whichUnit, "Guardian of Tirisfal")
      call UnitAddAbility(whichUnit, 'ACm2') //Spell Immunity
      call UnitAddAbility(whichUnit, 'A0BX') //Guardian of Tirisfal Spellbook
      call UnitRemoveAbility(whichUnit, 'A0WD') //Counterspell
      call UnitRemoveAbility(whichUnit, 'A0WG') //Counterspell Spell Book
      call BlzSetUnitIntegerField(whichUnit, UNIT_IF_DEFENSE_TYPE, 6) //Divine
      call BlzSetUnitWeaponIntegerField(whichUnit, UNIT_WEAPON_IF_ATTACK_ATTACK_TYPE, 0, 5) //Chaos
      call SetHeroInt(whichUnit, GetHeroInt(whichUnit, false) + 20, true)
      call whichLegend.ClearUnitDependencies()
      set whichLegend.PermaDies = false
    endfunction

    private method OnComplete takes nothing returns nothing
      call UnitAddItem(GetTriggerUnit(), ARTIFACT_SOULGEM.item)
      call EmpowerGuardian(questItemCastEmpowerGuardian.Caster) //Should be based on whoever cast the spell; maybe have QuestItemLegendCastSpell fire an event??
    endmethod

    private static method create takes nothing returns nothing
      local thistype this = thistype.allocate("Guardian of Tirisfal", "Medivh's death left Azeroth without a Guardian. The spell book he left behind could be used to empower a new one.", "ReplaceableTextures\\CommandButtons\\BTNAstral Blessing.blp")
      set this.questItemCastEmpowerGuardian = this.AddQuestItem(QuestItemCastSpell.create(ABIL_ID))
      call this.AddQuestItem(QuestItemAcquireArtifact.create(ARTIFACT_BOOKOFMEDIVH))
      return this
    endmethod

    private static method onInit takes nothing returns nothing
      call FACTION_DALARAN.AddQuest(thistype.create())
    endmethod
  endstruct

endlibrary