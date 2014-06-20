HA$PBExportHeader$w_win.srw
forward
global type w_win from window
end type
type p_1 from picture within w_win
end type
end forward

global type w_win from window
integer width = 2478
integer height = 740
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
end type
global w_win w_win

on w_win.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on w_win.destroy
destroy(this.p_1)
end on

event open;if gnv_cards.ib_cheat then 
	p_1.picturename = 'res\youwin2.png'
else
	p_1.picturename = 'res\youwin.png'
end if
end event

type p_1 from picture within w_win
integer width = 2473
integer height = 800
string picturename = "res\youwin.png"
boolean focusrectangle = false
end type

event clicked;close(parent)
end event

