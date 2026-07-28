DougPhoneScript1:
	gettrainername BUG_MANIAC, DOUG, STRING_BUFFER_3
	checkflag ENGINE_DOUG_HAS_BERRY
	iftruefwd DougPhoneGiftReminder
	setval REMATCH_CONTACT_DOUG
	special Special_CheckRematchPending
	iftruefwd DougPhoneRematchReminder
	farscall DougPhoneAnswer
	setval REMATCH_CONTACT_DOUG
	special Special_TryClaimRematchScheduleWindow
	iftruefwd DougPhoneOffer
	checkflag ENGINE_DOUG_GAVE_BERRY
	iftruefwd .Flavor
	random 3
	ifequalfwd 0, DougPhoneGift
	setflag ENGINE_DOUG_GAVE_BERRY
.Flavor:
	farwritetext DougPhoneFlavorText
	end

DougPhoneScript2:
	gettrainername BUG_MANIAC, DOUG, STRING_BUFFER_3
	farscall DougPhoneGreeting
	checkflag ENGINE_DOUG_HAS_BERRY
	iftruefwd DougPhoneGiftReminder
	setval REMATCH_CONTACT_DOUG
	special Special_CheckRematchPending
	iftruefwd DougPhoneRematchReminder
	setval REMATCH_CONTACT_DOUG
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	checkflag ENGINE_DOUG_GAVE_BERRY
	iftruefwd .RematchOnly
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	sjumpfwd .Select
.RematchOnly:
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
.Select:
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_DOUG
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_GIFT, DougPhoneGift
	setflag ENGINE_DOUG_GAVE_BERRY
	ifequalfwd PHONE_EVENT_REMATCH, DougPhoneOffer
.Flavor:
	farwritetext DougPhoneFlavorText
	end

DougPhoneGift:
	setflag ENGINE_DOUG_HAS_BERRY
DougPhoneGiftReminder:
	getlandmarkname ROUTE_2, STRING_BUFFER_5
	farsjump PhoneScript_FoundItem_Male

DougPhoneOffer:
	setval REMATCH_CONTACT_DOUG
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_DOUG
	special Special_OfferRematch
DougPhoneRematchReminder:
	getlandmarkname ROUTE_2, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male

DougPhoneAnswer:
	farwritetext DougAnswerPhoneText
	promptbutton
	end

DougPhoneGreeting:
	farwritetext DougGreetPhoneText
	promptbutton
	end
