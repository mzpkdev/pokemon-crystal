GavenPhoneScript1:
	gettrainername COOLTRAINERM, GAVEN1, STRING_BUFFER_3
	setval REMATCH_CONTACT_GAVEN
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_GAVEN
	special Special_TryClaimRematchScheduleWindow
	iftruefwd GavenScheduledRematch

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
	iftruefwd .GenericCandidates
	setval REMATCH_CONTACT_GAVEN
	special Special_CheckRematchScheduleUsed
	iftruefwd .GenericCandidates
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.GenericCandidates:
	setval PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_GAVEN
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, GavenWantsRematch
	ifequalfwd PHONE_EVENT_RARE_REPORT, GavenFoundRare
	farsjump Phone_GenericCall_Male

GavenWantsRematch:
	setval REMATCH_CONTACT_GAVEN
	special Special_MarkRematchScheduleUsed

GavenScheduledRematch:
	getlandmarkname ROUTE_26, STRING_BUFFER_5
	setval REMATCH_CONTACT_GAVEN
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

GavenFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male
