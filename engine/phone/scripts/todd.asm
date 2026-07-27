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
	iftruefwd .TryForSale
	setval REMATCH_CONTACT_TODD
	special Special_CheckRematchScheduleUsed
	iftruefwd .TryForSale
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .NoGoldenrod
	farscall PhoneScript_Random2
	ifequalfwd $0, ToddWantsBattle

.TryForSale:
	farscall PhoneScript_Random2
	ifequalfwd $0, ToddDeptStoreSale

.NoGoldenrod:
	farscall PhoneScript_Random3
	ifequalfwd $0, ToddFoundRare
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
