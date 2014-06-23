HA$PBExportHeader$u_poker.sru
forward
global type u_poker from picture
end type
end forward

global type u_poker from picture
integer width = 686
integer height = 928
string pointer = "HyperLink!"
string picturename = "Nres\blank.png"
boolean border = true
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
event rbuttonup pbm_rbuttonup
event mousemove pbm_mousemove
end type
global u_poker u_poker

type variables
// poker self properties
string is_suit  //	 Clubs ,Diamonds,Hearts,Spades
integer ii_rank, ii_displayrank, iiDefesa, iiAtaque

// object properties
boolean ib_alwaysvisible 
u_poker iu_next, iu_prev  // neighbor
string is_type='source'  // source, swap,target
integer ii_nextcount
end variables

forward prototypes
public function integer of_highlight (integer ai_type)
public function integer of_set (integer ai_rank, boolean ai_visible)
public function integer of_set (integer ai_rank)
end prototypes

event rbuttonup;if is_type = 'source' then
if isnull(iu_next) or (not isvalid(iu_next)) then 
	gnv_cards.of_addtoswap(this)
	return
end if
	
if iu_next.ii_rank = 0 then 
	gnv_cards.of_addtoswap(this)
	return
end if
setposition(behind!,iu_next)
end if
end event

public function integer of_highlight (integer ai_type);choose case ai_type
	case 0
		if isnull(iu_next) or (not isvalid(iu_next)) then 
			gnv_cards.of_addtoswap(this)
			return 0
		end if
	
		if iu_next.ii_rank = 0 then 
			gnv_cards.of_addtoswap(this)
			return 0
		end if
		setposition(behind!,iu_next)
	case 1
		bringtotop= true
	case else	
		
end choose


return 1
end function

public function integer of_set (integer ai_rank, boolean ai_visible);visible = ai_visible
if ai_rank = 0 then 
		ii_rank = 0
		is_suit = ''
		picturename = 'Nres\blank.jpg'
		ii_displayrank = 0
else
		ii_rank = ai_rank
		picturename = 'Nres\'+string(ii_rank)+'.jpg'
		iiDefesa = gnv_cards. iiDefesaAtaque[ii_rank,1]
		iiAtaque = gnv_cards. iiDefesaAtaque[ii_rank,2]

		choose case mod(ai_rank,13)
			case 1 to 12
				ii_displayrank = mod(ai_rank,13)
			case 0
				ii_displayrank = 13
		end choose
			
		choose case int((ai_rank -1)/13)
			case 0
				is_suit = 	'Clubs'	
			case 1
				is_suit = 	'Diamonds'	
			
			case 2
				is_suit = 	'Hearts'	
				
			case 3
				is_suit = 	'Spades'	
			case else
		end choose	
		
end if

return 1
end function

public function integer of_set (integer ai_rank);return of_set(ai_rank,true)

end function

on u_poker.create
end on

on u_poker.destroy
end on

event doubleclicked;// count not response because dragauto
gnv_cards.ib_process = false
u_poker lu_source,lu_target
lu_source = this
if lu_source.is_type <> 'source' then return
	
int i,li_count
li_count  = upperbound(gnv_cards.iu_swap)
boolean lb_couldmove
for i = 1 to li_count
	if gnv_cards.iu_swap[i].ii_rank = 0 then
		lu_target = gnv_cards.iu_swap[i]
		lb_couldmove = true
		exit
	else
		lb_couldmove = false
	end if
next
if lb_couldmove then gnv_cards.of_move(lu_source,lu_target)
end event

event dragdrop;gnv_cards.ib_process = false
if source.tag = 'hint' then
	gnv_cards.of_hint(this)	
else
	u_poker lu_source,lu_target
	lu_source = source
	lu_target = this
	gnv_cards.of_move(lu_source,lu_target)
end if



end event

event rbuttondown;//gnv_cards.ii_batchcount = 0
//gnv_cards.of_batchcheck(this)
//messagebox('',gnv_cards.ii_batchcount)
//gnv_cards.of_addtoswap(this)
if is_type = 'source' then bringtotop= true

end event

event clicked;if gnv_cards.ib_process = false then	
	if this.is_type = 'source' and this.ii_displayrank > 0 then
		gnv_cards.ib_process = true
		gnv_cards.iu_movefrom = this
	end if	
else	
	if this.is_type = 'swap' then
		gnv_cards.ib_process = false
		gnv_cards.iu_moveto = this
		gnv_cards.of_move(gnv_cards.iu_movefrom,gnv_cards.iu_moveto)
	end if
end if	




end event

