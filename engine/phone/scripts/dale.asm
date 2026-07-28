DalePhoneScript1:
	gettrainername BIKER, DALE, STRING_BUFFER_3
	setval REMATCH_CONTACT_DALE
	special Special_CheckRematchPending
	iftruefwd DalePhoneReminder
	farwritetext DaleAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_DALE
	special Special_TryClaimRematchScheduleWindow
	iftruefwd DalePhoneOffer
	farwritetext DaleHunchPhoneText
	end

DalePhoneScript2:
	gettrainername BIKER, DALE, STRING_BUFFER_3
	farwritetext DaleGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_DALE
	special Special_CheckRematchPending
	iftruefwd DalePhoneReminder
	setval REMATCH_CONTACT_DALE
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_DALE
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, DalePhoneOffer
.Flavor:
	farwritetext DaleHunchPhoneText
	end

DalePhoneOffer:
	setval REMATCH_CONTACT_DALE
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_DALE
	special Special_OfferRematch
DalePhoneReminder:
	getlandmarkname ROUTE_17, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
