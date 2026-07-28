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
	setval REMATCH_CONTACT_CHAD
	special Special_CheckRematchPending
	iftruefwd .NoRematch
	setval REMATCH_CONTACT_CHAD
	special Special_CheckRematchScheduleUsed
	iftruefwd .NoRematch
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.NoRematch:
	setval PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_CHAD
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_RESULT_GOSSIP, ChadOakGossip
	ifequalfwd PHONE_EVENT_REMATCH, ChadWantsBattle
	ifequalfwd PHONE_EVENT_RARE_REPORT, ChadFoundRare
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
