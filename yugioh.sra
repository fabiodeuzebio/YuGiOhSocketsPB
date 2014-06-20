HA$PBExportHeader$yugioh.sra
$PBExportComments$Generated Application Object
forward
global type yugioh from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
n_winsock gn_ws
n_cst_cards gnv_cards
string gsJogador[] = {"Player1","Player2"}
String gsPlayer

long glScore, glForce, glContar = 0
String gsAto
end variables

global type yugioh from application
string appname = "yugioh"
end type
global yugioh yugioh

on yugioh.create
appname="yugioh"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on yugioh.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// initialize Winsock
gn_ws.of_Startup()

gnv_cards = create n_cst_cards 
Open(w_main)
end event

event close;// Shutdown Winsock
gn_ws.of_Cleanup()
end event

