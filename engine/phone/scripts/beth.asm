BethPhoneScript1:
	gettrainername COOLTRAINERF, BETH1, STRING_BUFFER_3
	setval REMATCH_CONTACT_BETH
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	setval REMATCH_CONTACT_BETH
	special Special_TryClaimRematchScheduleWindow
	iftruefwd BethScheduledRematch

.NotFriday:
	farsjump BethHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_26, STRING_BUFFER_5
	farsjump BethBattleReminderScript

BethPhoneScript2:
	gettrainername COOLTRAINERF, BETH1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Female
	setval REMATCH_CONTACT_BETH
	special Special_CheckRematchPending
	iftruefwd .Generic
	setval REMATCH_CONTACT_BETH
	special Special_CheckRematchScheduleUsed
	iftruefwd .Generic
	farscall PhoneScript_Random2
	ifequalfwd $0, BethWantsBattle

.Generic:
	farsjump Phone_GenericCall_Female

BethWantsBattle:
	setval REMATCH_CONTACT_BETH
	special Special_MarkRematchScheduleUsed

BethScheduledRematch:
	getlandmarkname ROUTE_26, STRING_BUFFER_5
	setval REMATCH_CONTACT_BETH
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female
