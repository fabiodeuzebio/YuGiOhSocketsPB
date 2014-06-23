HA$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_1 from commandbutton within w_main
end type
type uo_1 from u_tabpg_tcpip_listen within w_main
end type
type lb_msgs from listbox within w_main
end type
type cb_reset from commandbutton within w_main
end type
type cb_send from commandbutton within w_main
end type
type sle_message from singlelineedit within w_main
end type
type sle_port from singlelineedit within w_main
end type
type sle_hostname from singlelineedit within w_main
end type
type sle_otherscore from singlelineedit within w_main
end type
type sle_myscore from singlelineedit within w_main
end type
type hpb_2 from hprogressbar within w_main
end type
type hpb_1 from hprogressbar within w_main
end type
type cb_defesa from commandbutton within w_main
end type
type cb_ataque from commandbutton within w_main
end type
type uo_target from u_target within w_main
end type
type uo_swap from u_swap within w_main
end type
type cb_play from commandbutton within w_main
end type
type uo_source from u_source within w_main
end type
type cbx_setunicode from checkbox within w_main
end type
type st_3 from statictext within w_main
end type
type st_hostname from statictext within w_main
end type
type st_8 from statictext within w_main
end type
type st_ipaddress from statictext within w_main
end type
end forward

global type w_main from window
integer width = 5248
integer height = 3232
boolean titlebar = true
string title = "sockets Fabio"
string menuname = "m_main"
boolean controlmenu = true
windowstate windowstate = maximized!
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
uo_1 uo_1
lb_msgs lb_msgs
cb_reset cb_reset
cb_send cb_send
sle_message sle_message
sle_port sle_port
sle_hostname sle_hostname
sle_otherscore sle_otherscore
sle_myscore sle_myscore
hpb_2 hpb_2
hpb_1 hpb_1
cb_defesa cb_defesa
cb_ataque cb_ataque
uo_target uo_target
uo_swap uo_swap
cb_play cb_play
uo_source uo_source
cbx_setunicode cbx_setunicode
st_3 st_3
st_hostname st_hostname
st_8 st_8
st_ipaddress st_ipaddress
end type
global w_main w_main

type variables
int i_card[8]
ULong iul_socket
ULong iul_listen
Boolean ib_Running

end variables

forward prototypes
public subroutine uf_iniciavetor ()
public subroutine uf_protocolorec (string asmsg)
public function boolean uf_sendcom (string ascomando)
public subroutine uf_calcula (long alscore, string astipo, long alforce)
end prototypes

public subroutine uf_iniciavetor ();gnv_cards.iidefesaataque[1,1] = 666
gnv_cards.iidefesaataque[1,2] = 666
gnv_cards.iidefesaataque[2,1] = 100
gnv_cards.iidefesaataque[2,2] = 100
gnv_cards.iidefesaataque[3,1] =100
gnv_cards.iidefesaataque[3,2] =2000
gnv_cards.iidefesaataque[4,1] =250
gnv_cards.iidefesaataque[4,2] =250
gnv_cards.iidefesaataque[5,1] =800
gnv_cards.iidefesaataque[5,2] =600
gnv_cards.iidefesaataque[6,1] =200
gnv_cards.iidefesaataque[6,2] =300
gnv_cards.iidefesaataque[7,1] =500
gnv_cards.iidefesaataque[7,2] =1000
gnv_cards.iidefesaataque[8,1] =700
gnv_cards.iidefesaataque[8,2] =700
gnv_cards.iidefesaataque[9,1] =2200
gnv_cards.iidefesaataque[9,2] =2200
gnv_cards.iidefesaataque[10,1] =100
gnv_cards.iidefesaataque[10,2] =800
gnv_cards.iidefesaataque[11,1] =100
gnv_cards.iidefesaataque[11,2] =100
gnv_cards.iidefesaataque[12,1] =800
gnv_cards.iidefesaataque[12,2] =0
gnv_cards.iidefesaataque[13,1] =600
gnv_cards.iidefesaataque[13,2] =500
gnv_cards.iidefesaataque[14,1] =100
gnv_cards.iidefesaataque[14,2] =800
gnv_cards.iidefesaataque[15,1] =100
gnv_cards.iidefesaataque[15,2] =100
gnv_cards.iidefesaataque[16,1] =300
gnv_cards.iidefesaataque[16,2] =200
gnv_cards.iidefesaataque[17,1] =100
gnv_cards.iidefesaataque[17,2] =300
gnv_cards.iidefesaataque[18,1] =100
gnv_cards.iidefesaataque[18,2] =600
gnv_cards.iidefesaataque[19,1] =600
gnv_cards.iidefesaataque[19,2] =0
gnv_cards.iidefesaataque[20,1] =100
gnv_cards.iidefesaataque[20,2] =100
gnv_cards.iidefesaataque[21,1] =400
gnv_cards.iidefesaataque[21,2] =400
gnv_cards.iidefesaataque[22,1] =100
gnv_cards.iidefesaataque[22,2] =300
gnv_cards.iidefesaataque[23,1] =100
gnv_cards.iidefesaataque[23,2] =1000
gnv_cards.iidefesaataque[24,1] =300
gnv_cards.iidefesaataque[24,2] =100
gnv_cards.iidefesaataque[25,1] =300
gnv_cards.iidefesaataque[25,2] =300
gnv_cards.iidefesaataque[26,1] =300
gnv_cards.iidefesaataque[26,2] =300
gnv_cards.iidefesaataque[27,1] =400
gnv_cards.iidefesaataque[27,2] =200
gnv_cards.iidefesaataque[28,1] =100
gnv_cards.iidefesaataque[28,2] =100
gnv_cards.iidefesaataque[29,1] =300
gnv_cards.iidefesaataque[29,2] =300
gnv_cards.iidefesaataque[30,1] =300
gnv_cards.iidefesaataque[30,2] =300
gnv_cards.iidefesaataque[31,1] =100
gnv_cards.iidefesaataque[31,2] =100
gnv_cards.iidefesaataque[32,1] =0
gnv_cards.iidefesaataque[32,2] =1900
gnv_cards.iidefesaataque[33,1] =1000
gnv_cards.iidefesaataque[33,2] =1000
gnv_cards.iidefesaataque[34,1] =200
gnv_cards.iidefesaataque[34,2] =400
gnv_cards.iidefesaataque[35,1] =100
gnv_cards.iidefesaataque[35,2] =100
gnv_cards.iidefesaataque[36,1] =100
gnv_cards.iidefesaataque[36,2] =100
gnv_cards.iidefesaataque[37,1] =500
gnv_cards.iidefesaataque[37,2] =200
gnv_cards.iidefesaataque[38,1] =500
gnv_cards.iidefesaataque[38,2] =200
gnv_cards.iidefesaataque[39,1] =500
gnv_cards.iidefesaataque[39,2] =200
gnv_cards.iidefesaataque[40,1] =300
gnv_cards.iidefesaataque[40,2] =500
gnv_cards.iidefesaataque[41,1] =200
gnv_cards.iidefesaataque[41,2] =200
gnv_cards.iidefesaataque[42,1] =100
gnv_cards.iidefesaataque[42,2] =200
gnv_cards.iidefesaataque[43,1] =600
gnv_cards.iidefesaataque[43,2] =100
gnv_cards.iidefesaataque[44,1] =200
gnv_cards.iidefesaataque[44,2] =300
gnv_cards.iidefesaataque[45,1] =400
gnv_cards.iidefesaataque[45,2] =300
gnv_cards.iidefesaataque[46,1] =300
gnv_cards.iidefesaataque[46,2] =300
gnv_cards.iidefesaataque[47,1] =1600
gnv_cards.iidefesaataque[47,2] =100
gnv_cards.iidefesaataque[48,1] =500
gnv_cards.iidefesaataque[48,2] =1500
gnv_cards.iidefesaataque[49,1] =2100
gnv_cards.iidefesaataque[49,2] =1800
gnv_cards.iidefesaataque[50,1] =2800
gnv_cards.iidefesaataque[50,2] =2000
gnv_cards.iidefesaataque[51,1] =1500
gnv_cards.iidefesaataque[51,2] =1400
gnv_cards.iidefesaataque[52,1] =1200
gnv_cards.iidefesaataque[52,2] =1400
gnv_cards.iidefesaataque[53,1] =2200
gnv_cards.iidefesaataque[53,2] =2000
gnv_cards.iidefesaataque[54,1] =1000
gnv_cards.iidefesaataque[54,2] =1800
gnv_cards.iidefesaataque[55,1] =2000
gnv_cards.iidefesaataque[55,2] =0
gnv_cards.iidefesaataque[56,1] =0
gnv_cards.iidefesaataque[56,2] =1100
gnv_cards.iidefesaataque[57,1] =1700
gnv_cards.iidefesaataque[57,2] =1000
gnv_cards.iidefesaataque[58,1] =1000
gnv_cards.iidefesaataque[58,2] =1000
gnv_cards.iidefesaataque[59,1] =2400
gnv_cards.iidefesaataque[59,2] =2000
gnv_cards.iidefesaataque[60,1] =1000
gnv_cards.iidefesaataque[60,2] =500
gnv_cards.iidefesaataque[61,1] =300
gnv_cards.iidefesaataque[61,2] =200
gnv_cards.iidefesaataque[62,1] =2800
gnv_cards.iidefesaataque[62,2] =2900
gnv_cards.iidefesaataque[63,1] =1000
gnv_cards.iidefesaataque[63,2] =200
gnv_cards.iidefesaataque[64,1] =1200
gnv_cards.iidefesaataque[64,2] =0


end subroutine

public subroutine uf_protocolorec (string asmsg);String lsScore, lsAto, lsForce, lsPlayer, lsCarta

if left(trim(asMsg),8) = '&CONECT&' then
	POST uf_SendCom('&CONECTOK&') 
	lb_msgs.AddItem("Conectou")
	cb_play.enabled = True
		
elseif left(trim(asMsg),10) = '&CONECTOK&' then
	cb_play.enabled = True
	
elseif left(trim(asMsg),6) = '&PLAY&' then
	if gsPlayer <> "" then
		cb_defesa.enabled = True
		cb_ataque.enabled = True
	else
		post uf_SendCom('&PLAYOK&') 
		lb_msgs.AddItem("Virou as cartas")
		cb_defesa.enabled = False
		cb_ataque.enabled = False
     
		// eu sou player 2
		gsPlayer = gsJogador[2]
	end if
elseif left(trim(asMsg),5) = '#WIN#' then
	open(w_win)
	
elseif left(trim(asMsg),6) = '#GAME#' then	
	lsScore = mid(asMsg,7,5)	
	lsAto = mid(asMsg,13,1)
	lsForce = mid(asMsg,15,4)
	lsPlayer = mid(asMsg,20,7)
	lsCarta = right(asMsg,2)	
	uo_target.uo_61.of_set(long(lsCarta))
	
	uf_calcula(long(lsScore), lsAto, long(lsForce))
	cb_defesa.enabled = True
	cb_ataque.enabled = True
	
elseif left(trim(asMsg),5) = '#PERDEU#' then
	
end if
end subroutine

public function boolean uf_sendcom (string ascomando);String ls_hostname, ls_reply, ls_peeraddr
UInt lui_port
ULong lul_socket

SetPointer(HourGlass!)

ls_hostname = sle_hostname.text
If ls_hostname = "" Then
	sle_hostname.SetFocus()
	MessageBox("Edit Error", "Server Host Name is required!")
	Return False
End If

lui_port = Long(sle_port.text)
If lui_port = 0 Then
	sle_port.SetFocus()
	MessageBox("Edit Error", "Server Port is required!")
	Return False
End If

If asComando = "" Then
	Return False
End If

// connect to the server
lul_socket = gn_ws.of_Connect(ls_hostname, lui_port,5)
If lul_socket = 0 Then
	asComando = gn_ws.of_GetLastError()
	lb_msgs.AddItem(asComando)
	MessageBox("Connect Error", asComando, StopSign!)
	return False
Else
	// get peername
	ls_peeraddr = gn_ws.of_GetPeerName(lul_socket)
	lb_msgs.AddItem("Peer IP Address: " + ls_peeraddr)
	// send the message
	If Not gn_ws.of_Send(lul_socket, asComando) Then
		gn_ws.of_Close(lul_socket)
	End If
	// receive response
	gn_ws.of_Recv(lul_socket, ls_reply)
	// close the socket
	gn_ws.of_Close(lul_socket)
	lb_msgs.AddItem(ls_reply)
End If

end function

public subroutine uf_calcula (long alscore, string astipo, long alforce);long lsScoreAtual

if glScore = 0 then return

sle_otherscore.text = string(alScore)

if asTipo = "D" or asTipo = "A" then	
	   if alForce > glForce then
		  lsScoreAtual = glScore - (alForce - glForce)
	   else
		  lsScoreAtual = glScore - (glForce -  alForce)	
	   end if
end if


if lsScoreAtual < 0  then
	MessageBox('Atencao!','Voce Perdeu')
end if
uf_SendCom("#WIN#")
sle_myscore.text = string(lsScoreAtual)

if glContar >= 8 then
	if long(sle_myscore.text) < long(sle_otherscore.text) then
		MessageBox('Atencao!','Voce Perdeu')
         uf_SendCom("#WIN#")
    else
		MessageBox('Atencao!','Voce Ganhou')
         uf_SendCom("#PERDEU#")
    end if		
end if



end subroutine

on w_main.create
if this.MenuName = "m_main" then this.MenuID = create m_main
this.cb_1=create cb_1
this.uo_1=create uo_1
this.lb_msgs=create lb_msgs
this.cb_reset=create cb_reset
this.cb_send=create cb_send
this.sle_message=create sle_message
this.sle_port=create sle_port
this.sle_hostname=create sle_hostname
this.sle_otherscore=create sle_otherscore
this.sle_myscore=create sle_myscore
this.hpb_2=create hpb_2
this.hpb_1=create hpb_1
this.cb_defesa=create cb_defesa
this.cb_ataque=create cb_ataque
this.uo_target=create uo_target
this.uo_swap=create uo_swap
this.cb_play=create cb_play
this.uo_source=create uo_source
this.cbx_setunicode=create cbx_setunicode
this.st_3=create st_3
this.st_hostname=create st_hostname
this.st_8=create st_8
this.st_ipaddress=create st_ipaddress
this.Control[]={this.cb_1,&
this.uo_1,&
this.lb_msgs,&
this.cb_reset,&
this.cb_send,&
this.sle_message,&
this.sle_port,&
this.sle_hostname,&
this.sle_otherscore,&
this.sle_myscore,&
this.hpb_2,&
this.hpb_1,&
this.cb_defesa,&
this.cb_ataque,&
this.uo_target,&
this.uo_swap,&
this.cb_play,&
this.uo_source,&
this.cbx_setunicode,&
this.st_3,&
this.st_hostname,&
this.st_8,&
this.st_ipaddress}
end on

on w_main.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
destroy(this.uo_1)
destroy(this.lb_msgs)
destroy(this.cb_reset)
destroy(this.cb_send)
destroy(this.sle_message)
destroy(this.sle_port)
destroy(this.sle_hostname)
destroy(this.sle_otherscore)
destroy(this.sle_myscore)
destroy(this.hpb_2)
destroy(this.hpb_1)
destroy(this.cb_defesa)
destroy(this.cb_ataque)
destroy(this.uo_target)
destroy(this.uo_swap)
destroy(this.cb_play)
destroy(this.uo_source)
destroy(this.cbx_setunicode)
destroy(this.st_3)
destroy(this.st_hostname)
destroy(this.st_8)
destroy(this.st_ipaddress)
end on

event open;String ls_hostname

gsPlayer = ""

gnv_cards.post of_register(uo_swap.control ,'swap')
gnv_cards.post of_register(uo_target.control ,'target')
gnv_cards.post of_register(uo_source.control,'source')
uf_iniciavetor()

ls_hostname = gn_ws.of_GetHostName()
st_hostname.text = ls_hostname
st_ipaddress.text = gn_ws.of_GetIPAddress(ls_hostname)

end event

type cb_1 from commandbutton within w_main
integer x = 1184
integer y = 140
integer width = 402
integer height = 76
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Conectar"
end type

event clicked;uf_sendCom("&CONECT&")
end event

type uo_1 from u_tabpg_tcpip_listen within w_main
integer x = 2985
integer y = 1736
integer taborder = 110
end type

on uo_1.destroy
call u_tabpg_tcpip_listen::destroy
end on

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
			uf_protocolorec(ls_message)
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

type lb_msgs from listbox within w_main
integer x = 46
integer y = 360
integer width = 1175
integer height = 520
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {""}
borderstyle borderstyle = stylelowered!
end type

type cb_reset from commandbutton within w_main
integer x = 1307
integer y = 468
integer width = 402
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Limpa"
end type

event clicked;lb_msgs.Reset()
end event

type cb_send from commandbutton within w_main
integer x = 1307
integer y = 372
integer width = 402
integer height = 76
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enviar"
end type

event clicked;String ls_hostname, ls_message

ls_message = sle_message.text
uf_sendCom(ls_message)
end event

type sle_message from singlelineedit within w_main
integer x = 46
integer y = 236
integer width = 759
integer height = 76
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_port from singlelineedit within w_main
integer x = 887
integer y = 140
integer width = 224
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "888"
borderstyle borderstyle = stylelowered!
end type

type sle_hostname from singlelineedit within w_main
integer x = 41
integer y = 136
integer width = 759
integer height = 76
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "10.0.17.80"
borderstyle borderstyle = stylelowered!
end type

type sle_otherscore from singlelineedit within w_main
integer x = 4645
integer y = 132
integer width = 384
integer height = 160
integer taborder = 40
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "50000"
borderstyle borderstyle = stylelowered!
end type

type sle_myscore from singlelineedit within w_main
integer x = 2715
integer y = 148
integer width = 384
integer height = 160
integer taborder = 60
integer textsize = -20
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "50000"
borderstyle borderstyle = stylelowered!
end type

type hpb_2 from hprogressbar within w_main
integer x = 4082
integer y = 44
integer width = 832
integer height = 68
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type hpb_1 from hprogressbar within w_main
integer x = 2816
integer y = 48
integer width = 777
integer height = 68
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type cb_defesa from commandbutton within w_main
integer x = 3250
integer y = 1336
integer width = 311
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Defesa"
end type

event clicked;long li_displayrank
String lsMeuPontos

li_displayrank = uo_swap.uo_57.iiDefesa
lsMeuPontos = sle_myscore.Text


if uf_SendCom("#GAME#"+lsMeuPontos+"#D#" + right("0000"+string(li_displayrank),4) + "#" + gsPlayer + "#" + right("00"+string(uo_swap.uo_57.ii_rank),2) ) then
   cb_defesa.enabled = false
   cb_ataque.enabled = False
end if

glScore = long(lsMeuPontos)
glForce = li_displayrank
gsAto = "D"
glContar++
end event

type cb_ataque from commandbutton within w_main
integer x = 3630
integer y = 1336
integer width = 311
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Ataque"
end type

event clicked;long li_displayrank
String lsMeuPontos

li_displayrank = uo_swap.uo_57.iiAtaque
lsMeuPontos = sle_myscore.Text


if uf_SendCom("#GAME#"+lsMeuPontos+"#A#" + right("0000"+string(li_displayrank),4) + "#" + gsPlayer + "#" + right("00"+string(uo_swap.uo_57.ii_rank),2) ) then
   cb_defesa.enabled = false
   cb_ataque.enabled = False
end if

glScore = long(lsMeuPontos)
glForce = li_displayrank
gsAto = "A"

glContar++
end event

type uo_target from u_target within w_main
integer x = 4151
integer y = 320
integer width = 837
integer height = 1048
integer taborder = 40
end type

on uo_target.destroy
call u_target::destroy
end on

type uo_swap from u_swap within w_main
integer x = 3186
integer y = 320
integer width = 873
integer height = 992
integer taborder = 40
end type

on uo_swap.destroy
call u_swap::destroy
end on

type cb_play from commandbutton within w_main
integer x = 2665
integer y = 508
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Play"
end type

event clicked;if not uf_SendCom('&PLAY&') then return
this.enabled = False
cb_defesa.enabled = False
cb_ataque.enabled = False
gnv_cards.of_start()

if  gsPlayer = "" then gsPlayer = gsJogador[1]
end event

type uo_source from u_source within w_main
integer y = 896
integer taborder = 20
end type

on uo_source.destroy
call u_source::destroy
end on

type cbx_setunicode from checkbox within w_main
integer x = 37
integer y = 36
integer width = 699
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Send/Receive Unicode"
end type

event clicked;gn_ws.of_SetUnicode(this.checked,this.checked)

end event

type st_3 from statictext within w_main
integer x = 914
integer y = 36
integer width = 320
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Host Name:"
boolean focusrectangle = false
end type

type st_hostname from statictext within w_main
integer x = 1243
integer y = 36
integer width = 443
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean focusrectangle = false
end type

type st_8 from statictext within w_main
integer x = 1719
integer y = 36
integer width = 320
integer height = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "IP Address:"
boolean focusrectangle = false
end type

type st_ipaddress from statictext within w_main
integer x = 2048
integer y = 36
integer width = 443
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean focusrectangle = false
end type

