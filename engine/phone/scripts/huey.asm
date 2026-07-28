HueyPhoneScript1:
	gettrainername SAILOR, HUEY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_HUEY
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_HUEY
	special Special_TryClaimRematchScheduleWindow
	iftruefwd HueyScheduledRematch

.NotWednesday:
	special RandomPhoneMon
	farsjump HueyHangUpScript

.WantsBattle:
	getlandmarkname LIGHTHOUSE, STRING_BUFFER_5
	farsjump HueyWantsBattleScript

HueyPhoneScript2:
	gettrainername SAILOR, HUEY1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_HUEY
	special Special_CheckRematchPending
	iftruefwd .Flavor
	setval REMATCH_CONTACT_HUEY
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_HUEY
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, HueyWantsBattle
	ifequalfwd PHONE_EVENT_FLAVOR, .Flavor

.Flavor:
	farsjump PhoneScript_MonFlavorText

HueyWantsBattle:
	setval REMATCH_CONTACT_HUEY
	special Special_MarkRematchScheduleUsed

HueyScheduledRematch:
	getlandmarkname LIGHTHOUSE, STRING_BUFFER_5
	setval REMATCH_CONTACT_HUEY
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male
