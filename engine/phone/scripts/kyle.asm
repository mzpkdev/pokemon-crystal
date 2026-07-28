KylePhoneScript1:
	gettrainername FISHER, KYLE, STRING_BUFFER_3
	setval REMATCH_CONTACT_KYLE
	special Special_CheckRematchPending
	iftruefwd KylePhoneReminder
	farwritetext KyleAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_KYLE
	special Special_TryClaimRematchScheduleWindow
	iftruefwd KylePhoneOffer
	farwritetext KyleFishingTipsPhoneText
	end

KylePhoneScript2:
	gettrainername FISHER, KYLE, STRING_BUFFER_3
	farwritetext KyleGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_KYLE
	special Special_CheckRematchPending
	iftruefwd KylePhoneReminder
	setval REMATCH_CONTACT_KYLE
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_KYLE
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, KylePhoneOffer
.Flavor:
	farwritetext KyleFishingTipsPhoneText
	end

KylePhoneOffer:
	setval REMATCH_CONTACT_KYLE
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_KYLE
	special Special_OfferRematch
KylePhoneReminder:
	getlandmarkname ROUTE_12, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
