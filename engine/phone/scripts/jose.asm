JosePhoneScript1:
	gettrainername BIRD_KEEPER, JOSE2, STRING_BUFFER_3
	setval REMATCH_CONTACT_JOSE
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_JOSE
	special Special_CheckRematchScheduleUsed
	iftruefwd .NotSaturday
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftruefwd .HasItem
	setval REMATCH_CONTACT_JOSE
	special Special_TryClaimRematchScheduleWindow
	iftruefwd JoseScheduledRematch

.NotSaturday:
	farsjump JoseHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_27, STRING_BUFFER_5
	farsjump JoseReminderScript

.HasItem:
	getlandmarkname ROUTE_27, STRING_BUFFER_5
	farsjump JoseReminderScript

JosePhoneScript2:
	gettrainername BIRD_KEEPER, JOSE2, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_JOSE
	special Special_CheckRematchPending
	iftruefwd .GenericCandidates
	setval REMATCH_CONTACT_JOSE
	special Special_CheckRematchScheduleUsed
	iftruefwd .GenericCandidates
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftruefwd .GenericCandidates
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.GenericCandidates:
	setval PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_JOSE
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, JoseWantsBattle
	ifequalfwd PHONE_EVENT_GIFT, JoseHasStarPiece
	ifequalfwd PHONE_EVENT_RARE_REPORT, JoseFoundRare
	farsjump Phone_GenericCall_Male

JoseWantsBattle:
	setval REMATCH_CONTACT_JOSE
	special Special_MarkRematchScheduleUsed

JoseScheduledRematch:
	getlandmarkname ROUTE_27, STRING_BUFFER_5
	setval REMATCH_CONTACT_JOSE
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

JoseFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

JoseHasStarPiece:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	getlandmarkname ROUTE_27, STRING_BUFFER_5
	farsjump PhoneScript_FoundItem_Male
