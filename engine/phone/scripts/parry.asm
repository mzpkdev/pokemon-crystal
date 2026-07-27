ParryPhoneScript1:
	gettrainername HIKER, PARRY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_PARRY
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftruefwd .WantsRematch
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .WantsRematch
	checktime 1 << DAY
	iftruefwd ParryFridayDay

.WantsRematch:
	farsjump ParryBattleWithMeScript

.WantsBattle:
	getlandmarkname ROUTE_45, STRING_BUFFER_5
	farsjump ParryHaventYouGottenToScript

ParryPhoneScript2:
	gettrainername HIKER, PARRY1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_PARRY
	special Special_CheckRematchPending
	iftruefwd .GenericCall
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftruefwd .GenericCall
	farscall PhoneScript_Random2
	ifequalfwd $0, ParryWantsBattle
	ifequalfwd $1, ParryWantsBattle

.GenericCall:
	farsjump Phone_GenericCall_Male

ParryFridayDay:
	setflag ENGINE_PARRY_FRIDAY_AFTERNOON

ParryWantsBattle:
	getlandmarkname ROUTE_45, STRING_BUFFER_5
	setval REMATCH_CONTACT_PARRY
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male
