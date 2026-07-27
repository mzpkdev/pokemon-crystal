ErinPhoneScript1:
	gettrainername PICNICKER, ERIN1, STRING_BUFFER_3
	setval REMATCH_CONTACT_ERIN
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftruefwd .NotSaturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd ErinSaturdayNight

.NotSaturday:
	farsjump ErinWorkingHardScript

.WantsBattle:
	getlandmarkname ROUTE_46, STRING_BUFFER_5
	farsjump ErinComeBattleScript

ErinPhoneScript2:
	gettrainername PICNICKER, ERIN1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Female
	setval REMATCH_CONTACT_ERIN
	special Special_CheckRematchPending
	iftruefwd .GenericCall
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftruefwd .GenericCall
	farscall PhoneScript_Random3
	ifequalfwd $0, ErinWantsBattle
	ifequalfwd $1, ErinWantsBattle

.GenericCall:
	farsjump Phone_GenericCall_Female

ErinSaturdayNight:
	setflag ENGINE_ERIN_SATURDAY_NIGHT

ErinWantsBattle:
	getlandmarkname ROUTE_46, STRING_BUFFER_5
	setval REMATCH_CONTACT_ERIN
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female
