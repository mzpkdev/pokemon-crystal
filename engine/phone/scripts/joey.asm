JoeyPhoneScript1:
	gettrainername YOUNGSTER, JOEY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_JOEY
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_JOEY
	special Special_TryClaimRematchScheduleWindow
	iftruefwd JoeyScheduledRematch

.NotMonday:
	special RandomPhoneMon
	farwritetext JoeyDevisingStrategiesText
	promptbutton
	farsjump PhoneScript_HangupText_Male

.WantsBattle:
	getlandmarkname ROUTE_30, STRING_BUFFER_5
	farsjump JoeyReminderScript

JoeyPhoneScript2:
	gettrainername YOUNGSTER, JOEY1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_JOEY
	special Special_CheckRematchPending
	iftruefwd .Generic
	setval REMATCH_CONTACT_JOEY
	special Special_CheckRematchScheduleUsed
	iftruefwd .Generic
	farscall PhoneScript_Random3
	ifequalfwd $0, JoeyWantsBattle
	ifequalfwd $1, JoeyWantsBattle

.Generic:
	farsjump Phone_GenericCall_Male

JoeyWantsBattle:
	setval REMATCH_CONTACT_JOEY
	special Special_MarkRematchScheduleUsed

JoeyScheduledRematch:
	getlandmarkname ROUTE_30, STRING_BUFFER_5
	setval REMATCH_CONTACT_JOEY
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male
