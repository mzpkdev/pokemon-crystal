RobPhoneScript1:
	gettrainername BUG_MANIAC, ROB, STRING_BUFFER_3
	checkevent EVENT_ROB_BERRY_READY
	iftruefwd RobPhoneGiftReminder
	setval REMATCH_CONTACT_ROB
	special Special_CheckRematchPending
	iftruefwd RobPhoneRematchReminder
	farscall RobPhoneAnswer
	setval REMATCH_CONTACT_ROB
	special Special_TryClaimRematchScheduleWindow
	iftruefwd RobPhoneOffer
	checkevent EVENT_ROB_BERRY_CLAIMED
	iftruefwd .Flavor
	random 3
	ifequalfwd 0, RobPhoneGift
.Flavor:
	farwritetext RobPhoneFlavorText
	end

RobPhoneScript2:
	gettrainername BUG_MANIAC, ROB, STRING_BUFFER_3
	farscall RobPhoneGreeting
	checkevent EVENT_ROB_BERRY_READY
	iftruefwd RobPhoneGiftReminder
	setval REMATCH_CONTACT_ROB
	special Special_CheckRematchPending
	iftruefwd RobPhoneRematchReminder
	setval REMATCH_CONTACT_ROB
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_ROB
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_GIFT, RobPhoneGift
	ifequalfwd PHONE_EVENT_REMATCH, RobPhoneOffer
.Flavor:
	farwritetext RobPhoneFlavorText
	end

RobPhoneGift:
	setevent EVENT_ROB_BERRY_READY
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
