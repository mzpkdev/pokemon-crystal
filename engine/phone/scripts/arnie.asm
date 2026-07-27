ArniePhoneScript1:
	gettrainername BUG_CATCHER, ARNIE1, STRING_BUFFER_3
	setval REMATCH_CONTACT_ARNIE
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_ARNIE
	special Special_TryClaimRematchScheduleWindow
	iftruefwd ArnieScheduledRematch

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
	iftruefwd .SwarmCandidates
	setval REMATCH_CONTACT_ARNIE
	special Special_CheckRematchScheduleUsed
	iftruefwd .SwarmCandidates
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.SwarmCandidates:
	setval PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_ARNIE
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, ArnieWantsBattle
	ifequalfwd PHONE_EVENT_SWARM, ArnieYanmaSwarm
	ifequalfwd PHONE_EVENT_RARE_REPORT, ArnieFoundRare
	farsjump Phone_GenericCall_Male

ArnieWantsBattle:
	setval REMATCH_CONTACT_ARNIE
	special Special_MarkRematchScheduleUsed

ArnieScheduledRematch:
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
