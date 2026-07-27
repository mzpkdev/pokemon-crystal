ReenaPhoneScript1:
	gettrainername COOLTRAINERF, REENA1, STRING_BUFFER_3
	setval REMATCH_CONTACT_REENA
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftruefwd .NotSunday
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime 1 << MORN
	iftruefwd ReenaSundayMorning

.NotSunday:
	farsjump ReenaForwardScript

.WantsBattle:
	getlandmarkname ROUTE_27, STRING_BUFFER_5
	farsjump ReenaHurryScript

ReenaPhoneScript2:
	gettrainername COOLTRAINERF, REENA1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Female
	setval REMATCH_CONTACT_REENA
	special Special_CheckRematchPending
	iftruefwd .Generic
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftruefwd .Generic
	farscall PhoneScript_Random2
	ifequalfwd $0, ReenaWantsBattle

.Generic:
	farsjump Phone_GenericCall_Female

ReenaSundayMorning:
	setflag ENGINE_REENA_SUNDAY_MORNING

ReenaWantsBattle:
	getlandmarkname ROUTE_27, STRING_BUFFER_5
	setval REMATCH_CONTACT_REENA
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female
