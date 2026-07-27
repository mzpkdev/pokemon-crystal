BethPhoneScript1:
	gettrainername COOLTRAINERF, BETH1, STRING_BUFFER_3
	setval REMATCH_CONTACT_BETH
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftruefwd .NotFriday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime 1 << DAY
	iftruefwd BethFridayAfternoon

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
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftruefwd .Generic
	farscall PhoneScript_Random2
	ifequalfwd $0, BethWantsBattle

.Generic:
	farsjump Phone_GenericCall_Female

BethFridayAfternoon:
	setflag ENGINE_BETH_FRIDAY_AFTERNOON

BethWantsBattle:
	getlandmarkname ROUTE_26, STRING_BUFFER_5
	setval REMATCH_CONTACT_BETH
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female
