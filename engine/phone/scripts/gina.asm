GinaPhoneScript1:
	gettrainername PICNICKER, GINA1, STRING_BUFFER_3
	setval REMATCH_CONTACT_GINA
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	setval REMATCH_CONTACT_GINA
	special Special_CheckRematchScheduleUsed
	iftruefwd .NotSunday
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftruefwd .HasLeafStone
	setval REMATCH_CONTACT_GINA
	special Special_TryClaimRematchScheduleWindow
	iftruefwd GinaScheduledRematch

.NotSunday:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftruefwd .Rockets
	farsjump GinaHangUpScript

.Rockets:
	farsjump GinaRocketRumorScript

.WantsBattle:
	getlandmarkname ROUTE_34, STRING_BUFFER_5
	farsjump GinaReminderScript

.HasLeafStone:
	getlandmarkname ROUTE_34, STRING_BUFFER_5
	farsjump GinaComePickUpScript

GinaPhoneScript2:
	gettrainername PICNICKER, GINA1, STRING_BUFFER_3
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftruefwd GinaRockets
	setval REMATCH_CONTACT_GINA
	special Special_CheckRematchPending
	iftruefwd .Generic
	setval REMATCH_CONTACT_GINA
	special Special_CheckRematchScheduleUsed
	iftruefwd .Generic
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftruefwd .Generic
	checkevent EVENT_GINA_GAVE_LEAF_STONE
	iftruefwd .RepeatPolicy
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .FirstGiftCandidates
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.FirstGiftCandidates:
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.RepeatPolicy:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .RepeatGiftCandidates
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR | PHONE_EVENT_USE_REPEAT_POLICY
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.RepeatGiftCandidates:
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR | PHONE_EVENT_USE_REPEAT_POLICY
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_GINA
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_GIFT, GinaHasLeafStone
	ifequalfwd PHONE_EVENT_REMATCH, GinaWantsBattle

.Generic:
	farsjump Phone_GenericCall_Female

GinaWantsBattle:
	setval REMATCH_CONTACT_GINA
	special Special_MarkRematchScheduleUsed

GinaScheduledRematch:
	getlandmarkname ROUTE_34, STRING_BUFFER_5
	setval REMATCH_CONTACT_GINA
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female

GinaRockets:
	farsjump GinaRocketRumorScript

GinaHasLeafStone:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	getlandmarkname ROUTE_34, STRING_BUFFER_5
	farsjump PhoneScript_FoundItem_Female
