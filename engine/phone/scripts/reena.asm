ReenaPhoneScript1:
	gettrainername COOLTRAINERF, REENA1, STRING_BUFFER_3
	setval REMATCH_CONTACT_REENA
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	setval REMATCH_CONTACT_REENA
	special Special_TryClaimRematchScheduleWindow
	iftruefwd ReenaScheduledRematch

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
	setval REMATCH_CONTACT_REENA
	special Special_CheckRematchScheduleUsed
	iftruefwd .Generic
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_REENA
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, ReenaWantsBattle
	ifequalfwd PHONE_EVENT_FLAVOR, .Generic

.Generic:
	farsjump Phone_GenericCall_Female

ReenaWantsBattle:
	setval REMATCH_CONTACT_REENA
	special Special_MarkRematchScheduleUsed

ReenaScheduledRematch:
	getlandmarkname ROUTE_27, STRING_BUFFER_5
	setval REMATCH_CONTACT_REENA
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female
