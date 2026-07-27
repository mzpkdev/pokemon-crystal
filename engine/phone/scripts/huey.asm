HueyPhoneScript1:
	gettrainername SAILOR, HUEY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_HUEY
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftruefwd .NotWednesday
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd HueyWednesdayNight

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
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftruefwd .Flavor
	farscall PhoneScript_Random3
	ifequalfwd $0, HueyWantsBattle
	ifequalfwd $1, HueyWantsBattle

.Flavor:
	farsjump PhoneScript_MonFlavorText

HueyWednesdayNight:
	setflag ENGINE_HUEY_WEDNESDAY_NIGHT

HueyWantsBattle:
	getlandmarkname LIGHTHOUSE, STRING_BUFFER_5
	setval REMATCH_CONTACT_HUEY
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male
