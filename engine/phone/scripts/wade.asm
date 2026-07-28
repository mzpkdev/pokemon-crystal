WadePhoneScript1:
	gettrainername BUG_CATCHER, WADE1, STRING_BUFFER_3
	setval REMATCH_CONTACT_WADE
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_WADE
	special Special_CheckRematchScheduleUsed
	iftruefwd .NotTuesday
	checkflag ENGINE_WADE_HAS_ITEM
	iftruefwd .HasItem
	setval REMATCH_CONTACT_WADE
	special Special_TryClaimRematchScheduleWindow
	iftruefwd WadeScheduledRematch

.NotTuesday:
	farscall PhoneScript_Random2
	ifequalfwd $0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftruefwd .NoContest
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .ContestToday
	ifequalfwd THURSDAY, .ContestToday
	ifequalfwd SATURDAY, .ContestToday

.NoContest:
	farsjump WadeNoBerriesScript

.ContestToday:
	farsjump PhoneScript_BugCatchingContest

.WantsBattle:
	getlandmarkname ROUTE_31, STRING_BUFFER_5
	farsjump WadeQuickBattleScript

.HasItem:
	getlandmarkname ROUTE_31, STRING_BUFFER_5
	farsjump WadeComeQuickScript

WadePhoneScript2:
	gettrainername BUG_CATCHER, WADE1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftruefwd .NoContestCandidate
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .ContestCandidate
	ifequalfwd THURSDAY, .ContestCandidate
	ifequalfwd SATURDAY, .ContestCandidate

.NoContestCandidate:
	setval REMATCH_CONTACT_WADE
	special Special_CheckRematchPending
	iftruefwd .NoContestGated
	setval REMATCH_CONTACT_WADE
	special Special_CheckRematchScheduleUsed
	iftruefwd .NoContestGated
	checkflag ENGINE_WADE_HAS_ITEM
	iftruefwd .NoContestGated
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .NoContestGift
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.NoContestGift:
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.NoContestGated:
	setval PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.ContestCandidate:
	setval REMATCH_CONTACT_WADE
	special Special_CheckRematchPending
	iftruefwd .ContestGated
	setval REMATCH_CONTACT_WADE
	special Special_CheckRematchScheduleUsed
	iftruefwd .ContestGated
	checkflag ENGINE_WADE_HAS_ITEM
	iftruefwd .ContestGated
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .ContestGift
	setval PHONE_EVENT_CAP_SPECIAL | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.ContestGift:
	setval PHONE_EVENT_CAP_SPECIAL | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.ContestGated:
	setval PHONE_EVENT_CAP_SPECIAL | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_WADE
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_RESULT_SPECIAL, .ContestToday
	ifequalfwd PHONE_EVENT_GIFT, WadeHasItem2
	ifequalfwd PHONE_EVENT_REMATCH, WadeWantsBattle2
	ifequalfwd PHONE_EVENT_RARE_REPORT, WadeFoundRare
	farsjump Phone_GenericCall_Male

.ContestToday:
	farsjump PhoneScript_BugCatchingContest

WadeWantsBattle2:
	setval REMATCH_CONTACT_WADE
	special Special_MarkRematchScheduleUsed

WadeScheduledRematch:
	getlandmarkname ROUTE_31, STRING_BUFFER_5
	setval REMATCH_CONTACT_WADE
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

WadeFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

WadeHasItem2:
	setflag ENGINE_WADE_HAS_ITEM
	getlandmarkname ROUTE_31, STRING_BUFFER_5
	clearevent EVENT_WADE_HAS_ORAN_BERRY
	clearevent EVENT_WADE_HAS_PECHA_BERRY
	clearevent EVENT_WADE_HAS_CHERI_BERRY
	clearevent EVENT_WADE_HAS_PERSIM_BERRY
	random $4
	ifequalfwd $0, .Berry
	ifequalfwd $1, .PsnCureBerry
	ifequalfwd $2, .PrzCureBerry
	ifequalfwd $3, .Bitterberry

.Berry:
	setevent EVENT_WADE_HAS_ORAN_BERRY
	sjumpfwd .FoundBerry

.PsnCureBerry:
	setevent EVENT_WADE_HAS_PECHA_BERRY
	sjumpfwd .FoundBerry

.PrzCureBerry:
	setevent EVENT_WADE_HAS_CHERI_BERRY
	sjumpfwd .FoundBerry

.Bitterberry:
	setevent EVENT_WADE_HAS_PERSIM_BERRY

.FoundBerry:
	farsjump PhoneScript_FoundItem_Male
