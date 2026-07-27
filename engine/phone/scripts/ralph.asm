RalphPhoneScript1:
	gettrainername FISHER, RALPH1, STRING_BUFFER_3
	setval REMATCH_CONTACT_RALPH
	special Special_CheckRematchPending
	iftruefwd Ralph_Rematch
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_RALPH
	special Special_TryClaimRematchScheduleWindow
	iftruefwd Ralph_ScheduledRematch

Ralph_CheckSwarm:
	setval SWARM_QWILFISH_ID
	special Special_CheckActiveSwarm
	iftruefwd Ralph_ReportSwarm
	farsjump RalphNoItemScript

Ralph_Rematch:
	getlandmarkname ROUTE_32, STRING_BUFFER_5
	farsjump RalphReminderScript

Ralph_ReportSwarm:
	getlandmarkname ROUTE_32, STRING_BUFFER_5
	farsjump RalphHurryScript

RalphPhoneScript2:
	gettrainername FISHER, RALPH1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .SwarmCandidates
	setval REMATCH_CONTACT_RALPH
	special Special_CheckRematchPending
	iftruefwd .SwarmCandidates
	setval REMATCH_CONTACT_RALPH
	special Special_CheckRematchScheduleUsed
	iftruefwd .SwarmCandidates
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.SwarmCandidates:
	setval PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_RALPH
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, Ralph_FightMe
	ifequalfwd PHONE_EVENT_SWARM, Ralph_SetUpSwarm
	farsjump Phone_GenericCall_Male

Ralph_FightMe:
	setval REMATCH_CONTACT_RALPH
	special Special_MarkRematchScheduleUsed

Ralph_ScheduledRematch:
	getlandmarkname ROUTE_32, STRING_BUFFER_5
	setval REMATCH_CONTACT_RALPH
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

Ralph_SetUpSwarm:
	setval SWARM_QWILFISH_ID
	special Special_TryActivateSwarm
	ifequalfwd SWARM_ACTIVATE_CURRENT, .AlreadySwarming
	ifequalfwd SWARM_ACTIVATE_BLOCKED, .Generic
	getmonname QWILFISH, STRING_BUFFER_4
	getlandmarkname ROUTE_32, STRING_BUFFER_5
	farsjump RalphItemScript

.AlreadySwarming:
	getlandmarkname ROUTE_32, STRING_BUFFER_5
	farsjump RalphHurryScript

.Generic:
	farsjump Phone_GenericCall_Male
