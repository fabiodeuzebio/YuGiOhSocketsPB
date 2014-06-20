HA$PBExportHeader$u_tabpg.sru
$PBExportComments$Base tabpage object
forward
global type u_tabpg from userobject
end type
end forward

global type u_tabpg from userobject
integer width = 2962
integer height = 1408
long backcolor = 79416533
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_pagechanged ( integer oldindex )
end type
global u_tabpg u_tabpg

forward prototypes
public function string of_getreg (string as_entry, string as_default)
public subroutine of_setreg (string as_entry, string as_value)
end prototypes

public function string of_getreg (string as_entry, string as_default);String ls_regkey, ls_regvalue

ls_regkey = "HKEY_CURRENT_USER\Software\TopWiz\winsock"

RegistryGet(ls_regkey, as_entry, ls_regvalue)
If ls_regvalue = "" Then
	ls_regvalue = as_default
End If

Return ls_regvalue

end function

public subroutine of_setreg (string as_entry, string as_value);String ls_regkey

ls_regkey = "HKEY_CURRENT_USER\Software\TopWiz\winsock"

RegistrySet(ls_regkey, as_entry, as_value)

end subroutine

on u_tabpg.create
end on

on u_tabpg.destroy
end on

