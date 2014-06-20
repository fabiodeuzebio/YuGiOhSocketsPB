HA$PBExportHeader$u_tabpg_tcpip_send.sru
$PBExportComments$Base tabpage object
forward
global type u_tabpg_tcpip_send from u_tabpg
end type
type cb_reset from commandbutton within u_tabpg_tcpip_send
end type
type lb_msgs from listbox within u_tabpg_tcpip_send
end type
type st_4 from statictext within u_tabpg_tcpip_send
end type
type cb_send from commandbutton within u_tabpg_tcpip_send
end type
type sle_hostname from singlelineedit within u_tabpg_tcpip_send
end type
type st_1 from statictext within u_tabpg_tcpip_send
end type
type st_3 from statictext within u_tabpg_tcpip_send
end type
type sle_message from singlelineedit within u_tabpg_tcpip_send
end type
type st_2 from statictext within u_tabpg_tcpip_send
end type
type sle_port from singlelineedit within u_tabpg_tcpip_send
end type
type cb_gethost from commandbutton within u_tabpg_tcpip_send
end type
end forward

global type u_tabpg_tcpip_send from u_tabpg
integer width = 2459
integer height = 692
string text = "TCP/IP Send"
cb_reset cb_reset
lb_msgs lb_msgs
st_4 st_4
cb_send cb_send
sle_hostname sle_hostname
st_1 st_1
st_3 st_3
sle_message sle_message
st_2 st_2
sle_port sle_port
cb_gethost cb_gethost
end type
global u_tabpg_tcpip_send u_tabpg_tcpip_send

forward prototypes
public subroutine uf_comunica (string ascomand)
end prototypes

public subroutine uf_comunica (string ascomand);String ls_hostname, ls_reply, ls_peeraddr
UInt lui_port
ULong lul_socket

SetPointer(HourGlass!)
	
ls_hostname = sle_hostname.text
If ls_hostname = "" Then
	sle_hostname.SetFocus()	
	Return
End If

lui_port = Long(sle_port.text)
If lui_port = 0 Then
	sle_port.SetFocus()	
	Return
End If

If asComand = "" Then
	Return
End If

// connect to the server
lul_socket = gn_ws.of_Connect(ls_hostname, lui_port, 3)
If lul_socket = 0 Then
	asComand = gn_ws.of_GetLastError()
	lb_msgs.AddItem(asComand)
	MessageBox("Connect Error", asComand, StopSign!)
Else
	// get peername
	ls_peeraddr = gn_ws.of_GetPeerName(lul_socket)
	lb_msgs.AddItem("Peer IP Address: " + ls_peeraddr)
	// send the message
	If Not gn_ws.of_Send(lul_socket, asComand) Then
		gn_ws.of_Close(lul_socket)
	End If
	// receive response
	gn_ws.of_Recv(lul_socket, ls_reply)
	// close the socket
	gn_ws.of_Close(lul_socket)
	lb_msgs.AddItem(ls_reply)
End If

end subroutine

on u_tabpg_tcpip_send.create
int iCurrent
call super::create
this.cb_reset=create cb_reset
this.lb_msgs=create lb_msgs
this.st_4=create st_4
this.cb_send=create cb_send
this.sle_hostname=create sle_hostname
this.st_1=create st_1
this.st_3=create st_3
this.sle_message=create sle_message
this.st_2=create st_2
this.sle_port=create sle_port
this.cb_gethost=create cb_gethost
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reset
this.Control[iCurrent+2]=this.lb_msgs
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.cb_send
this.Control[iCurrent+5]=this.sle_hostname
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.sle_message
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.sle_port
this.Control[iCurrent+11]=this.cb_gethost
end on

on u_tabpg_tcpip_send.destroy
call super::destroy
destroy(this.cb_reset)
destroy(this.lb_msgs)
destroy(this.st_4)
destroy(this.cb_send)
destroy(this.sle_hostname)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.sle_message)
destroy(this.st_2)
destroy(this.sle_port)
destroy(this.cb_gethost)
end on

event ue_pagechanged;call super::ue_pagechanged;sle_hostname.SetFocus()

end event

event destructor;call super::destructor;of_setreg("SendPort", sle_port.text)
of_setreg("SendHostName", sle_hostname.text)

end event

event constructor;call super::constructor;sle_port.text = of_getreg("SendPort", "")
sle_hostname.text = of_getreg("SendHostName", "")

end event

type cb_reset from commandbutton within u_tabpg_tcpip_send
integer x = 937
integer y = 524
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

type lb_msgs from listbox within u_tabpg_tcpip_send
integer x = 1353
integer y = 96
integer width = 1038
integer height = 512
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

type st_4 from statictext within u_tabpg_tcpip_send
integer x = 1353
integer y = 32
integer width = 283
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Messages:"
boolean focusrectangle = false
end type

type cb_send from commandbutton within u_tabpg_tcpip_send
integer x = 37
integer y = 544
integer width = 334
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Enviar Msg"
end type

event clicked;String ls_hostname, ls_message, ls_reply, ls_peeraddr
UInt lui_port
ULong lul_socket

SetPointer(HourGlass!)

ls_hostname = sle_hostname.text
If ls_hostname = "" Then
	sle_hostname.SetFocus()
	MessageBox("Edit Error", "Server Host Name is required!")
	Return
End If

lui_port = Long(sle_port.text)
If lui_port = 0 Then
	sle_port.SetFocus()
	MessageBox("Edit Error", "Server Port is required!")
	Return
End If

ls_message = sle_message.text
If ls_message = "" Then
	sle_message.SetFocus()
	MessageBox("Edit Error", "Message is required!")
	Return
End If

// connect to the server
lul_socket = gn_ws.of_Connect(ls_hostname, lui_port, 3)
If lul_socket = 0 Then
	ls_message = gn_ws.of_GetLastError()
	lb_msgs.AddItem(ls_message)
	MessageBox("Connect Error", ls_message, StopSign!)
Else
	// get peername
	ls_peeraddr = gn_ws.of_GetPeerName(lul_socket)
	lb_msgs.AddItem("Peer IP Address: " + ls_peeraddr)
	// send the message
	If Not gn_ws.of_Send(lul_socket, ls_message) Then
		gn_ws.of_Close(lul_socket)
	End If
	// receive response
	gn_ws.of_Recv(lul_socket, ls_reply)
	// close the socket
	gn_ws.of_Close(lul_socket)
	lb_msgs.AddItem(ls_reply)
End If

end event

type sle_hostname from singlelineedit within u_tabpg_tcpip_send
integer x = 219
integer y = 104
integer width = 626
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within u_tabpg_tcpip_send
integer x = 37
integer y = 116
integer width = 261
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ip Conect"
boolean focusrectangle = false
end type

type st_3 from statictext within u_tabpg_tcpip_send
integer x = 37
integer y = 356
integer width = 311
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mensagem:"
boolean focusrectangle = false
end type

type sle_message from singlelineedit within u_tabpg_tcpip_send
integer x = 37
integer y = 416
integer width = 1248
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within u_tabpg_tcpip_send
integer x = 37
integer y = 228
integer width = 169
integer height = 60
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

type sle_port from singlelineedit within u_tabpg_tcpip_send
integer x = 219
integer y = 224
integer width = 224
integer height = 80
integer taborder = 30
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

type cb_gethost from commandbutton within u_tabpg_tcpip_send
integer x = 914
integer y = 96
integer width = 334
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Pegar IP"
end type

event clicked;String ls_hostname

ls_hostname = gn_ws.of_GetHostName()

sle_hostname.text = ls_hostname

end event

