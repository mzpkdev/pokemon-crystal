ErinPhoneScript1:
	gettrainername PICNICKER, ERIN1, STRING_BUFFER_3
	setval REMATCH_CONTACT_ERIN
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	setval REMATCH_CONTACT_ERIN
	special Special_TryClaimRematchScheduleWindow
	iftruefwd ErinScheduledRematch

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
	setval REMATCH_CONTACT_ERIN
	special Special_CheckRematchScheduleUsed
	iftruefwd .GenericCall
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_ERIN
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, ErinWantsBattle
	ifequalfwd PHONE_EVENT_FLAVOR, .GenericCall

.GenericCall:
	farsjump Phone_GenericCall_Female

ErinWantsBattle:
	setval REMATCH_CONTACT_ERIN
	special Special_MarkRematchScheduleUsed

ErinScheduledRematch:
	getlandmarkname ROUTE_46, STRING_BUFFER_5
	setval REMATCH_CONTACT_ERIN
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female
