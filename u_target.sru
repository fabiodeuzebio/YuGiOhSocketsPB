HA$PBExportHeader$u_target.sru
forward
global type u_target from u_based
end type
type uo_61 from u_poker within u_target
end type
end forward

global type u_target from u_based
integer width = 512
integer height = 492
uo_61 uo_61
end type
global u_target u_target

on u_target.create
int iCurrent
call super::create
this.uo_61=create uo_61
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_61
end on

on u_target.destroy
call super::destroy
destroy(this.uo_61)
end on

type uo_61 from u_poker within u_target
integer x = 64
integer y = 44
integer taborder = 10
boolean bringtotop = true
borderstyle borderstyle = stylebox!
boolean ib_alwaysvisible = true
string is_type = "target"
end type

on uo_61.destroy
call u_poker::destroy
end on

