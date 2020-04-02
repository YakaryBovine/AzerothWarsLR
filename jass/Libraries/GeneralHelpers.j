library GeneralHelpers

  globals
    private constant real HERO_DROP_DIST = 50.     //The radius in which heroes spread out items when they drop them
    private force DestForce = null
  endglobals
  
  function GetRectRandomY takes rect whichRect returns real
    return GetRandomReal(GetRectMinY(whichRect), GetRectMaxY(whichRect))
  endfunction

  function GetRectRandomX takes rect whichRect returns real
    return GetRandomReal(GetRectMinX(whichRect), GetRectMaxX(whichRect))
  endfunction

  private function ForceAddForceEnum takes nothing returns nothing
    call ForceAddPlayer(DestForce, GetEnumPlayer())
  endfunction

  function ForceAddForce takes force sourceForce, force destForce returns nothing
    set DestForce = destForce
    call ForForce(sourceForce, function ForceAddForceEnum)
  endfunction

  function AddHeroAttributes takes unit whichUnit, integer str, integer agi, integer int returns nothing
    local string sfx = ""
    call SetHeroStr(whichUnit, GetHeroStr(whichUnit, false) + str, true)
    call SetHeroAgi(whichUnit, GetHeroAgi(whichUnit, false) + agi, true)
    call SetHeroInt(whichUnit, GetHeroInt(whichUnit, false) + int, true)

    if str > 0 and agi == 0 and int == 0 then
      set sfx = "Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl"
    elseif str == 0 and agi > 0 and int == 0 then
      set sfx = "Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl"
    elseif str == 0 and agi == 0 and int > 0 then
      set sfx = "Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl"
    else
      set sfx = "Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl"
    endif
    call DestroyEffect(AddSpecialEffect(sfx, GetUnitX(whichUnit), GetUnitY(whichUnit)))
  endfunction

  function UnitRescue takes unit whichUnit, player whichPlayer returns nothing
    call ShowUnit(whichUnit, true)
    call SetUnitInvulnerable(whichUnit, false)
    call SetUnitOwner(whichUnit, whichPlayer, true)
  endfunction

  function UnitDropAllItems takes unit u returns nothing
    local integer i = 0
    local item dropItem = null
    local real unitX = GetUnitX(u)
    local real unitY = GetUnitY(u)
    local real x = 0
    local real y = 0
    local real ang = 0  //Radians
    loop
    exitwhen i > 6
      set x = unitX + HERO_DROP_DIST * Cos(ang)
      set y = unitY + HERO_DROP_DIST * Sin(ang)
      set ang = ang + (360*bj_DEGTORAD)/6
      set dropItem = UnitItemInSlot(u, i)
      if BlzGetItemBooleanField(dropItem, ITEM_BF_DROPPED_WHEN_CARRIER_DIES) or BlzGetItemBooleanField(dropItem, ITEM_BF_CAN_BE_DROPPED) then                
        call UnitRemoveItem(u, dropItem)
        call SetItemPosition(dropItem, x, y)
      endif
      set i = i + 1
    endloop
  endfunction

  function UnitTransferItems takes unit sender, unit receiver returns nothing
    local integer i = 0
    loop
    exitwhen i > 6
      call UnitAddItem(receiver, UnitItemInSlot(sender, i))
      set i = i + 1
    endloop
  endfunction
    
endlibrary