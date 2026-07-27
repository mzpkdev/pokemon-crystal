GavenPhoneScript1:
	gettrainername COOLTRAINERM, GAVEN1, STRING_BUFFER_3
	setval REMATCH_CONTACT_GAVEN
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftruefwd .NotThursday
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime 1 << MORN
	iftruefwd GavenThursdayMorningScript

.NotThursday:
	farsjump GavenHangUpNotThursdayScript

.WantsBattle:
	getlandmarkname ROUTE_26, STRING_BUFFER_5
	farsjump GavenReminderScript

GavenPhoneScript2:
	gettrainername COOLTRAINERM, GAVEN1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_GAVEN
	special Special_CheckRematchPending
	iftruefwd .WaitingForBattle
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftruefwd .WaitingForBattle
	farscall PhoneScript_Random2
	ifequalfwd $0, GavenWantsRematch

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequalfwd $0, GavenFoundRare
	farsjump Phone_GenericCall_Male

GavenThursdayMorningScript:
	setflag ENGINE_GAVEN_THURSDAY_MORNING

GavenWantsRematch:
	getlandmarkname ROUTE_26, STRING_BUFFER_5
	setval REMATCH_CONTACT_GAVEN
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

GavenFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male
