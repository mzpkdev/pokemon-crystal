AnthonyPhoneScript1:
	gettrainername HIKER, ANTHONY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_ANTHONY
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_ANTHONY
	special Special_TryClaimRematchScheduleWindow
	iftruefwd AnthonyScheduledRematch

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
	setval REMATCH_CONTACT_ANTHONY
	special Special_CheckRematchScheduleUsed
	iftruefwd .TriesSwarm
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.TriesSwarm:
	setval PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_ANTHONY
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, AnthonyWantsBattle
	ifequalfwd PHONE_EVENT_SWARM, AnthonyTriesDunsparceSwarm
	farsjump Phone_GenericCall_Male

AnthonyWantsBattle:
	setval REMATCH_CONTACT_ANTHONY
	special Special_MarkRematchScheduleUsed

AnthonyScheduledRematch:
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
