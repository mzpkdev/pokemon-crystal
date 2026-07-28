BrentPhoneScript1:
	gettrainername POKEMANIAC, BRENT1, STRING_BUFFER_3
	setval REMATCH_CONTACT_BRENT
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_BRENT
	special Special_TryClaimRematchScheduleWindow
	iftruefwd BrentScheduledRematch

.NotMonday:
	farsjump BrentHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_43, STRING_BUFFER_5
	farsjump BrentReminderScript

BrentPhoneScript2:
	gettrainername POKEMANIAC, BRENT1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_BRENT
	special Special_CheckRematchPending
	iftruefwd .NoRematch
	setval REMATCH_CONTACT_BRENT
	special Special_CheckRematchScheduleUsed
	iftruefwd .NoRematch
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.NoRematch:
	setval PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_BRENT
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_RESULT_TRIVIA, BrentBillTrivia
	ifequalfwd PHONE_EVENT_REMATCH, BrentWantsBattle
	farsjump Phone_GenericCall_Male

BrentWantsBattle:
	setval REMATCH_CONTACT_BRENT
	special Special_MarkRematchScheduleUsed

BrentScheduledRematch:
	getlandmarkname ROUTE_43, STRING_BUFFER_5
	setval REMATCH_CONTACT_BRENT
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

BrentBillTrivia:
	farsjump BrentBillTriviaScript
