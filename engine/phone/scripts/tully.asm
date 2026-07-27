TullyPhoneScript1:
	gettrainername FISHER, TULLY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_TULLY
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_TULLY
	special Special_CheckRematchScheduleUsed
	iftruefwd .NotSunday
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftruefwd .WaterStone
	setval REMATCH_CONTACT_TULLY
	special Special_TryClaimRematchScheduleWindow
	iftruefwd TullyScheduledRematch

.NotSunday:
	farsjump TullyNoItemScript

.WantsBattle:
	getlandmarkname ROUTE_42, STRING_BUFFER_5
	farsjump TullyForwardScript

.WaterStone:
	getlandmarkname ROUTE_42, STRING_BUFFER_5
	farsjump TullyHurryScript

TullyPhoneScript2:
	gettrainername FISHER, TULLY1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_TULLY
	special Special_CheckRematchPending
	iftruefwd .Generic
	setval REMATCH_CONTACT_TULLY
	special Special_CheckRematchScheduleUsed
	iftruefwd .Generic
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftruefwd .Generic
	farscall PhoneScript_Random3
	ifequalfwd $0, TullyWantsBattle
	checkevent EVENT_TULLY_GAVE_WATER_STONE
	iftruefwd .WaterStone
	farscall PhoneScript_Random2
	ifequalfwd $0, TullyFoundWaterStone

.WaterStone:
	farscall PhoneScript_Random11
	ifequalfwd $0, TullyFoundWaterStone

.Generic:
	farsjump Phone_GenericCall_Male

TullyWantsBattle:
	setval REMATCH_CONTACT_TULLY
	special Special_MarkRematchScheduleUsed

TullyScheduledRematch:
	getlandmarkname ROUTE_42, STRING_BUFFER_5
	setval REMATCH_CONTACT_TULLY
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

TullyFoundWaterStone:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	getlandmarkname ROUTE_42, STRING_BUFFER_5
	farsjump PhoneScript_FoundItem_Male
