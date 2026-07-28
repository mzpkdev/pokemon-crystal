JackPhoneScript1:
	gettrainername SCHOOLBOY, JACK1, STRING_BUFFER_3
	setval REMATCH_CONTACT_JACK
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_JACK
	special Special_TryClaimRematchScheduleWindow
	iftruefwd JackScheduledRematch

	farsjump JackPhoneTipsScript

.WantsBattle:
	getlandmarkname NATIONAL_PARK, STRING_BUFFER_5
	farsjump JackWantsBattleScript

JackPhoneScript2:
	gettrainername SCHOOLBOY, JACK1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_JACK
	special Special_CheckRematchPending
	iftruefwd .NoRematch
	setval REMATCH_CONTACT_JACK
	special Special_CheckRematchScheduleUsed
	iftruefwd .NoRematch
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.NoRematch:
	setval PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_JACK
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_RESULT_TRIVIA, JackBattleTrivia
	ifequalfwd PHONE_EVENT_REMATCH, JackWantsToBattle
	ifequalfwd PHONE_EVENT_RARE_REPORT, JackFindsRare
	farsjump Phone_GenericCall_Male

JackWantsToBattle:
	setval REMATCH_CONTACT_JACK
	special Special_MarkRematchScheduleUsed

JackScheduledRematch:
	getlandmarkname NATIONAL_PARK, STRING_BUFFER_5
	setval REMATCH_CONTACT_JACK
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

JackFindsRare:
	farsjump Phone_CheckIfUnseenRare_Male

JackBattleTrivia:
	farsjump JackTriviaScript
