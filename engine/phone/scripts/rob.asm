RobPhoneScript1:
	gettrainername BUG_MANIAC, ROB, STRING_BUFFER_3
	checkflag ENGINE_ROB_HAS_BERRY
	iftruefwd RobPhoneGiftReminder
	setval REMATCH_CONTACT_ROB
	special Special_CheckRematchPending
	iftruefwd RobPhoneRematchReminder
	farscall RobPhoneAnswer
	setval REMATCH_CONTACT_ROB
	special Special_TryClaimRematchScheduleWindow
	iftruefwd RobPhoneOffer
	checkflag ENGINE_ROB_GAVE_BERRY
	iftruefwd .Flavor
	random 3
	ifequalfwd 0, RobPhoneGift
	setflag ENGINE_ROB_GAVE_BERRY
.Flavor:
	farwritetext RobPhoneFlavorText
	end

RobPhoneScript2:
	gettrainername BUG_MANIAC, ROB, STRING_BUFFER_3
	farscall RobPhoneGreeting
	checkflag ENGINE_ROB_HAS_BERRY
	iftruefwd RobPhoneGiftReminder
	setval REMATCH_CONTACT_ROB
	special Special_CheckRematchPending
	iftruefwd RobPhoneRematchReminder
	setval REMATCH_CONTACT_ROB
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	checkflag ENGINE_ROB_GAVE_BERRY
	iftruefwd .RematchOnly
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	sjumpfwd .Select
.RematchOnly:
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
.Select:
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_ROB
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_GIFT, RobPhoneGift
	setflag ENGINE_ROB_GAVE_BERRY
	ifequalfwd PHONE_EVENT_REMATCH, RobPhoneOffer
.Flavor:
	farwritetext RobPhoneFlavorText
	end

RobPhoneGift:
	setflag ENGINE_ROB_HAS_BERRY
RobPhoneGiftReminder:
	getlandmarkname ROUTE_2, STRING_BUFFER_5
	farsjump PhoneScript_FoundItem_Male

RobPhoneOffer:
	setval REMATCH_CONTACT_ROB
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_ROB
	special Special_OfferRematch
RobPhoneRematchReminder:
	getlandmarkname ROUTE_2, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male

RobPhoneAnswer:
	farwritetext RobAnswerPhoneText
	promptbutton
	end

RobPhoneGreeting:
	farwritetext RobGreetPhoneText
	promptbutton
	end
