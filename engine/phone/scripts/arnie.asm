ArniePhoneScript1:
	gettrainername BUG_CATCHER, ARNIE1, STRING_BUFFER_3
	setval REMATCH_CONTACT_ARNIE
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftruefwd .NotTuesday
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime 1 << MORN
	iftruefwd ArnieTuesdayMorning

.NotTuesday:
	setval SWARM_YANMA_ID
	special Special_CheckActiveSwarm
	iftruefwd .AlreadySwarming
	farsjump ArnieHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_35, STRING_BUFFER_5
	farsjump ArnieReminderScript

.AlreadySwarming:
	getlandmarkname ROUTE_35, STRING_BUFFER_5
	farsjump ArnieHurryScript

ArniePhoneScript2:
	gettrainername BUG_CATCHER, ARNIE1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_ARNIE
	special Special_CheckRematchPending
	iftruefwd .Swarm
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftruefwd .Swarm
	farscall PhoneScript_Random2
	ifequalfwd $0, ArnieWantsBattle

.Swarm:
	farscall PhoneScript_Random5
	ifequalfwd $0, ArnieYanmaSwarm
	farscall PhoneScript_Random3
	ifequalfwd $0, ArnieFoundRare
	farsjump Phone_GenericCall_Male

ArnieTuesdayMorning:
	setflag ENGINE_ARNIE_TUESDAY_MORNING

ArnieWantsBattle:
	getlandmarkname ROUTE_35, STRING_BUFFER_5
	setval REMATCH_CONTACT_ARNIE
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

ArnieYanmaSwarm: ; start swarm
	setval SWARM_YANMA_ID
	special Special_TryActivateSwarm
	ifequalfwd SWARM_ACTIVATE_CURRENT, ArnieYanmaAlreadySwarming
	ifequalfwd SWARM_ACTIVATE_BLOCKED, ArnieSwarmGeneric
	getmonname YANMA, STRING_BUFFER_4
	getlandmarkname ROUTE_35, STRING_BUFFER_5
	farsjump ArnieSwarmScript

ArnieFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

ArnieYanmaAlreadySwarming:
	getlandmarkname ROUTE_35, STRING_BUFFER_5
	farsjump ArnieHurryScript

ArnieSwarmGeneric:
	farsjump Phone_GenericCall_Male
