ChadPhoneScript1:
	gettrainername SCHOOLBOY, CHAD1, STRING_BUFFER_3
	setval REMATCH_CONTACT_CHAD
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_CHAD
	special Special_TryClaimRematchScheduleWindow
	iftruefwd ChadScheduledRematch

.NotFriday:
	farsjump ChadHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_38, STRING_BUFFER_5
	farsjump ChadReminderScript

ChadPhoneScript2:
	gettrainername SCHOOLBOY, CHAD1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequalfwd $0, ChadOakGossip
	setval REMATCH_CONTACT_CHAD
	special Special_CheckRematchPending
	iftruefwd .Generic
	setval REMATCH_CONTACT_CHAD
	special Special_CheckRematchScheduleUsed
	iftruefwd .Generic
	farscall PhoneScript_Random2
	ifequalfwd $0, ChadWantsBattle

.Generic:
	farscall PhoneScript_Random3
	ifequalfwd $0, ChadFoundRare
	farsjump Phone_GenericCall_Male

ChadWantsBattle:
	setval REMATCH_CONTACT_CHAD
	special Special_MarkRematchScheduleUsed

ChadScheduledRematch:
	getlandmarkname ROUTE_38, STRING_BUFFER_5
	setval REMATCH_CONTACT_CHAD
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

ChadFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

ChadOakGossip:
	farsjump ChadOakGossipScript
