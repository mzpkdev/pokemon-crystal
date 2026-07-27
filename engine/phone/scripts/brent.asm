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
	farscall PhoneScript_Random2
	ifequalfwd $0, BrentBillTrivia
	setval REMATCH_CONTACT_BRENT
	special Special_CheckRematchPending
	iftruefwd .Generic
	setval REMATCH_CONTACT_BRENT
	special Special_CheckRematchScheduleUsed
	iftruefwd .Generic
	farscall PhoneScript_Random2
	ifequalfwd $0, BrentWantsBattle

.Generic:
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
