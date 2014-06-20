HA$PBExportHeader$n_cst_cards.sru
forward
global type n_cst_cards from nonvisualobject
end type
end forward

global type n_cst_cards from nonvisualobject
end type
global n_cst_cards n_cst_cards

type variables
int i_card[8]

integer ii_batchcount
integer iiDefesaAtaque[64,2]
//integer ii_checkend = 4

u_poker iu_undofrom
u_poker iu_undoto
u_poker iu_swap[]
u_poker iu_target[]
u_poker iu_source[]

boolean ib_cheat

boolean ib_process  // false  choose source   true -- choose target and move

boolean ib_automove = true

u_poker iu_movefrom
u_poker iu_moveto


end variables

forward prototypes
public function integer of_batchcheck (u_poker au_source)
public function integer of_batchmove (u_poker au_source, u_poker au_target, integer ai_batchcount)
public subroutine of_undo (u_poker au_source, u_poker au_target)
public function integer of_checkrule (u_poker au_source, u_poker au_target)
public subroutine of_move (u_poker au_source, u_poker au_target)
public function integer of_addtoswap (u_poker au_source)
public function integer of_hint (u_poker au_poker)
public function integer of_start ()
public function integer of_resort ()
public function integer of_constructor ()
public function integer of_automove ()
public function integer of_getswapleft ()
public function integer of_warning (integer as_errnumber)
public function integer of_register (u_poker au_register, string as_type)
public function integer of_register (any au_register[], string as_type)
end prototypes

public function integer of_batchcheck (u_poker au_source);
if not isvalid(au_source.iu_next) or isnull(au_source.iu_next) then return 0
if au_source.iu_next.ii_rank = 0 then return 0

int i
u_poker lu_poker,lu_pokernext
lu_poker = au_source


if au_source.iu_next.ii_displayrank = au_source.ii_displayrank - 1 then
	choose case au_source.is_suit
		case 'Clubs','Spades'
			if au_source.iu_next.is_suit = 	'Diamonds' or au_source.iu_next.is_suit ='Hearts' then 
				ii_batchcount += 1
			else 
				ii_batchcount  = -1
				of_warning(-1)
				return -1
			end if
		case 'Diamonds','Hearts'
			if au_source.iu_next.is_suit = 	'Clubs' or au_source.iu_next.is_suit ='Spades' then 
				ii_batchcount += 1
			else 
				ii_batchcount  = -1
				of_warning(-1)
				return -1
			end if
	end choose	
else
	ii_batchcount  = -1
	of_warning(-1)
	return -1
end if

u_poker  lu_next
lu_next = au_source.iu_next
of_batchcheck(lu_next)


return 1
end function

public function integer of_batchmove (u_poker au_source, u_poker au_target, integer ai_batchcount);au_target.of_set(au_source.ii_rank)

integer li_displayrank,li_rank
li_rank = au_source.ii_rank
li_displayrank = au_source.ii_displayrank
		if au_source.is_type = 'target' then
			choose case li_displayrank 
				case 1 
					au_source.of_set(0,au_source.ib_alwaysvisible)			
				case 2 to 13
					au_source.of_set(li_rank - 1,au_source.ib_alwaysvisible)			
			end choose
		else
				au_source.of_set(0, au_source.ib_alwaysvisible)			
			
		end if


ai_batchcount = ai_batchcount - 1
if ai_batchcount>=0 then of_batchmove(au_source.iu_next,au_target.iu_next,ai_batchcount)



return 1
end function

public subroutine of_undo (u_poker au_source, u_poker au_target);if isnull(au_source) or isnull(au_target) then return
if not isvalid(au_source) or (not isvalid(au_target)) then return

integer li_displayrank,li_rank
li_rank = au_source.ii_rank
li_displayrank = au_source.ii_displayrank

choose case au_target.is_type 
	case 'source'

		of_batchmove(au_source,au_target,ii_batchcount)
		iu_undofrom = au_target 
		iu_undoto = au_source

		if au_source.is_type = 'target' then
			choose case li_displayrank 
				case 1 
					au_source.of_set(0,au_source.ib_alwaysvisible)			
				case 2 to 13
					au_source.of_set(li_rank - 1,au_source.ib_alwaysvisible)			
			end choose
		end if				
			
	case 'swap'
		au_target.of_set(au_source.ii_rank)
	//	au_source.of_set(0,au_source.ib_alwaysvisible)
		if au_source.is_type = 'target' then
			choose case li_displayrank 
				case 1 
					au_source.of_set(0,au_source.ib_alwaysvisible)			
				case 2 to 13
					au_source.of_set(li_rank - 1,au_source.ib_alwaysvisible)			
			end choose
		end if	
		
	case 'target'
		au_target.of_set(au_source.ii_rank)
		au_source.of_set(0,au_source.ib_alwaysvisible)
end choose 	


setnull(iu_undofrom)
setnull(iu_undoto )

end subroutine

public function integer of_checkrule (u_poker au_source, u_poker au_target);if au_source.ii_rank =  0 then return -1  
if ib_cheat then return 0
choose case au_target.is_type
	case 'target'
		if au_source.ii_displayrank <> au_target.ii_displayrank + 1 then 
			of_warning(-1)
			return -1
		end if
		if au_target.is_suit<>'' and au_source.is_suit<> au_target.is_suit then 
			of_warning(-1)
			return -1
		end if	
		if isvalid(au_source.iu_next) then
			if au_source.iu_next.ii_rank<>0  then 
				of_warning(-1)
				return -1
			end if
		end if
	case 'source'
		if au_target.ii_rank =0 and au_target.ib_alwaysvisible then return 1
		
		if au_source.ii_displayrank <> au_target.ii_displayrank - 1 then 
				of_warning(-1)
				return -1
		end if
		if isvalid(au_target.iu_next) =  false or isnull(au_target.iu_next) then 
				of_warning(-1)
				return -1
			end if

		if au_target.iu_next.ii_rank<>0 then 
			of_warning(-1)
			return -1
			end if
	
	choose case au_source.is_suit
			case 'Clubs','Spades'
				if au_target.is_suit = 	'Clubs' or au_target.is_suit ='Spades' then 
					of_warning(-1)
					return -1
				end if
			case 'Diamonds','Hearts'
				if au_target.is_suit = 	'Diamonds' or au_target.is_suit ='Hearts' then 
					of_warning(-1)
					return -1
				end if
		end choose	
		
	case 'swap'
		if au_target.ii_rank <>0 then 
			of_warning(-1)
			return -1
		end if

		if isvalid(au_source.iu_next) then
			if au_source.iu_next.ii_rank<>0  then 
				of_warning(-1)
				return -1
			end if
		end if
		
end choose
		






return 1
end function

public subroutine of_move (u_poker au_source, u_poker au_target);//if of_checkrule(au_source,au_target) = -1 then return

choose case au_target.is_type 
	case 'source'
		ii_batchcount = 0
		if of_batchcheck(au_source) =  -1 then return
		int li_swapleft
		li_swapleft = of_getswapleft()
		if au_target.ii_rank =0 and au_target.ib_alwaysvisible then 
			if au_target.ii_nextcount < ii_batchcount  then 
				of_warning(-2)
				return
			end if	
			if ii_batchcount >li_swapleft and gnv_cards.ib_cheat = false then 
				of_warning(-3)
				return
			end if	

			of_batchmove(au_source,au_target,ii_batchcount)
			iu_undofrom = au_target 
			iu_undoto = au_source
		else	
			if au_target.ii_nextcount < ii_batchcount + 1 then 
				of_warning(-2)
				return
			end if	
				
			if ii_batchcount >li_swapleft and gnv_cards.ib_cheat = false then 
				of_warning(-3)
				return
			end if	
				
			of_batchmove(au_source,au_target.iu_next,ii_batchcount)
			iu_undofrom = au_target.iu_next 
			iu_undoto = au_source
		end if
		
	case 'swap'
		integer li_displayrank,li_rank
		li_rank = au_source.ii_rank
		li_displayrank = au_source.ii_displayrank
		
		au_target.of_set(au_source.ii_rank)
		
		if au_source.is_type = 'target' then
			choose case li_displayrank 
				case 1 
					au_source.of_set(0)			
				case 2 to 13
					au_source.of_set(li_rank - 1)			
			end choose
		else
				au_source.of_set(0, au_source.ib_alwaysvisible)			
			
		end if
		
		iu_undofrom = au_target 
		iu_undoto = au_source 
		
	case 'target'
		au_target.of_set(au_source.ii_rank)
		au_source.of_set(0,au_source.ib_alwaysvisible)
		iu_undofrom = au_target 
		iu_undoto = au_source

		
		int i, li_count, li_completed
		li_count = upperbound(iu_target)
		For i = 1 to  li_count
			if(iu_target[i].ii_displayrank = 13) then li_completed++
		next
		if li_completed= li_count then open(w_win)
end choose 	
//if ib_cheat = false then of_automove()  // automove does not work in cheat mode

end subroutine

public function integer of_addtoswap (u_poker au_source);u_poker lu_source,lu_target
lu_source = au_source
if lu_source.is_type <> 'source' then return 0
if lu_source.ii_rank =0 then return 0	
int i,li_count
li_count  = upperbound(iu_swap)
boolean lb_couldmove
for i = 1 to li_count
	if iu_swap[i].ii_rank = 0 then
		lu_target = iu_swap[i]
		lb_couldmove = true
		exit
	else
		lb_couldmove = false
	end if
next
if lb_couldmove then of_move(lu_source,lu_target)
return 1
end function

public function integer of_hint (u_poker au_poker);int i
int li_count

// find available swap box
li_count = upperbound(iu_swap)
for i =  1 to li_count
	if iu_swap[i].ii_rank = 0 then iu_swap[i].of_highlight(0)
next

//find available target box
li_count = upperbound(iu_target)
for i =  1 to li_count
	choose case au_poker.ii_displayrank
		case 1 
			if iu_target[i].ii_rank = 0 then iu_target[i].of_highlight(0)
		case 2 to 13
			if iu_target[i].ii_displayrank = au_poker.ii_displayrank - 1 and iu_target[i].is_suit = au_poker.is_suit then iu_target[i].of_highlight(0)
	end choose
next
if au_poker.is_type = 'target' then return 0


// find available source box
li_count = upperbound(iu_source)
for i = 1 to li_count
	if au_poker.ii_displayrank = 1 then return 0
	choose case au_poker.is_suit
		case 'Clubs','Spades'
			if iu_source[i].is_suit = 'Diamonds' or iu_source[i].is_suit = 'Hearts' then
				if au_poker.ii_displayrank > 1  then 
					if au_poker.ii_displayrank = iu_source[i].ii_displayrank + 1 then iu_source[i].of_highlight(1) // only hint but maybe not available
				end if	
			end if
		case 'Diamonds','Hearts'	
			if iu_source[i].is_suit = 'Clubs' or iu_source[i].is_suit = 'Spades' then
				if au_poker.ii_displayrank > 1  then 
					if au_poker.ii_displayrank = iu_source[i].ii_displayrank + 1 then iu_source[i].of_highlight(1) // only hint but maybe not available
				end if	
			end if
			
			
	end choose
next	

return 1
end function

public function integer of_start ();int i,count,k
// reset end status 
setnull(iu_undofrom)
setnull(iu_undoto )
ib_cheat = false
ib_process = false

count  =UpperBound (iu_source)
of_resort()
u_poker  lu_poker
for i = 1 to count 
		k = k +1		
		if k>8 then exit
		lu_poker = iu_source[i]
		lu_poker.of_set(i_card[k])
		lu_poker.bringtotop = true
		lu_poker.visible = true

next
return 1
end function

public function integer of_resort ();int i,count

of_constructor()

datastore lds_array
lds_array = create datastore
lds_array.dataobject = 'd_rank'
int row
int rank
Randomize(0)
for i = 1 to 64
	row = lds_array.insertrow( 0)
	lds_array.setitem(row, 'rank', i)
	lds_array.setitem(row, 'rand_rank', rand(32767))
next


lds_array.setsort("rand_rank asc")
lds_array.sort()
i_card = lds_array.object.rank.current

return 1
end function

public function integer of_constructor ();int i
u_poker lu_poker
int li_count
li_count = upperbound(iu_source)
for i = 1 to li_count
	lu_poker = iu_source[i]
	choose case i
		case 1 to 8 
			setnull(lu_poker.iu_prev)
			lu_poker.iu_next = iu_source[i]
//		case 9 to 144
//			lu_poker.iu_next = iu_source[i + 8]
//			lu_poker.iu_prev = iu_source[i - 8]
//		case  145 to 152
//			lu_poker.iu_prev = iu_source[i - 8]
//			setnull(lu_poker.iu_next)
			
	end choose	
	lu_poker.	ii_nextcount = 18 - int((i - 1)/8)
	lu_poker.visible = false
	lu_poker.of_set(0,false)
next

li_count = upperbound(iu_swap)
for i = 1 to li_count
	lu_poker = iu_swap[i]
	lu_poker.of_set(0)
next

li_count = upperbound(iu_target)
for i = 1 to li_count
	lu_poker = iu_target[i]
	lu_poker.of_set(0)
next


return 1
end function

public function integer of_automove ();if ib_automove = false then return 0
int i, li_targetcount	
int j, li_sourcecount
int k,li_swapcount


li_targetcount = upperbound(iu_target)
li_sourcecount = upperbound(iu_source)
li_swapcount = upperbound(iu_swap)


for i = 1 to li_targetcount
	choose case iu_target[i].ii_displayrank
		case 0 
			// auto move  from source area
			for j = 1 to li_sourcecount
				if iu_source[j].ii_displayrank =  1 and of_batchcheck(iu_source[j]) = 0 then
					of_move(iu_source[j],iu_target[i])
				end if
			next
			
			// automove from swap area
			for k = 1 to li_swapcount
				if iu_swap[k].ii_displayrank =  1 then
					of_move(iu_swap[k],iu_target[i])
				end if
			next
		case	1 to 12
			// auto move  from source area
			for j = 1 to li_sourcecount
				if iu_source[j].ii_displayrank = iu_target[i].ii_displayrank + 1  and iu_source[j].is_suit = iu_target[i].is_suit and of_batchcheck(iu_source[j]) = 0 then
					of_move(iu_source[j],iu_target[i])
				end if
			next
			
			// automove from swap area
			for k = 1 to li_swapcount
				if iu_swap[k].ii_displayrank =  iu_target[i].ii_displayrank + 1 and iu_swap[k].is_suit =  iu_target[i].is_suit  then
					of_move(iu_swap[k],iu_target[i])
				end if
			next			
		case 13
			continue			
	end choose		
	
	
next
return 1
end function

public function integer of_getswapleft ();int i
int li_swapleft
for i = 1 to upperbound(iu_swap)
	if iu_swap[i].ii_rank =  0 then li_swapleft++
next

return  li_swapleft
end function

public function integer of_warning (integer as_errnumber);string ls_msg
choose case  as_errnumber
	case -1
		ls_msg = 'the cards can not be dragged'
	case  -2
		ls_msg = 'target cards area is not enough'		
	case -3
		ls_msg = 'swap cards area is not enough'
	case else	
end choose
message.StringParm	= ls_msg
//messagebox('',ls_msg)
return 1
end function

public function integer of_register (u_poker au_register, string as_type);choose case as_type
	case 'target'
		iu_target[upperbound(iu_target) + 1] = au_register
	case 'swap'	
		iu_swap[upperbound(iu_swap) + 1] = au_register
	case 'source'
		iu_source[upperbound(iu_source) + 1] = au_register
	
end choose

au_register.is_type = as_type

return 1
end function

public function integer of_register (any au_register[], string as_type);int i, li_count
li_count = upperbound(au_register)

u_poker lu_poker
lu_poker = create u_poker

for i  =  1 to li_count
	//messagebox('',au_register[i].classname())
	if classname(au_register[i])= 'dw_backgroud' then continue
	if classname(au_register[i])= 'st_1' then continue
	if classname(au_register[i])= 'st_2' then continue
	lu_poker = au_register[i]
	//if typeof(au_register[i])= datawindow! then continue
	of_register(lu_poker,as_type)
next	

return 1
end function

event constructor;
iu_undofrom = create u_poker 
iu_undoto = create u_poker 
setnull(iu_undofrom)
setnull(iu_undoto)
end event

on n_cst_cards.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_cards.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

