HA$PBExportHeader$n_winsock.sru
$PBExportComments$Winsock functions
forward
global type n_winsock from nonvisualobject
end type
type hostent from structure within n_winsock
end type
type in_addr from structure within n_winsock
end type
type sockaddr from structure within n_winsock
end type
type wsadata from structure within n_winsock
end type
type fd_set from structure within n_winsock
end type
type timeval from structure within n_winsock
end type
end forward

type hostent from structure
	unsignedlong		h_name
	unsignedlong		h_aliases
	integer		h_addrtype
	integer		h_length
	unsignedlong		h_addr_list
end type

type in_addr from structure
	unsignedlong		s_addr
end type

type sockaddr from structure
	integer		sin_family
	unsignedinteger		sin_port
	in_addr		sin_addr
	character		sin_zero[8]
end type

type wsadata from structure
	unsignedinteger		wversion
	unsignedinteger		whighversion
	character		szdescription[257]
	character		szsystemstatus[129]
	unsignedinteger		imaxsockets
	unsignedinteger		imaxudpdg
	unsignedlong		lpvenderinfo
end type

type fd_set from structure
	unsignedlong		fd_count
	unsignedlong		fd_array[]
end type

type timeval from structure
	unsignedlong		tv_sec
	unsignedlong		tv_usec
end type

global type n_winsock from nonvisualobject autoinstantiate
end type

type prototypes
Protected:

Subroutine CopyMemoryIP ( &
	Ref structure Destination, &
	ulong Source, &
	long Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory;Ansi"

Subroutine CopyMemoryIP ( &
	Ref blob Destination, &
	ulong Source, &
	long Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyMemoryIP ( &
	Ref ulong Destination, &
	ulong Source, &
	long Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory"

Function boolean CryptBinaryToString ( &
	Blob pbBinary, &
	ulong cbBinary, &
	ulong dwFlags, &
	Ref string pszString, &
	Ref ulong pcchString &
	) Library "crypt32.dll" Alias For "CryptBinaryToStringA;Ansi"

Function boolean CryptBinaryToString ( &
	Blob pbBinary, &
	ulong cbBinary, &
	ulong dwFlags, &
	ulong pszString, &
	Ref ulong pcchString &
	) Library "crypt32.dll" Alias For "CryptBinaryToStringW"

Function boolean CryptStringToBinary ( &
	string pszString, &
	ulong cchString, &
	ulong dwFlags, &
	Ref blob pbBinary, &
	Ref ulong pcbBinary, &
	Ref ulong pdwSkip, &
	Ref ulong pdwFlags &
	) Library "crypt32.dll" Alias For "CryptStringToBinaryA;Ansi"

Function ulong FormatMessage( &
	ulong dwFlags, &
	ulong lpSource, &
	ulong dwMessageId, &
	ulong dwLanguageId, &
	Ref string lpBuffer, &
	ulong nSize, &
	ulong Arguments &
	) Library "kernel32.dll" Alias For "FormatMessageA;Ansi"

Function ulong RegisterEventSource ( &
	ulong lpUNCServerName, &
	string lpSourceName &
	) Library "advapi32.dll" Alias For "RegisterEventSourceA;Ansi"

Function boolean ReportEvent ( &
	ulong hEventLog, &
	uint wType, &
	uint wCategory, &
	ulong dwEventID, &
	ulong lpUserSid, &
	uint wNumStrings, &
	ulong dwDataSize, &
	string lpStrings[], &
	ulong lpRawData &
	) Library "advapi32.dll" Alias For "ReportEventA;Ansi"

Function boolean DeregisterEventSource ( &
	ref ulong hEventLog &
	) Library "advapi32.dll"

Function ulong WNetGetUser ( &
	string lpname, &
	Ref string lpusername, &
	Ref ulong buflen &
	) Library "mpr.dll" Alias For "WNetGetUserA;Ansi"

// Winsock Functions

Function ulong accept ( &
	ulong socket, &
	Ref sockaddr addr, &
	Ref long addrlen &
	) Library "ws2_32.dll" alias for "accept;Ansi"

Function long bind ( &
	ulong socket, &
	sockaddr name, &
	long namelen &
	)  Library "ws2_32.dll" alias for "bind;Ansi"

Function long closesocket ( &
	ulong socket &
	) Library "ws2_32.dll"

Function long connect_ws ( &
	ulong socket, &
	sockaddr name, &
	long namelen &
	) Library "ws2_32.dll" Alias For "connect;Ansi"

Function ulong gethostbyaddr ( &
	Ref ulong addr, &
	long len, &
	long htype &
	) Library "ws2_32.dll"

Function long gethostname ( &
	Ref string name, &
	long namelen &
	) Library "ws2_32.dll" alias for "gethostname;Ansi"

Function ulong gethostbyname ( &
	string name &
	) Library "ws2_32.dll" alias for "gethostbyname;Ansi"

Function long getpeername ( &
	ulong socket, &
	Ref sockaddr name, &
	Ref long namelen &
	) Library "ws2_32.dll" alias for "getpeername;Ansi"

Function long getsockopt ( &
	ulong socket, &
	long level, &
	long optname, &
	ref long optval, &
	ref long optlen &
	) Library "ws2_32.dll"  

Function ulong htonl ( &
	ulong hostulong &
	) Library "ws2_32.dll"  

Function uint htons ( &
	uint hostshort &
	) Library "ws2_32.dll"  

Function ulong inet_addr ( &
	string cp &
	) Library "ws2_32.dll" alias for "inet_addr;Ansi"

Function string inet_ntoa ( &
	ulong sin_addr &
	) Library "ws2_32.dll" alias for "inet_ntoa;Ansi"

Function long ioctlsocket ( &
	ulong socket, &
	ulong cmd, &
	ref ulong argp &
	) Library "ws2_32.dll"

Function ulong ntohl ( &
	ulong netlong &
	) Library "ws2_32.dll"

Function long listen ( &
	ulong socket, &
	long backlog &
	) Library "ws2_32.dll"  

Function long recv ( &
	ulong socket, &
	Ref blob buf, &
	long len, &
	long flags &
	) Library "ws2_32.dll"  

Function long recvfrom ( &
	ulong socket, &
	Ref blob buf, &
	long len, &
	long flags, &
	Ref sockaddr fromaddr, &
	Ref long fromlen &
	)  Library "ws2_32.dll" alias for "recvfrom;Ansi"

Function long select_ws ( &
	long socket, &
	Ref fd_set readfds, &
	Ref fd_set writefds, &
	Ref fd_set exceptfds, &
	timeval timeout &
	) Library "ws2_32.dll" Alias For "select;Ansi"

Function long send ( &
	ulong socket, &
	Ref blob buf, &
	long len, &
	long flags &
	) Library "ws2_32.dll"  

Function long sendto ( &
	ulong socket, &
	blob buf, &
	long len, &
	long flags, &
	sockaddr toaddr, &
	long tolen &
	)  Library "ws2_32.dll" alias for "sendto;Ansi"

Function long setsockopt ( &
	ulong socket, &
	long level, &
	long optname, &
	Ref boolean optval, &
	Ref long optlen &
	) Library "ws2_32.dll"

Function ulong socket ( &
	long af, &
	long ttype, &
	long protocol &
	) Library "ws2_32.dll"

Function long WSACleanup ( &
	) Library "ws2_32.dll"

Function long WSAGetLastError ( &
	) Library "ws2_32.dll"  

Subroutine WSASetLastError ( &
	long iErrorNum &
	) Library "ws2_32.dll"  

Function long WSAStartup ( &
	ulong wVersionRequested, &
	Ref WSADATA lpWSAData &
	) Library "ws2_32.dll" alias for "WSAStartup;Ansi"

Function long WSAAsyncSelect ( &
	ulong socket, &
	long hWnd, &
	ulong wMsg, &
	long lEvent &
	) Library "ws2_32.dll"  

Function long WSAAddressToString ( &
	sockaddr lpsaAddress, &
	long dwAddressLength, &
	ulong lpProtocolInfo, &
	Ref string lpszAddressString, &
	Ref long lpdwAddressStringLength &
	) Library "ws2_32.dll"  Alias For "WSAAddressToStringA;Ansi"

end prototypes

type variables
Private:
WSADATA istr_wsadata

Protected:
Boolean ib_initialized = False
Boolean ib_send_unicode = False
Boolean ib_recv_unicode = False
String is_lasterror

Public:
Constant ULong INVALID_SOCKET = 4294967295
Constant ULong INADDR_ANY = 0
Constant ULong CRYPT_STRING_BASE64 = 1
Constant Long SOCKET_ERROR = -1
Constant Long MAXGETSOCKADDRSTRUCT = 16
Constant Long AF_INET = 2
Constant Long SOMAXCONN = 2147483647
Constant Long SOCK_STREAM = 1
Constant Long SOCK_DGRAM = 2
Constant Long IPPROTO_TCP = 6
Constant Long IPPROTO_UDP = 17
Constant Long FD_READ		= 1
Constant Long FD_WRITE		= 2
Constant Long FD_OOB			= 4
Constant Long FD_ACCEPT		= 8
Constant Long FD_CONNECT	= 10
Constant Long FD_CLOSE		= 32
Constant Integer iERROR = 1
Constant Integer iWARN	= 2
Constant Integer iINFO	= 4

end variables

forward prototypes
public function unsignedlong of_accept (unsignedlong aul_socket)
public function boolean of_cleanup ()
public function boolean of_close (ref unsignedlong aul_socket)
public function unsignedlong of_connect (string as_hostname, unsignedinteger aui_port)
public function unsignedlong of_connect (string as_hostname, unsignedinteger aui_port, unsignedlong aul_seconds)
public subroutine of_eventlog (integer ai_msglevel, string as_msgtext)
public function string of_getdescription ()
public function string of_gethostname ()
public function string of_gethostname (string as_ipaddress)
public function string of_getipaddress (string as_hostname)
public function string of_getlasterror ()
public function string of_getpeername (unsignedlong aul_socket)
public function long of_getsockopt (unsignedlong aul_socket, string as_optname)
public function string of_getuserid ()
public function boolean of_ioctlsocket (unsignedlong aul_socket, string as_cmdname, ref unsignedlong aul_argp)
public subroutine of_jaguarlog (integer ai_msglevel, string as_msgtext)
public function unsignedlong of_listen (unsignedinteger aui_port)
public function unsignedlong of_listen (unsignedinteger aui_port, long al_handle, integer ai_event)
public subroutine of_messagebox (integer ai_msglevel, string as_msgtext)
public function boolean of_recv (unsignedlong aul_socket, ref blob ablob_data)
public function boolean of_recv (unsignedlong aul_socket, ref string as_data)
public function boolean of_recvfrom (unsignedinteger aui_port, ref blob ablob_data, ref string as_ipaddress)
public function boolean of_recvfrom (unsignedinteger aui_port, ref string as_data, ref string as_ipaddress)
public function boolean of_send (unsignedlong aul_socket, blob ablob_data)
public function boolean of_send (unsignedlong aul_socket, string as_data)
public function boolean of_setblockingmode (unsignedlong aul_socket, boolean ab_blocking)
public subroutine of_setlasterror (string as_lasterror)
public function boolean of_setsockopt (unsignedlong aul_socket, string as_optname, boolean ab_optvalue)
public subroutine of_setunicode (boolean ab_send, boolean ab_recv)
public function boolean of_startup ()
public function blob of_decode64 (readonly string as_encoded)
public function string of_encode64 (readonly blob ablob_data)
public function string of_encode64 (readonly string as_data)
public function long of_parse (readonly string as_string, readonly string as_separator, ref string as_outarray[])
public function boolean of_sendto (string as_ipaddress, unsignedinteger aui_fromport, unsignedinteger aui_sendport, blob ablob_data)
public function boolean of_sendto (string as_ipaddress, unsignedinteger aui_fromport, unsignedinteger aui_sendport, string as_data)
public function boolean of_sendto (string as_ipaddress, unsignedinteger aui_sendport, blob ablob_data)
public function boolean of_sendto (string as_ipaddress, unsignedinteger aui_sendport, string as_data)
end prototypes

public function unsignedlong of_accept (unsignedlong aul_socket);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Accept
//
// PURPOSE:    This function permits an incoming connection
//					attempt on a socket.
//
// ARGUMENTS:  aul_socket		- Open socket
//
// RETURN:      0 = Error
//					>0 = Success ( a valid socket )
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

SOCKADDR lstr_sockaddr
Long lul_socket
Long ll_length

ll_length = MAXGETSOCKADDRSTRUCT

lstr_sockaddr.sin_zero[8] = ""

lul_socket = accept(aul_socket, lstr_sockaddr, ll_length)
If lul_socket = INVALID_SOCKET Then
	Return 0
End If

Return lul_socket

end function

public function boolean of_cleanup ();// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Cleanup
//
// PURPOSE:    This function terminates use of the socket library.
//
// RETURN:     True  = Success
//					False = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

If Not ib_initialized Then
	If WSACleanup() = 0 Then
		ib_initialized = False
	Else
		Return False
	End If
End If

Return True

end function

public function boolean of_close (ref unsignedlong aul_socket);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Close
//
// PURPOSE:    This function closes an open socket.
//
// ARGUMENTS:  aul_socket - Open socket
//
// RETURN:     True  = Success
//					False = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Long ll_rc

If aul_socket <> 0 Then
	ll_rc = closesocket(aul_socket)
	If ll_rc = 0 Then
		aul_socket = 0
	Else
		Return False
	End If
End If

Return True

end function

public function unsignedlong of_connect (string as_hostname, unsignedinteger aui_port);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Connect
//
// PURPOSE:    This function opens a socket for sending data.
//
// ARGUMENTS:  as_hostname - Hostname
//					aui_port		- Port
//
// RETURN:      0 = Error
//					>0 = Success ( a valid socket )
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 09/16/2010	RolandS		Changed Port to unsignedinteger
// 09/16/2010	RolandS		Changed to feed new of_Connect with Timeout argument.
// -----------------------------------------------------------------------------

Return of_Connect(as_hostname, aui_port, 0)

end function

public function unsignedlong of_connect (string as_hostname, unsignedinteger aui_port, unsignedlong aul_seconds);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Connect
//
// PURPOSE:    This function opens a socket for sending data. If a Timeout
//					value is given, it is used to wait for the connection.
//
// ARGUMENTS:  as_hostname - Hostname
//					aui_port		- Port
//					aul_seconds	- Timeout in seconds
//
// RETURN:      0 = Error
//					>0 = Success ( a valid socket )
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 09/16/2010	RolandS		Added Timeout processing
// 09/16/2010	RolandS		Changed Port to unsignedinteger
// -----------------------------------------------------------------------------

HOSTENT lstr_hostent
SOCKADDR lstr_sockaddr
TIMEVAL lstr_timeval
FD_SET lstr_read, lstr_write, lstr_except
ULong lul_socket, lul_ptr, lul_ipaddr
Long ll_rc

// get information about host
lul_ptr = gethostbyname(as_hostname)

If lul_ptr > 0 Then
	// initialize the SOCKADDR structure
	CopyMemoryIp(lstr_hostent, lul_ptr, MAXGETSOCKADDRSTRUCT)
	CopyMemoryIp(lul_ipaddr, lstr_hostent.h_Addr_List, lstr_hostent.h_Length)
	CopyMemoryIp(lstr_sockaddr.sin_addr, lul_ipaddr, lstr_hostent.h_Length)
	lstr_sockaddr.sin_family = AF_INET
	lstr_sockaddr.sin_port = htons(aui_port)
	// create socket
	lul_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
	If lul_socket = INVALID_SOCKET Then
		lul_socket = 0
	Else
		If aul_seconds = 0 Then
			// connect on the socket
			ll_rc = connect_ws(lul_socket, lstr_sockaddr, MAXGETSOCKADDRSTRUCT)
			If ll_rc = SOCKET_ERROR Then
				// some error occurred
				of_SetLastError(of_GetLastError())
				of_Close(lul_socket)
			End if
		Else
			// make the socket non blocking
			of_SetBlockingMode(lul_socket, False)
			// attempt to connect on the socket
			ll_rc = connect_ws(lul_socket, lstr_sockaddr, MAXGETSOCKADDRSTRUCT)
			If ll_rc = SOCKET_ERROR Then
				// initialize the structures
				lstr_timeval.tv_sec = aul_seconds
				lstr_write.fd_count = 1
				lstr_write.fd_array[1] = lul_socket
				// wait for the timeout
				ll_rc = select_ws(0, lstr_read, lstr_write, lstr_except, lstr_timeval)
				choose case ll_rc
					case 0
						// the timeout expired
						of_SetLastError("Expirou o tempo de tentativa de  conex$$HEX1$$e300$$ENDHEX$$o.")
						of_Close(lul_socket)
					case SOCKET_ERROR
						// some error occurred
						of_SetLastError(of_GetLastError())
						of_Close(lul_socket)
					case else
						// the connection was made so make the socket blocking
						of_SetBlockingMode(lul_socket, True)
				end choose
			End if
		End if
	End If
Else
	lul_socket = 0
End If

Return lul_socket

end function

public subroutine of_eventlog (integer ai_msglevel, string as_msgtext);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_EventLog
//
// PURPOSE:    This function writes a message to the Event Log.
//
// ARGUMENTS:  ai_msglevel	- The level of message importance
//					as_msgtext	- The text of the message
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

ULong lul_EventSource
String ls_errmsg[]

ls_errmsg[1] = as_msgtext

lul_EventSource = RegisterEventSource(0, this.ClassName())

If lul_EventSource > 0 Then
	ReportEvent(lul_EventSource, ai_msglevel, &
			0, 0, 0, UpperBound(ls_errmsg), 0, ls_errmsg, 0)
	DeregisterEventSource(lul_EventSource)
End If

end subroutine

public function string of_getdescription ();// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_GetDescription
//
// PURPOSE:    This function returns the winsock description.
//
// RETURN:     String containing a description of the
//					winsock library.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Blob lblob_desc

lblob_desc = Blob(istr_wsadata.szDescription)

Return String(lblob_desc)

end function

public function string of_gethostname ();// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_GetHostName
//
// PURPOSE:		This function retrieves the standard host name
//					for the local computer.
//
// RETURN:		Host name
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_hostname, ls_errmsg
Long ll_rc, ll_namelen

ll_namelen = 50
ls_hostname = Space(ll_namelen)

ll_rc = gethostname(ls_hostname, ll_namelen)
If ll_rc = SOCKET_ERROR Then
	SetNull(ls_hostname)
End If

Return ls_hostname

end function

public function string of_gethostname (string as_ipaddress);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_GetHostName
//
// PURPOSE:		This function finds the host name that corresponds to the
//					specified IP Address.
//
// ARGUMENTS:	as_ipaddress	- IP Address of a server
//
// RETURN:		IP Address
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_hostname
ULong lul_address, lul_ptr
Blob lblb_host
HOSTENT lstr_host

lul_address = inet_addr(as_ipaddress)
If lul_address > 0 Then
	// get information about host
	lul_ptr = gethostbyaddr(lul_address, 4, AF_INET)
	If lul_ptr > 0 Then
		// copy structure to local structure
		CopyMemoryIP(lstr_host, lul_ptr, 16)
		// copy ipaddress to local blob
		lblb_host = Blob(Space(250))
		CopyMemoryIP(lblb_host, lstr_host.h_name, 250)
		ls_hostname = String(lblb_host)
	Else
		SetNull(ls_hostname)
	End If
Else
	SetNull(ls_hostname)
End If

Return ls_hostname

end function

public function string of_getipaddress (string as_hostname);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_GetIPAddress
//
// PURPOSE:		This function finds the IP address for the
//					specified host name.
//
// ARGUMENTS:	as_hostname	- host name of a server
//
// RETURN:		IP Address
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_ipaddress
HOSTENT lstr_host
ULong lul_ptr, lul_ipaddr
IN_ADDR lstr_addr

// get information about host
lul_ptr = gethostbyname(as_hostname)

If lul_ptr > 0 Then
	// copy structure to local structure
	CopyMemoryIP(lstr_host, lul_ptr, 16)
	// get memory address where ipaddress is located
	CopyMemoryIP(lul_ipaddr, lstr_host.h_addr_list, 4)
	CopyMemoryIP(lstr_addr, lul_ipaddr, 4)
	ls_ipaddress = String(Blob(inet_ntoa(lstr_addr.s_addr)))
Else
	SetNull(ls_ipaddress)
End If

Return ls_ipaddress

end function

public function string of_getlasterror ();// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_GetLastError
//
// PURPOSE:		This function returns the message text for
//					the most recent Winsock error.
//
// RETURN:		Error message
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 09/03/2010	RolandS		Changed 'if' to 'case' adding is_lasterror handling
// 06/01/2011	RolandS		Added code to remove trailing CRLF
// -----------------------------------------------------------------------------

Constant ULong FORMAT_MESSAGE_FROM_SYSTEM = 4096
Constant ULong LANG_NEUTRAL = 0
String ls_errmsg
Long ll_error

ll_error = WSAGetLastError()

choose case ll_error
	case 0
		If is_lasterror = "" Then
			ls_errmsg = "An unknown error has occurred!"
		Else
			ls_errmsg = is_lasterror
		End If
	case else
		ls_errmsg = Space(250)
		FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, 0, &
					ll_error, LANG_NEUTRAL, ls_errmsg, Len(ls_errmsg), 0)
		If Right(ls_errmsg, 2) = "~r~n" Then
			ls_errmsg = Left(ls_errmsg, Len(ls_errmsg) - 2)
		End If
end choose

WSASetLastError(0)

Return Trim(ls_errmsg)

end function

public function string of_getpeername (unsignedlong aul_socket);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_GetPeerName
//
// PURPOSE:    This function returns the IP Address of the computer on the
//					other end of the socket.
//
// ARGUMENTS:  aul_socket		- Open socket
//
// RETURN:     IP Address of Peer
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

SOCKADDR lstr_sockaddr
Long ll_length, ll_rtn, ll_pos, ll_strlen
String ls_ipaddress

ll_length = MAXGETSOCKADDRSTRUCT

lstr_sockaddr.sin_zero[8] = ""

ll_rtn = getpeername(aul_socket, lstr_sockaddr, ll_length)
If ll_rtn <> 0 Then
	SetNull(ls_ipaddress)
	Return ls_ipaddress
End If

// get the ip address in readable format
ll_strlen = 20
ls_ipaddress = Space(ll_strlen)
ll_rtn = WSAAddressToString(lstr_sockaddr, &
					ll_length, 0, ls_ipaddress, ll_strlen)
If ll_rtn <> 0 Then
	SetNull(ls_ipaddress)
	Return ls_ipaddress
End If

// separate address & port
ll_pos = Pos(ls_ipaddress, ":")
ls_ipaddress = Left(ls_ipaddress, ll_pos - 1)

Return ls_ipaddress

end function

public function long of_getsockopt (unsignedlong aul_socket, string as_optname);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_GetSockOpt
//
// PURPOSE:    This function returns options that use long datatype.
//
// ARGUMENTS:  aul_socket	- Open socket
//					as_optname	- Option name
//
// RETURN:		Option value
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Constant Long SOL_SOCKET = 65535
Long ll_optname, ll_optvalue, ll_buflen

ll_buflen = 4

choose case Upper(as_optname)
	case "SO_ERROR"
		ll_optname = 4103
	case "SO_RCVBUF"
		ll_optname = 4098
	case "SO_SNDBUF"
		ll_optname = 4097
	case "SO_TYPE"
		ll_optname = 4104
	case else
		Return SOCKET_ERROR
end choose

// get option value
If getsockopt(aul_socket, SOL_SOCKET, &
				ll_optname, ll_optvalue, ll_buflen) = 0 Then
	Return ll_optvalue
Else
	Return SOCKET_ERROR
End If

end function

public function string of_getuserid ();// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_GetUserid
//
// PURPOSE:		This function retrieves the userid used to establish
//					the current network connection.
//
// RETURN:		The userid or null string if error occurred.
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_userid
ULong lul_result, lul_buflen

lul_buflen = 32
ls_userid = Space(lul_buflen)

lul_result = WNetGetUser("", ls_userid, lul_buflen)
If lul_result <> 0 Then
	SetNull(ls_userid)
End If

Return ls_userid

end function

public function boolean of_ioctlsocket (unsignedlong aul_socket, string as_cmdname, ref unsignedlong aul_argp);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_IoctlSocket
//
// PURPOSE:    This function controls the I/O mode of a socket.
//
// ARGUMENTS:  aul_socket	- Open socket
//					as_cmdname	- Which command to execute
//					aul_argp		- Input/Output parm
//
//					For FIONBIO:
//							aul_argp  = 0 - Set Blocking mode
//							aul_argp <> 0 - Set Nonblocking mode
//
//					For FIONREAD:
//							aul_argp - returns the amount of data avail to recv
//
// RETURN:		True=Success
//					False=Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

// #define FIONREAD _IOR('f', 127, u_long) /* get # bytes to read */
// #define FIONBIO  _IOW('f', 126, u_long) /* set/clear non-blocking i/o */
// #define FIOASYNC _IOW('f', 125, u_long) /* set/clear async i/o */

Constant ulong FIONBIO    = 2147772030   // &H8004667E
Constant ulong FIONREAD   = 1074030207   // &H4004667F
Constant ulong SIOCATMARK = 1074033415   // &H40047307

Long ll_result
ULong lul_cmd

choose case Upper(as_cmdname)
	case "FIONBIO"
		lul_cmd = FIONBIO
	case "FIONREAD"
		lul_cmd = FIONREAD
	case "SIOCATMARK"
		lul_cmd = SIOCATMARK
	case else
		Return False
end choose

ll_result = ioctlsocket(aul_socket, lul_cmd, aul_argp)
If ll_result = SOCKET_ERROR Then
	Return False
End If

Return True

end function

public subroutine of_jaguarlog (integer ai_msglevel, string as_msgtext);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_JaguarLog
//
// PURPOSE:    This function writes a message to the Jaguar Log.
//
// ARGUMENTS:  ai_msglevel	- The level of message importance
//					as_msgtext	- The text of the message
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

String ls_msg
TransactionServer lts_jag
ErrorLogging lel_jag

// get reference to transaction service
GetContextService("TransactionServer", lts_jag)

// get reference to error logging service
GetContextService("ErrorLogging", lel_jag)

// build message text
choose case ai_msglevel
	case iERROR
		ls_msg = this.ClassName() + " (Error)->" + as_msgtext
	case iWARN
		ls_msg = this.ClassName() + " (Warning)->" + as_msgtext
	case else
		ls_msg = this.ClassName() + " (Info)->" + as_msgtext
end choose

// log message to server log
lel_jag.Log(ls_msg)

end subroutine

public function unsignedlong of_listen (unsignedinteger aui_port);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Listen
//
// PURPOSE:    This function opens a socket and Listens.
//
// ARGUMENTS:  aui_port	 - Port number
//
// RETURN:      0 = Error
//					>0 = Success ( a valid socket )
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 09/16/2010	RolandS		Changed Port to unsignedinteger
// -----------------------------------------------------------------------------

HOSTENT lstr_hostent
SOCKADDR lstr_sockaddr
String ls_hostname
ULong lul_socket, lul_ptr, lul_ipaddr

// get information about host
ls_hostname = of_GetHostname()
lul_ptr = gethostbyname(ls_hostname)

If lul_ptr > 0 Then
	// initialize structure
	CopyMemoryIp(lstr_hostent, lul_ptr, MAXGETSOCKADDRSTRUCT)
	CopyMemoryIp(lul_ipaddr, lstr_hostent.h_Addr_List, lstr_hostent.h_Length)
	CopyMemoryIp(lstr_sockaddr.sin_addr, lul_ipaddr, lstr_hostent.h_Length)
	lstr_sockaddr.sin_family = AF_INET
	lstr_sockaddr.sin_port = htons(aui_port)
	// create socket
	lul_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
	// bind the socket to an IP Address and Port
	If bind(lul_socket, lstr_sockaddr, MAXGETSOCKADDRSTRUCT) = SOCKET_ERROR Then
		lul_socket = 0
	Else
		// put the socket into Listen mode
		If listen(lul_socket, SOMAXCONN) = SOCKET_ERROR Then
			lul_socket = 0
		End If
	End If
Else
	lul_socket = 0
End If

Return lul_socket

end function

public function unsignedlong of_listen (unsignedinteger aui_port, long al_handle, integer ai_event);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Listen
//
// PURPOSE:    This function opens a socket and Listens. An event will be
//					triggered when a connection request is detected.
//
// ARGUMENTS:  aui_port	 - Port number
//					al_handle - Handle of object to receive messages
//					ai_event  - pbm_customxx event to receive messages
//
// RETURN:      0 = Error
//					>0 = Success ( a valid socket )
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 09/16/2010	RolandS		Changed Port to unsignedinteger
// -----------------------------------------------------------------------------

Constant Integer WM_USER = 1024
HOSTENT lstr_hostent
SOCKADDR lstr_sockaddr
String ls_hostname
ULong lul_socket, lul_ptr, lul_ipaddr
Long ll_wsevent

// get information about host
ls_hostname = of_GetHostname()
lul_ptr = gethostbyname(ls_hostname)

If lul_ptr > 0 Then
	// initialize structure
	CopyMemoryIp(lstr_hostent, lul_ptr, MAXGETSOCKADDRSTRUCT)
	CopyMemoryIp(lul_ipaddr, lstr_hostent.h_Addr_List, lstr_hostent.h_Length)
	CopyMemoryIp(lstr_sockaddr.sin_addr, lul_ipaddr, lstr_hostent.h_Length)
	lstr_sockaddr.sin_family = AF_INET
	lstr_sockaddr.sin_port = htons(aui_port)
	// create socket
	lul_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
	// bind the socket to an IP Address and Port
	If bind(lul_socket, lstr_sockaddr, MAXGETSOCKADDRSTRUCT) = SOCKET_ERROR Then
		lul_socket = 0
	Else
		ll_wsevent = FD_ACCEPT + FD_READ
		// set Window handle and Event for notification
		If WSAASyncSelect(lul_socket, al_handle, &
				WM_USER + (ai_event - 1), ll_wsevent) = SOCKET_ERROR Then
			lul_socket = 0
		Else
			// put the socket into Listen mode
			If listen(lul_socket, SOMAXCONN) = SOCKET_ERROR Then
				lul_socket = 0
			End If
		End If
	End If
Else
	lul_socket = 0
End If

Return lul_socket

end function

public subroutine of_messagebox (integer ai_msglevel, string as_msgtext);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_MessageBox
//
// PURPOSE:    This function displays a messagebox.
//
// ARGUMENTS:  ai_msglevel	- The level of message importance
//					as_msgtext	- The text of the message
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

choose case ai_msglevel
	case iERROR
		MessageBox(	"Winsock Error", &
					as_msgtext, StopSign!)
	case iWARN
		MessageBox(	"Winsock Warning", &
					as_msgtext, Exclamation!)
	case else
		MessageBox(	"Winsock Message", &
					as_msgtext, Information!)
end choose

end subroutine

public function boolean of_recv (unsignedlong aul_socket, ref blob ablob_data);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Recv
//
// PURPOSE:    This function receives data from a connected socket.
//
// ARGUMENTS:  aul_socket	- Open socket
//					ablob_data	- By ref blob
//
// RETURN:     True  = Success
//					False = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Long ll_bytes, ll_MaxBuffer
Blob lblob_data

ll_MaxBuffer = of_GetSockOpt(aul_socket, "SO_RCVBUF")

ll_bytes = ll_MaxBuffer

do while ll_bytes = ll_MaxBuffer
	lblob_data = Blob(Space(ll_MaxBuffer))
	ll_bytes = recv(aul_socket, lblob_data, ll_MaxBuffer, 0)
	If ll_bytes = SOCKET_ERROR Then
		SetNull(ablob_data)
		Return False
	Else
		ablob_data += BlobMid(lblob_data, 1, ll_bytes)
	End If
loop

Return True

end function

public function boolean of_recv (unsignedlong aul_socket, ref string as_data);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Recv
//
// PURPOSE:    This function receives data from a connected socket.
//
// ARGUMENTS:  aul_socket	- Open socket
//					as_data		- By ref string
//
// RETURN:     True  = Success
//					False = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Blob lblob_data

If of_Recv(aul_socket, lblob_data) Then
	If ib_recv_unicode Then
		as_data = String(lblob_data,EncodingUTF16LE!)
	Else
		as_data = String(lblob_data)
	End If
Else
	SetNull(as_data)
	Return False
End If

Return True

end function

public function boolean of_recvfrom (unsignedinteger aui_port, ref blob ablob_data, ref string as_ipaddress);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_RecvFrom
//
// PURPOSE:		This function receives a UDP packet.
//
// ARGUMENTS:  aui_port			- The port to receive the packet on
//					ablob_data		- Buffer to hold the data (by ref)
//					as_ipaddress	- Sending IP Address (by ref)
//
// RETURN:     True  = Success
//					False = Error
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

SOCKADDR lstr_RecvAddr, lstr_SenderAddr
ULong lul_RecvSocket, lul_ipaddr
Long ll_bytes, ll_BufLen, ll_SenderAddrSize
String ls_ipaddress, ls_part[]

ll_SenderAddrSize = MAXGETSOCKADDRSTRUCT

ll_BufLen = Len(ablob_data)

lul_RecvSocket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)

lstr_RecvAddr.sin_family = AF_INET
lstr_RecvAddr.sin_port = htons(aui_port)
lstr_RecvAddr.sin_addr.s_addr = htonl(INADDR_ANY)

bind(lul_RecvSocket, lstr_RecvAddr, MAXGETSOCKADDRSTRUCT)

ll_bytes = recvfrom(lul_RecvSocket, ablob_data, ll_BufLen, &
						0, lstr_SenderAddr, ll_SenderAddrSize);
If ll_bytes = SOCKET_ERROR Then
	closesocket(lul_RecvSocket)
	Return False
Else
	// trim off trailing blanks
	ablob_data = BlobMid(ablob_data, 1, ll_bytes)
	// format incoming IP address
	lul_ipaddr = ntohl(lstr_SenderAddr.sin_addr.s_addr)
	ls_ipaddress = String(Blob(inet_ntoa(lul_ipaddr)))
	// reverse the order of the parts
	of_Parse(ls_ipaddress, ".", ls_part)
	as_ipaddress = ls_part[4] + "." + ls_part[3] + "." + &
						ls_part[2] + "." + ls_part[1]
End If

closesocket(lul_RecvSocket)

Return True

end function

public function boolean of_recvfrom (unsignedinteger aui_port, ref string as_data, ref string as_ipaddress);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_RecvFrom
//
// PURPOSE:		This function receives a UDP packet.
//
// ARGUMENTS:  aui_port			- The port to receive the packet on
//					as_data			- Buffer to hold the data (by ref)
//					as_ipaddress	- Sending IP Address (by ref)
//
// RETURN:     True  = Success
//					False = Error
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Blob lblob_data

lblob_data = Blob(as_data)

If of_RecvFrom(aui_port, lblob_data, as_ipaddress) Then
	If ib_recv_unicode Then
		as_data = String(lblob_data,EncodingUTF16LE!)
	Else
		as_data = String(lblob_data)
	End If
Else
	SetNull(as_data)
	Return False
End If

Return True

end function

public function boolean of_send (unsignedlong aul_socket, blob ablob_data);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Send
//
// PURPOSE:    This function sends data on a connected socket.
//
// ARGUMENTS:  aul_socket	- Open socket
//					ablob_data	- Data to send
//
// RETURN:     True  = Success
//					False = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Blob lblob_data
Long ll_MaxBuffer, ll_totbytes, ll_length, ll_sendlen, ll_rc

ll_MaxBuffer = of_GetSockOpt(aul_socket, "SO_SNDBUF")

ll_length = Len(ablob_data)

do while ll_totbytes < ll_length
	lblob_data = BlobMid(ablob_data, ll_totbytes + 1, ll_MaxBuffer)
	ll_sendlen = Len(lblob_data)
	ll_totbytes += ll_sendlen
	ll_rc = send(aul_socket, lblob_data, ll_sendlen, 0)
	If ll_rc = SOCKET_ERROR Then
		Return False
	End If
loop

Return True

end function

public function boolean of_send (unsignedlong aul_socket, string as_data);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Send
//
// PURPOSE:    This function sends data on a connected socket.
//
// ARGUMENTS:  aul_socket	- Open socket
//					as_data		- Data to send
//
// RETURN:     True  = Success
//					False = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Blob lblb_data

If ib_send_unicode Then
	lblb_data = Blob(as_data,EncodingUTF16LE!)
Else
	lblb_data = Blob(as_data)
End If

Return of_Send(aul_socket, lblb_data)

end function

public function boolean of_setblockingmode (unsignedlong aul_socket, boolean ab_blocking);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_SetBlockingMode
//
// PURPOSE:    This function changes the blocking mode of a socket.
//
// ARGUMENTS:  aul_socket	- Open socket
//					ab_blocking	- True=Blocking, False=NonBlocking
//
// RETURN:		True=Success
//					False=Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

ULong lul_ioctl

If ab_blocking Then
	lul_ioctl = 0	// make the socket blocking
Else
	lul_ioctl = 1	// make the socket non-blocking
End If

Return of_IoctlSocket(aul_socket, "FIONBIO", lul_ioctl)

end function

public subroutine of_setlasterror (string as_lasterror);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_SetLastError
//
// PURPOSE:		This function sets the last error code so that the
//					of_GetLastError function will display the passed message.
//
// ARGUMENTS:  as_lasterror - Error message to save
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 09/03/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

is_lasterror = as_lasterror

WSASetLastError(0)

end subroutine

public function boolean of_setsockopt (unsignedlong aul_socket, string as_optname, boolean ab_optvalue);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_SetSockOpt
//
// PURPOSE:    This function sets options that use the boolean datatype.
//
// ARGUMENTS:  aul_socket	- Open socket
//					as_optname	- Option name
//					ab_optvalue	- Option value
//
// RETURN:     True  = Success
//					False = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

Constant Long SOL_SOCKET = 65535
Long ll_optname, ll_buflen
String ls_errmsg

ll_buflen = 1

choose case Upper(as_optname)
	case "SO_BROADCAST"
		ll_optname = 32
	case "SO_DEBUG"
		ll_optname = 1
	case "SO_DONTROUTE"
		ll_optname = 16
	case "SO_KEEPALIVE"
		ll_optname = 8
	case "SO_OOBINLINE"
		ll_optname = 256
	case "SO_REUSEADDR"
		ll_optname = 4
	case "SO_LINGER"
		ll_optname = 128
	case else
		Return False
end choose

// set option value
If setsockopt(aul_socket, SOL_SOCKET, &
				ll_optname, ab_optvalue, ll_buflen) = 0 Then
	Return True
Else
	Return False
End If

end function

public subroutine of_setunicode (boolean ab_send, boolean ab_recv);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_SetUnicode
//
// PURPOSE:    This function sets Unicode data option.
//
// ARGUMENTS:  ab_send - of_Send Unicode setting
//					ab_recv - of_Recv Unicode setting
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

ib_send_unicode = ab_send
ib_recv_unicode = ab_recv

end subroutine

public function boolean of_startup ();// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Startup
//
// PURPOSE:    This function initiates use of the socket library.
//
// RETURN:     True  = Success
//					False = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// -----------------------------------------------------------------------------

If Not ib_initialized Then
	If WSAStartup(257, istr_wsadata) = 0 Then
		ib_initialized = True
	Else
		Return False
	End If
End If

Return True

end function

public function blob of_decode64 (readonly string as_encoded);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Decode64
//
// PURPOSE:    This function converts a Base64 encoded string to binary.
//
//					Note: Requires Windows XP or Server 2003
//
// ARGUMENTS:  as_encoded - String containing encoded data
//
// RETURN:     Blob containing decoded data
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 03/17/2012	RolandS		Changed argument to read-only
// -----------------------------------------------------------------------------

Blob lblob_data
ULong lul_len, lul_buflen, lul_skip, lul_pflags
Boolean lb_rtn

lul_len = Len(as_encoded)
lul_buflen = lul_len
lblob_data = Blob(Space(lul_len))

lb_rtn = CryptStringToBinary(as_encoded, &
					lul_len, CRYPT_STRING_BASE64, lblob_data, &
					lul_buflen, lul_skip, lul_pflags)

Return BlobMid(lblob_data, 1, lul_buflen)

end function

public function string of_encode64 (readonly blob ablob_data);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Encode64
//
// PURPOSE:    This function converts binary data to a Base64 encoded string.
//
//					Note: Requires Windows XP or Server 2003 minimum
//
// ARGUMENTS:  ablob_data - Blob containing data
//
// RETURN:     String containing encoded data
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 09/27/2010	RolandS		Changed to remove trailing CRLF characters
// 03/17/2012	RolandS		Changed argument to read-only
// 01/19/2013	RolandS		Changed to use CryptBinaryToString to determine
//									output buffer size
// -----------------------------------------------------------------------------

String ls_encoded
ULong lul_len, lul_buflen
Boolean lb_rtn

lul_len = Len(ablob_data)

// determine size of the encoded buffer
lb_rtn = CryptBinaryToString(ablob_data, lul_len, &
					CRYPT_STRING_BASE64, 0, lul_buflen)

// allocate encoded buffer
ls_encoded = Space(lul_buflen)

// encode the binary data as Base64 string
lb_rtn = CryptBinaryToString(ablob_data, lul_len, &
					CRYPT_STRING_BASE64, ls_encoded, lul_buflen)
If lb_rtn Then
	ls_encoded = Left(ls_encoded, lul_buflen - 2)
Else
	SetNull(ls_encoded)
End If

Return ls_encoded

end function

public function string of_encode64 (readonly string as_data);// -----------------------------------------------------------------------------
// SCRIPT:     n_smtp.of_Encode64
//
// PURPOSE:    This function converts string to blob and
//					calls ancestor function.
//
// ARGUMENTS:  as_data - String containing data
//
// RETURN:     String containing encoded data
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 09/27/2010	RolandS		Initial coding
// 03/17/2012	RolandS		Changed argument to read-only
// -----------------------------------------------------------------------------

Return of_Encode64(Blob(as_data))

end function

public function long of_parse (readonly string as_string, readonly string as_separator, ref string as_outarray[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_winsock.of_Parse
//
// PURPOSE:    This function parses a string into an array.
//
// ARGUMENTS:  as_string		- The string to be separated
//					as_separate		- The separator characters
//					as_outarray		- By ref output array
//
//	RETURN:		The number of items in the array
//
// DATE        CHANGED BY	DESCRIPTION OF CHANGE / REASON
// ----------  ----------  -----------------------------------------------------
// 03/17/2012	RolandS		Rewritten based on an example by Mike Bartos
// -----------------------------------------------------------------------------

Long ll_PosEnd, ll_PosStart = 1, ll_SeparatorLen, ll_Counter = 1

If UpperBound(as_OutArray) > 0 Then as_OutArray = {""}

ll_SeparatorLen = Len(as_Separator)

ll_PosEnd = Pos(as_String, as_Separator, 1)

Do While ll_PosEnd > 0
	as_OutArray[ll_Counter] = Mid(as_String, ll_PosStart, ll_PosEnd - ll_PosStart)
	ll_PosStart = ll_PosEnd + ll_SeparatorLen
	ll_PosEnd = Pos(as_String, as_Separator, ll_PosStart)
	ll_Counter++
Loop

as_OutArray[ll_Counter] = Right(as_String, Len(as_String) - ll_PosStart + 1)

Return ll_Counter

end function

public function boolean of_sendto (string as_ipaddress, unsignedinteger aui_fromport, unsignedinteger aui_sendport, blob ablob_data);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_SendTo
//
// PURPOSE:		This function sends a UDP packet.
//
// ARGUMENTS:  as_ipaddress	- The IP Address to send to
//					aui_FromPort	- The Port to send data from
//					aui_SendPort	- The Port to send data to
//					ablob_data		- Data to be sent
//
// RETURN:     True  = Success
//					False = Error
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 05/23/2013	RolandS		Added FromPort and new overrides that default to zero
// -----------------------------------------------------------------------------

SOCKADDR lstr_FromAddr, lstr_SendAddr
ULong lul_SendSocket
Long ll_RecvAddrSize, ll_rc, ll_BufLen
String ls_errmsg

ll_RecvAddrSize = MAXGETSOCKADDRSTRUCT

ll_BufLen = Len(ablob_data)

lul_SendSocket = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)

If aui_FromPort > 0 Then
	lstr_FromAddr.sin_family = AF_INET
	lstr_FromAddr.sin_port = htons(aui_FromPort)
	bind(lul_SendSocket, lstr_FromAddr, MAXGETSOCKADDRSTRUCT)
End If

lstr_SendAddr.sin_family = AF_INET
lstr_SendAddr.sin_port = htons(aui_SendPort)
lstr_SendAddr.sin_addr.s_addr = inet_addr(as_ipaddress)

ll_rc = sendto(lul_SendSocket, ablob_data, ll_BufLen, &
				0, lstr_SendAddr, ll_RecvAddrSize)
If ll_rc = SOCKET_ERROR Then
	Return False
End If

closesocket(lul_SendSocket)

Return True

end function

public function boolean of_sendto (string as_ipaddress, unsignedinteger aui_fromport, unsignedinteger aui_sendport, string as_data);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_SendTo
//
// PURPOSE:		This function sends a UDP packet.
//
// ARGUMENTS:  as_ipaddress	- The IP Address to send to
//					aui_FromPort	- The Port to send data from
//					aui_SendPort	- The Port to send data to
//					as_data			- Data to be sent
//
// RETURN:     True  = Success
//					False = Error
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 05/23/2013	RolandS		Added FromPort and new overrides that default to zero
// -----------------------------------------------------------------------------

Blob lblb_data

If ib_send_unicode Then
	lblb_data = Blob(as_data,EncodingUTF16LE!)
Else
	lblb_data = Blob(as_data)
End If

Return of_SendTo(as_ipaddress, aui_fromport, aui_sendport, lblb_data)

end function

public function boolean of_sendto (string as_ipaddress, unsignedinteger aui_sendport, blob ablob_data);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_SendTo
//
// PURPOSE:		This function sends a UDP packet.
//
// ARGUMENTS:  as_ipaddress	- The IP Address to send to
//					aui_SendPort	- The Port to send data to
//					ablob_data		- Data to be sent
//
// RETURN:     True  = Success
//					False = Error
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 05/23/2013	RolandS		Added FromPort and new overrides that default to zero
// -----------------------------------------------------------------------------

Return of_SendTo(as_ipaddress, 0, aui_SendPort, ablob_data)

end function

public function boolean of_sendto (string as_ipaddress, unsignedinteger aui_sendport, string as_data);// -----------------------------------------------------------------------------
// FUNCTION:	n_winsock.of_SendTo
//
// PURPOSE:		This function sends a UDP packet.
//
// ARGUMENTS:  as_ipaddress	- The IP Address to send to
//					aui_SendPort	- The Port to send data to
//					as_data			- Data to be sent
//
// RETURN:     True  = Success
//					False = Error
//
// DATE			PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------	--------		-----------------------------------------------------
// 08/20/2010	RolandS		Initial coding
// 05/23/2013	RolandS		Added FromPort and new overrides that default to zero
// -----------------------------------------------------------------------------

Blob lblb_data

If ib_send_unicode Then
	lblb_data = Blob(as_data,EncodingUTF16LE!)
Else
	lblb_data = Blob(as_data)
End If

Return of_SendTo(as_ipaddress, 0, aui_sendport, lblb_data)

end function

on n_winsock.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_winsock.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

