AnthonyPhoneScript1:
	gettrainername HIKER, ANTHONY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_ANTHONY
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftruefwd .NotFriday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd AnthonyFridayNight

.NotFriday:
	setval SWARM_DUNSPARCE_ID
	special Special_CheckActiveSwarm
	iftruefwd .AlreadySwarming
	farsjump AnthonyHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_33, STRING_BUFFER_5
	farsjump AnthonyReminderScript

.AlreadySwarming:
	getlandmarkname ROUTE_33, STRING_BUFFER_5
	farsjump AnthonyHurryScript

AnthonyPhoneScript2:
	gettrainername HIKER, ANTHONY1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .TriesSwarm
	setval REMATCH_CONTACT_ANTHONY
	special Special_CheckRematchPending
	iftruefwd .TriesSwarm
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftruefwd .TriesSwarm
	farscall PhoneScript_Random2
	ifequalfwd $0, AnthonyWantsBattle

.TriesSwarm:
	farscall PhoneScript_Random5
	ifequalfwd $0, AnthonyTriesDunsparceSwarm
	farsjump Phone_GenericCall_Male

AnthonyFridayNight:
	setflag ENGINE_ANTHONY_FRIDAY_NIGHT

AnthonyWantsBattle:
	getlandmarkname ROUTE_33, STRING_BUFFER_5
	setval REMATCH_CONTACT_ANTHONY
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

AnthonyTriesDunsparceSwarm:
	setval SWARM_DUNSPARCE_ID
	special Special_TryActivateSwarm
	ifequalfwd SWARM_ACTIVATE_CURRENT, .AlreadySwarming
	ifequalfwd SWARM_ACTIVATE_BLOCKED, .Generic
	getmonname DUNSPARCE, STRING_BUFFER_4
	getlandmarkname DARK_CAVE, STRING_BUFFER_5
	farsjump AnthonySwarmScript

.AlreadySwarming:
	getlandmarkname ROUTE_33, STRING_BUFFER_5
	farsjump AnthonyHurryScript

.Generic:
	farsjump Phone_GenericCall_Male
