DanaPhoneScript1:
	gettrainername LASS, DANA1, STRING_BUFFER_3
	setval REMATCH_CONTACT_DANA
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	setval REMATCH_CONTACT_DANA
	special Special_CheckRematchScheduleUsed
	iftruefwd .NotThursday
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftruefwd .HasThunderstone
	setval REMATCH_CONTACT_DANA
	special Special_TryClaimRematchScheduleWindow
	iftruefwd DanaScheduledRematch

.NotThursday:
	farsjump DanaHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_38, STRING_BUFFER_5
	farsjump DanaReminderScript

.HasThunderstone:
	getlandmarkname ROUTE_38, STRING_BUFFER_5
	farsjump DanaComePickUpScript

DanaPhoneScript2:
	gettrainername LASS, DANA1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Female
	setval REMATCH_CONTACT_DANA
	special Special_CheckRematchPending
	iftruefwd .GatedCandidates
	setval REMATCH_CONTACT_DANA
	special Special_CheckRematchScheduleUsed
	iftruefwd .GatedCandidates
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftruefwd .GatedCandidates
	checkevent EVENT_DANA_GAVE_THUNDERSTONE
	iftruefwd .RepeatPolicy
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.RepeatPolicy:
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR | PHONE_EVENT_USE_REPEAT_POLICY
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.GatedCandidates:
	setval PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_DANA
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, DanaWantsBattle
	ifequalfwd PHONE_EVENT_GIFT, DanaHasThunderstone
	ifequalfwd PHONE_EVENT_RARE_REPORT, DanaFoundRare
	farsjump Phone_GenericCall_Female

DanaWantsBattle:
	setval REMATCH_CONTACT_DANA
	special Special_MarkRematchScheduleUsed

DanaScheduledRematch:
	getlandmarkname ROUTE_38, STRING_BUFFER_5
	setval REMATCH_CONTACT_DANA
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female

DanaFoundRare:
	farsjump Phone_CheckIfUnseenRare_Female

DanaHasThunderstone:
	setflag ENGINE_DANA_HAS_THUNDERSTONE
	getlandmarkname ROUTE_38, STRING_BUFFER_5
	farsjump PhoneScript_FoundItem_Female
