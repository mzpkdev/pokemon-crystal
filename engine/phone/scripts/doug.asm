DougPhoneScript1:
	gettrainername BUG_MANIAC, DOUG, STRING_BUFFER_3
	checkevent EVENT_DOUG_BERRY_READY
	iftruefwd DougPhoneGiftReminder
	setval REMATCH_CONTACT_DOUG
	special Special_CheckRematchPending
	iftruefwd DougPhoneRematchReminder
	farscall DougPhoneAnswer
	setval REMATCH_CONTACT_DOUG
	special Special_TryClaimRematchScheduleWindow
	iftruefwd DougPhoneOffer
	checkevent EVENT_DOUG_BERRY_CLAIMED
	iftruefwd .Flavor
	random 3
	ifequalfwd 0, DougPhoneGift
	setevent EVENT_DOUG_BERRY_CLAIMED
.Flavor:
	farwritetext DougPhoneFlavorText
	end

DougPhoneScript2:
	gettrainername BUG_MANIAC, DOUG, STRING_BUFFER_3
	farscall DougPhoneGreeting
	checkevent EVENT_DOUG_BERRY_READY
	iftruefwd DougPhoneGiftReminder
	setval REMATCH_CONTACT_DOUG
	special Special_CheckRematchPending
	iftruefwd DougPhoneRematchReminder
	setval REMATCH_CONTACT_DOUG
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	checkevent EVENT_DOUG_BERRY_CLAIMED
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
	setevent EVENT_DOUG_BERRY_CLAIMED
	ifequalfwd PHONE_EVENT_REMATCH, DougPhoneOffer
.Flavor:
	farwritetext DougPhoneFlavorText
	end

DougPhoneGift:
	setevent EVENT_DOUG_BERRY_READY
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
