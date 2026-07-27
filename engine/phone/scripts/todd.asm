ToddPhoneScript1:
	gettrainername CAMPER, TODD1, STRING_BUFFER_3
	setval REMATCH_CONTACT_TODD
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	setval REMATCH_CONTACT_TODD
	special Special_TryClaimRematchScheduleWindow
	iftruefwd ToddScheduledRematch

.NotSaturday:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftruefwd .SaleOn
	farsjump ToddNoItemScript

.WantsBattle:
	getlandmarkname ROUTE_34, STRING_BUFFER_5
	farsjump ToddForwardScript

.SaleOn:
	farsjump ToddHurryScript

ToddPhoneScript2:
	gettrainername CAMPER, TODD1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Male
	setval REMATCH_CONTACT_TODD
	special Special_CheckRematchPending
	iftruefwd .SaleCandidates
	setval REMATCH_CONTACT_TODD
	special Special_CheckRematchScheduleUsed
	iftruefwd .SaleCandidates
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .GenericCandidates
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_SPECIAL | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.SaleCandidates:
	setval PHONE_EVENT_CAP_SPECIAL | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.GenericCandidates:
	setval PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_TODD
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, ToddWantsBattle
	ifequalfwd PHONE_EVENT_SPECIAL, ToddDeptStoreSale
	ifequalfwd PHONE_EVENT_RARE_REPORT, ToddFoundRare
	farsjump Phone_GenericCall_Male

ToddWantsBattle:
	setval REMATCH_CONTACT_TODD
	special Special_MarkRematchScheduleUsed

ToddScheduledRematch:
	getlandmarkname ROUTE_34, STRING_BUFFER_5
	setval REMATCH_CONTACT_TODD
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Male

ToddFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

ToddDeptStoreSale:
	setflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	farsjump ToddItemScript
