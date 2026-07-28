TiffanyPhoneScript1:
	gettrainername PICNICKER, TIFFANY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_TIFFANY
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	setval REMATCH_CONTACT_TIFFANY
	special Special_CheckRematchScheduleUsed
	iftruefwd .NotTuesday
	checkflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	iftruefwd .HasItem
	setval REMATCH_CONTACT_TIFFANY
	special Special_TryClaimRematchScheduleWindow
	iftruefwd TiffanyScheduledRematch

.NotTuesday:
	farsjump TiffanyNoItemScript

.WantsBattle:
	getlandmarkname ROUTE_43, STRING_BUFFER_5
	farsjump TiffanyAsleepScript

.HasItem:
	getlandmarkname ROUTE_43, STRING_BUFFER_5
	farsjump TiffanyHurryScript

TiffanyPhoneScript2:
	gettrainername PICNICKER, TIFFANY1, STRING_BUFFER_3
	setval REMATCH_CONTACT_TIFFANY
	special Special_CheckRematchPending
	iftruefwd .GatedCandidates
	setval REMATCH_CONTACT_TIFFANY
	special Special_CheckRematchScheduleUsed
	iftruefwd .GatedCandidates
	checkflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	iftruefwd .GatedCandidates
	checkevent EVENT_TIFFANY_GAVE_FAIRYFEATHER
	iftruefwd .RepeatPolicy
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.RepeatPolicy:
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR | PHONE_EVENT_USE_REPEAT_POLICY
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.GatedCandidates:
	setval PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_TIFFANY
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_RESULT_FAMILY, TiffanysFamilyMembers
	ifequalfwd PHONE_EVENT_REMATCH, .Rematch
	ifequalfwd PHONE_EVENT_GIFT, .Gift
	farscall PhoneScript_GreetPhone_Female
	farsjump Phone_GenericCall_Female

.Rematch:
	farscall PhoneScript_GreetPhone_Female
	sjumpfwd TiffanyWantsBattle

.Gift:
	farscall PhoneScript_GreetPhone_Female
	sjumpfwd TiffanyHasFairyFeather

TiffanyWantsBattle:
	setval REMATCH_CONTACT_TIFFANY
	special Special_MarkRematchScheduleUsed

TiffanyScheduledRematch:
	getlandmarkname ROUTE_43, STRING_BUFFER_5
	setval REMATCH_CONTACT_TIFFANY
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female

TiffanysFamilyMembers:
	random $6
	ifequalfwd $0, .Grandma
	ifequalfwd $1, .Grandpa
	ifequalfwd $2, .Mom
	ifequalfwd $3, .Dad
	ifequalfwd $4, .Sister
	ifequalfwd $5, .Brother

.Grandma:
	getstring Phone_GrandmaString, STRING_BUFFER_4
	sjumpfwd .PoorClefairy

.Grandpa:
	getstring Phone_GrandpaString, STRING_BUFFER_4
	sjumpfwd .PoorClefairy

.Mom:
	getstring Phone_MomString, STRING_BUFFER_4
	sjumpfwd .PoorClefairy

.Dad:
	getstring Phone_DadString, STRING_BUFFER_4
	sjumpfwd .PoorClefairy

.Sister:
	getstring Phone_SisterString, STRING_BUFFER_4
	sjumpfwd .PoorClefairy

.Brother:
	getstring Phone_BrotherString, STRING_BUFFER_4
	; fallthrough

.PoorClefairy:
	farsjump TiffanyItsAwful

TiffanyHasFairyFeather:
	setflag ENGINE_TIFFANY_HAS_FAIRYFEATHER
	getlandmarkname ROUTE_43, STRING_BUFFER_5
	farsjump PhoneScript_FoundItem_Female
