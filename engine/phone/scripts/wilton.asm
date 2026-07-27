WiltonPhoneScript1:
	gettrainername FISHER, WILTON1, STRING_BUFFER_3
	setval REMATCH_CONTACT_WILTON
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_WILTON
	special Special_CheckRematchScheduleUsed
	iftruefwd .NotThursday
	checkflag ENGINE_WILTON_HAS_ITEM
	iftruefwd .HasItem
	setval REMATCH_CONTACT_WILTON
	special Special_TryClaimRematchScheduleWindow
	iftruefwd WiltonScheduledRematch

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
	iftruefwd .GenericCandidates
	setval REMATCH_CONTACT_WILTON
	special Special_CheckRematchScheduleUsed
	iftruefwd .GenericCandidates
	checkflag ENGINE_WILTON_HAS_ITEM
	iftruefwd .GenericCandidates
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.GenericCandidates:
	setval PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_WILTON
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, WiltonWantsBattle
	ifequalfwd PHONE_EVENT_GIFT, WiltonHasItem
	farsjump Phone_GenericCall_Male

WiltonWantsBattle:
	setval REMATCH_CONTACT_WILTON
	special Special_MarkRematchScheduleUsed

WiltonScheduledRematch:
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
