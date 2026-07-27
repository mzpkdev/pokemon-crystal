RalphPhoneScript1:
	gettrainername FISHER, RALPH1, STRING_BUFFER_3
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftruefwd Ralph_Rematch
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftruefwd Ralph_CheckSwarm
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, Ralph_CheckSwarm
	checktime 1 << MORN
	iftruefwd Ralph_WednesdayMorning
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
	iffalsefwd Ralph_CheckSwarm2
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftruefwd Ralph_CheckSwarm2
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftruefwd Ralph_CheckSwarm2
	farscall PhoneScript_Random2
	ifequalfwd $0, Ralph_FightMe
Ralph_CheckSwarm2:
	farscall PhoneScript_Random5
	ifequalfwd $0, Ralph_SetUpSwarm
	farsjump Phone_GenericCall_Male

Ralph_WednesdayMorning:
	setflag ENGINE_RALPH_WEDNESDAY_MORNING
Ralph_FightMe:
	getlandmarkname ROUTE_32, STRING_BUFFER_5
	setflag ENGINE_RALPH_READY_FOR_REMATCH
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
