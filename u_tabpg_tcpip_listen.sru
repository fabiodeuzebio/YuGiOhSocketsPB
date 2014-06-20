HA$PBExportHeader$u_tabpg_tcpip_listen.sru
$PBExportComments$Base tabpage object
forward
global type u_tabpg_tcpip_listen from u_tabpg
end type
type cb_reset from commandbutton within u_tabpg_tcpip_listen
end type
type cb_stop1 from commandbutton within u_tabpg_tcpip_listen
end type
type cb_listen1 from commandbutton within u_tabpg_tcpip_listen
end type
type lb_msgs from listbox within u_tabpg_tcpip_listen
end type
type st_2 from statictext within u_tabpg_tcpip_listen
end type
type st_1 from statictext within u_tabpg_tcpip_listen
end type
type sle_port from singlelineedit within u_tabpg_tcpip_listen
end type
type gb_1 from groupbox within u_tabpg_tcpip_listen
end type
end forward

global type u_tabpg_tcpip_listen from u_tabpg
integer width = 2459
integer height = 760
string text = "TCP/IP Listen"
event ue_listen pbm_custom01
cb_reset cb_reset
cb_stop1 cb_stop1
cb_listen1 cb_listen1
lb_msgs lb_msgs
st_2 st_2
st_1 st_1
sle_port sle_port
gb_1 gb_1
end type
global u_tabpg_tcpip_listen u_tabpg_tcpip_listen

type variables
ULong iul_socket
ULong iul_listen
Boolean ib_Running

end variables

event ue_listen;// listen for messages

String ls_message, ls_ipaddress

choose case lparam
	case gn_ws.FD_ACCEPT
		// accept the incoming socket
		iul_listen = gn_ws.of_Accept(iul_socket)
		ls_ipaddress = gn_ws.of_GetPeerName(iul_listen)
		lb_msgs.AddItem("Incoming IP Address: " + ls_ipaddress)
	case gn_ws.FD_READ
		// read data from the incoming socket
		If gn_ws.of_Recv(iul_listen, ls_message) Then
			lb_msgs.AddItem(ls_message)
		Else
			lb_msgs.AddItem("of_Recv Error: " + gn_ws.of_GetLastError())
		End If
		// let the sender know we got the message
		gn_ws.of_Send(iul_listen, &
			String(Len(ls_message)) + " Bytes Received")
		// close the incoming socket
		gn_ws.of_Close(iul_listen)
end choose

end event

on u_tabpg_tcpip_listen.create
int iCurrent
call super::create
this.cb_reset=create cb_reset
this.cb_stop1=create cb_stop1
this.cb_listen1=create cb_listen1
this.lb_msgs=create lb_msgs
this.st_2=create st_2
this.st_1=create st_1
this.sle_port=create sle_port
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reset
this.Control[iCurrent+2]=this.cb_stop1
this.Control[iCurrent+3]=this.cb_listen1
this.Control[iCurrent+4]=this.lb_msgs
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.sle_port
this.Control[iCurrent+8]=this.gb_1
end on

on u_tabpg_tcpip_listen.destroy
call super::destroy
destroy(this.cb_reset)
destroy(this.cb_stop1)
destroy(this.cb_listen1)
destroy(this.lb_msgs)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_port)
destroy(this.gb_1)
end on

event ue_pagechanged;call super::ue_pagechanged;sle_port.SetFocus()

end event

event constructor;call super::constructor;sle_port.text = of_getreg("ListenPort", "")

end event

event destructor;call super::destructor;of_setreg("ListenPort", sle_port.text)

end event

type cb_reset from commandbutton within u_tabpg_tcpip_listen
integer x = 891
integer y = 252
integer width = 334
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Limpa"
end type

event clicked;lb_msgs.Reset()

end event

type cb_stop1 from commandbutton within u_tabpg_tcpip_listen
integer x = 512
integer y = 256
integer width = 334
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Stop"
end type

event clicked;// stop listening

SetPointer(HourGlass!)

// close the listening socket
gn_ws.of_Close(iul_socket)

// enable controls
sle_port.Enabled = True
cb_listen1.Enabled = True
cb_stop1.Enabled = False


lb_msgs.AddItem("Stopped...")

end event

type cb_listen1 from commandbutton within u_tabpg_tcpip_listen
integer x = 110
integer y = 252
integer width = 334
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Start"
end type

event clicked;// start listening

UInt lui_port

SetPointer(HourGlass!)

lb_msgs.Reset()
lb_msgs.AddItem("Running...")

// make sure Port is specified
lui_port = Long(sle_port.text)
If lui_port = 0 Then
	sle_port.SetFocus()
	MessageBox("Edit Error", "Server Port is required!")
	Return
End If

// disable controls
sle_port.Enabled = False
cb_listen1.Enabled = False
cb_stop1.Enabled = True


// create a listening socket
iul_socket = gn_ws.of_Listen(lui_port, Handle(Parent), 1)

end event

type lb_msgs from listbox within u_tabpg_tcpip_listen
integer x = 1353
integer y = 96
integer width = 1079
integer height = 612
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within u_tabpg_tcpip_listen
integer x = 1353
integer y = 32
integer width = 320
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mensagens:"
boolean focusrectangle = false
end type

type st_1 from statictext within u_tabpg_tcpip_listen
integer x = 27
integer y = 28
integer width = 169
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Porta:"
boolean focusrectangle = false
end type

type sle_port from singlelineedit within u_tabpg_tcpip_listen
integer x = 178
integer y = 20
integer width = 224
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within u_tabpg_tcpip_listen
integer x = 9
integer y = 132
integer width = 1248
integer height = 324
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Escutar usando evento"
end type

