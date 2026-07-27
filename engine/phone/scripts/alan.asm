AlanPhoneScript1:
	gettrainername SCHOOLBOY, ALAN1, STRING_BUFFER_3
	setval REMATCH_CONTACT_ALAN
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_ALAN
	special Special_CheckRematchScheduleUsed
	iftruefwd .NotWednesday
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftruefwd .FireStone
	setval REMATCH_CONTACT_ALAN
	special Special_TryClaimRematchScheduleWindow
	iftruefwd AlanScheduledRematch

.NotWednesday:
	farsjump AlanHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_36, STRING_BUFFER_5
	farsjump AlanReminderScript

.FireStone:
	getlandmarkname ROUTE_36, STRING_BUFFER_5
	farsjump AlanComePickUpScript

AlanPhoneScript2:
	gettrainername SCHOOLBOY, ALAN1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_ALAN
	special Special_CheckRematchPending
	iftruefwd .Generic
	setval REMATCH_CONTACT_ALAN
	special Special_CheckRematchScheduleUsed
	iftruefwd .Generic
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftruefwd .Generic
	farscall PhoneScript_Random3
	ifequalfwd $0, AlanWantsBattle
	checkevent EVENT_ALAN_GAVE_FIRE_STONE
	iftruefwd .FireStone
	farscall PhoneScript_Random2
	ifequalfwd $0, AlanHasFireStone

.FireStone:
	farscall PhoneScript_Random11
	ifequalfwd $0, AlanHasFireStone

.Generic:
	farsjump Phone_GenericCall_Male

AlanWantsBattle:
	setval REMATCH_CONTACT_ALAN
	special Special_MarkRematchScheduleUsed

AlanScheduledRematch:
	getlandmarkname ROUTE_36, STRING_BUFFER_5
	setval REMATCH_CONTACT_ALAN
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

AlanHasFireStone:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	getlandmarkname ROUTE_36, STRING_BUFFER_5
	farsjump PhoneScript_FoundItem_Male
