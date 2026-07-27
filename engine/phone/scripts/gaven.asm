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
	iftruefwd .WaitingForBattle
	setval REMATCH_CONTACT_GAVEN
	special Special_CheckRematchScheduleUsed
	iftruefwd .WaitingForBattle
	farscall PhoneScript_Random2
	ifequalfwd $0, GavenWantsRematch

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequalfwd $0, GavenFoundRare
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
