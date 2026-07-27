WiltonPhoneScript1:
	gettrainername FISHER, WILTON1, STRING_BUFFER_3
	setval REMATCH_CONTACT_WILTON
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WILTON_THRUSDAY_MORNING
	iftruefwd .NotThursday
	checkflag ENGINE_WILTON_HAS_ITEM
	iftruefwd .HasItem
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime 1 << MORN
	iftruefwd WiltonThursdayMorning

.NotThursday:
	farsjump WiltonHaventFoundAnythingScript

.WantsBattle:
	getlandmarkname ROUTE_44, STRING_BUFFER_5
	farsjump WiltonNotBitingScript

.HasItem:
	getlandmarkname ROUTE_44, STRING_BUFFER_5
	farsjump WiltonWantThisScript

WiltonPhoneScript2:
	gettrainername FISHER, WILTON1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_WILTON
	special Special_CheckRematchPending
	iftruefwd .GenericCall
	checkflag ENGINE_WILTON_THRUSDAY_MORNING
	iftruefwd .GenericCall
	checkflag ENGINE_WILTON_HAS_ITEM
	iftruefwd .GenericCall
	farscall PhoneScript_Random2
	ifequalfwd $0, WiltonWantsBattle
	farscall PhoneScript_Random2
	ifequalfwd $0, WiltonHasItem

.GenericCall:
	farsjump Phone_GenericCall_Male

WiltonThursdayMorning:
	setflag ENGINE_WILTON_THRUSDAY_MORNING

WiltonWantsBattle:
	getlandmarkname ROUTE_44, STRING_BUFFER_5
	setval REMATCH_CONTACT_WILTON
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

WiltonHasItem:
	setflag ENGINE_WILTON_HAS_ITEM
	getlandmarkname ROUTE_44, STRING_BUFFER_5
	clearevent EVENT_WILTON_HAS_ULTRA_BALL
	clearevent EVENT_WILTON_HAS_GREAT_BALL
	clearevent EVENT_WILTON_HAS_POKE_BALL
	random $5
	ifequalfwd $0, .UltraBall
	random $3
	ifequalfwd $0, .GreatBall
	sjumpfwd .PokeBall

.UltraBall:
	setevent EVENT_WILTON_HAS_ULTRA_BALL
	sjumpfwd .FoundItem

.GreatBall:
	setevent EVENT_WILTON_HAS_GREAT_BALL
	sjumpfwd .FoundItem

.PokeBall:
	setevent EVENT_WILTON_HAS_POKE_BALL

.FoundItem:
	farsjump PhoneScript_FoundItem_Male
