HA$PBExportHeader$u_source.sru
forward
global type u_source from u_based
end type
type p_2 from u_poker within u_source
end type
type p_3 from u_poker within u_source
end type
type p_4 from u_poker within u_source
end type
type p_5 from u_poker within u_source
end type
type p_6 from u_poker within u_source
end type
type p_7 from u_poker within u_source
end type
type p_8 from u_poker within u_source
end type
type p_1 from u_poker within u_source
end type
end forward

global type u_source from u_based
integer width = 2953
integer height = 1960
p_2 p_2
p_3 p_3
p_4 p_4
p_5 p_5
p_6 p_6
p_7 p_7
p_8 p_8
p_1 p_1
end type
global u_source u_source

on u_source.create
int iCurrent
call super::create
this.p_2=create p_2
this.p_3=create p_3
this.p_4=create p_4
this.p_5=create p_5
this.p_6=create p_6
this.p_7=create p_7
this.p_8=create p_8
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_2
this.Control[iCurrent+2]=this.p_3
this.Control[iCurrent+3]=this.p_4
this.Control[iCurrent+4]=this.p_5
this.Control[iCurrent+5]=this.p_6
this.Control[iCurrent+6]=this.p_7
this.Control[iCurrent+7]=this.p_8
this.Control[iCurrent+8]=this.p_1
end on

on u_source.destroy
call super::destroy
destroy(this.p_2)
destroy(this.p_3)
destroy(this.p_4)
destroy(this.p_5)
destroy(this.p_6)
destroy(this.p_7)
destroy(this.p_8)
destroy(this.p_1)
end on

type p_2 from u_poker within u_source
integer x = 768
integer y = 36
integer taborder = 20
boolean bringtotop = true
boolean ib_alwaysvisible = true
end type

type p_3 from u_poker within u_source
integer x = 1495
integer y = 36
integer taborder = 30
boolean bringtotop = true
boolean ib_alwaysvisible = true
end type

type p_4 from u_poker within u_source
integer x = 2222
integer y = 36
integer taborder = 40
boolean bringtotop = true
boolean ib_alwaysvisible = true
end type

type p_5 from u_poker within u_source
integer x = 41
integer y = 1000
integer taborder = 50
boolean bringtotop = true
boolean ib_alwaysvisible = true
end type

type p_6 from u_poker within u_source
integer x = 768
integer y = 1000
integer taborder = 60
boolean bringtotop = true
boolean ib_alwaysvisible = true
end type

type p_7 from u_poker within u_source
integer x = 1495
integer y = 1000
integer taborder = 70
boolean bringtotop = true
boolean ib_alwaysvisible = true
end type

type p_8 from u_poker within u_source
integer x = 2222
integer y = 1000
integer taborder = 80
boolean bringtotop = true
boolean ib_alwaysvisible = true
end type

type p_1 from u_poker within u_source
integer x = 41
integer y = 36
integer taborder = 10
boolean ib_alwaysvisible = true
end type

