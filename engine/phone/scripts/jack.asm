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
	farscall PhoneScript_Random2
	ifequalfwd $0, JackBattleTrivia
	setval REMATCH_CONTACT_JACK
	special Special_CheckRematchPending
	iftruefwd .WaitingForBattle
	setval REMATCH_CONTACT_JACK
	special Special_CheckRematchScheduleUsed
	iftruefwd .WaitingForBattle
	farscall PhoneScript_Random2
	ifequalfwd $0, JackWantsToBattle

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequalfwd $0, JackFindsRare
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
