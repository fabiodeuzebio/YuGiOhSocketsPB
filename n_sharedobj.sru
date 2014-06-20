HA$PBExportHeader$n_sharedobj.sru
forward
global type n_sharedobj from nonvisualobject
end type
end forward

global type n_sharedobj from nonvisualobject
end type
global n_sharedobj n_sharedobj

type prototypes
Function long SendStringMessage ( &
	long hWnd, &
	uint Msg, &
	Ref string wParam, &
	long lParam &
	) Library "user32.dll" Alias For "SendMessageA;Ansi"

end prototypes

type variables
n_winsock in_ws
Long il_handle
Integer ii_event

end variables

forward prototypes
public subroutine of_notify (string as_msg)
public subroutine of_register (long al_handle, integer ai_event)
public subroutine of_setunicode (boolean ab_send, boolean ab_recv)
public subroutine of_recvfrom (unsignedinteger aui_port, long al_buflen)
end prototypes

public subroutine of_notify (string as_msg);// -----------------------------------------------------------------------------
// SCRIPT:     n_sharedobj.of_Notify
//
// PURPOSE:    This function sends a string to the registered object.
//
// ARGUMENTS:  as_msg - String to send
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/21/2007	RolandS		Initial coding
// -----------------------------------------------------------------------------

SendStringMessage(il_handle, ii_event, as_msg, 0)

end subroutine

public subroutine of_register (long al_handle, integer ai_event);// -----------------------------------------------------------------------------
// SCRIPT:     n_sharedobj.of_Register
//
// PURPOSE:    This function saves pointers for sending data.
//
// ARGUMENTS:  al_handle - Handle of object to receive messages
//					ai_event  - pbm_customxx event to receive messages
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/21/2007	RolandS		Initial coding
// -----------------------------------------------------------------------------

Constant Integer WM_USER = 1024

il_handle = al_handle
ii_event = WM_USER + (ai_event - 1)

end subroutine

public subroutine of_setunicode (boolean ab_send, boolean ab_recv);// -----------------------------------------------------------------------------
// SCRIPT:     n_sharedobj.of_SetUnicode
//
// PURPOSE:    This function sets Unicode data option.
//
// ARGUMENTS:  ab_send - of_Send Unicode setting
//					ab_recv - of_Recv Unicode setting
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/27/2008	RolandS		Initial coding
// -----------------------------------------------------------------------------

in_ws.of_SetUnicode(ab_send, ab_recv)

end subroutine

public subroutine of_recvfrom (unsignedinteger aui_port, long al_buflen);// -----------------------------------------------------------------------------
// SCRIPT:     n_sharedobj.of_RecvFrom
//
// PURPOSE:    This function receives data via UDP protocol.
//
// ARGUMENTS:  aui_port		- Port to listen on
//					al_buflen	- Length of data buffer
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/21/2007	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_buffer, ls_ipaddress

in_ws.of_Startup()

do while True
	ls_buffer = Space(al_buflen)
	If in_ws.of_RecvFrom(aui_port, ls_buffer, ls_ipaddress) Then
		of_Notify(ls_buffer)
		If Lower(ls_buffer) = "stop" Then Exit
	Else
		of_Notify(in_ws.of_GetLastError())
		Exit
	End If
loop

in_ws.of_Cleanup()

end subroutine

on n_sharedobj.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_sharedobj.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

