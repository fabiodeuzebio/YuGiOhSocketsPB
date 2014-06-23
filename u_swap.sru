HA$PBExportHeader$u_swap.sru
forward
global type u_swap from u_based
end type
type uo_57 from u_poker within u_swap
end type
end forward

global type u_swap from u_based
integer width = 517
integer height = 492
uo_57 uo_57
end type
global u_swap u_swap

on u_swap.create
int iCurrent
call super::create
this.uo_57=create uo_57
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_57
end on

on u_swap.destroy
call super::destroy
destroy(this.uo_57)
end on

type uo_57 from u_poker within u_swap
integer x = 64
integer y = 44
integer taborder = 10
boolean bringtotop = true
borderstyle borderstyle = stylebox!
boolean ib_alwaysvisible = true
string is_type = "swap"
end type

on uo_57.destroy
call u_poker::destroy
end on

