VancePhoneScript1:
	gettrainername BIRD_KEEPER, VANCE1, STRING_BUFFER_3
	setval REMATCH_CONTACT_VANCE
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_VANCE
	special Special_TryClaimRematchScheduleWindow
	iftruefwd VanceScheduledRematch

.NotWednesday:
	farsjump VanceLookingForwardScript

.WantsBattle:
	getlandmarkname ROUTE_44, STRING_BUFFER_5
	farsjump VanceHurryHurryScript

VancePhoneScript2:
	gettrainername BIRD_KEEPER, VANCE1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_VANCE
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	setval REMATCH_CONTACT_VANCE
	special Special_CheckRematchScheduleUsed
	iftruefwd .WantsBattle
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_VANCE
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, VanceWantsRematch
	ifequalfwd PHONE_EVENT_FLAVOR, .WantsBattle

.WantsBattle:
	farsjump Phone_GenericCall_Male

VanceWantsRematch:
	setval REMATCH_CONTACT_VANCE
	special Special_MarkRematchScheduleUsed

VanceScheduledRematch:
	getlandmarkname ROUTE_44, STRING_BUFFER_5
	setval REMATCH_CONTACT_VANCE
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male
