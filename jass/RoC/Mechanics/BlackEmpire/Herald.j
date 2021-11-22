library Herald requires BlackEmpirePortalSetup, AIDS, ReturnToNyalotha

  globals
    private constant integer HERALD_ID = 'u02E'
  endglobals

  struct Herald extends array
    //! runtextmacro AIDS()
    private static thistype instance = 0 //There can only be one Herald.
    private BlackEmpirePortal linkedPortal //Each Herald keeps a BlackEmpirePortal active, but only while alive.

    public static method operator Instance takes nothing returns thistype
      return thistype.instance
    endmethod

    private method UnlinkToPortal takes nothing returns nothing
      call this.linkedPortal.Close()
      set this.linkedPortal = 0
    endmethod

    private method LinkToPortal takes BlackEmpirePortal whichPortal returns nothing
      set this.linkedPortal = whichPortal
      call this.linkedPortal.Open()
    endmethod

    private method AIDS_onCreate takes nothing returns nothing
      if instance == 0 then
        set instance = this
      else
        call BJDebugMsg("ERROR: there can only be one " + GetObjectName(HERALD_ID))
        return
      endif
      call this.LinkToPortal(BlackEmpirePortal.Objective)
      call BlzSetUnitName(this.unit, "Herald of " + this.linkedPortal.Name)
    endmethod

    private method AIDS_onDestroy takes nothing returns nothing
      if this == instance then
        call ReturnToNyalotha()
        call this.UnlinkToPortal()
        set instance = 0
      endif
    endmethod

    private static method AIDS_filter takes unit u returns boolean
      if GetUnitTypeId(u) == HERALD_ID then
        return true
      endif
      return false
    endmethod
  endstruct

endlibrary