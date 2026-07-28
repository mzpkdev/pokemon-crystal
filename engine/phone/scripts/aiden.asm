AidenPhoneScript1:
	gettrainername BIKER, AIDEN, STRING_BUFFER_3
	setval REMATCH_CONTACT_AIDEN
	special Special_CheckRematchPending
	iftruefwd AidenPhoneReminder
	farwritetext AidenAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_AIDEN
	special Special_TryClaimRematchScheduleWindow
	iftruefwd AidenPhoneOffer
	farwritetext AidenEnginePhoneText
	end

AidenPhoneScript2:
	gettrainername BIKER, AIDEN, STRING_BUFFER_3
	farwritetext AidenGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_AIDEN
	special Special_CheckRematchPending
	iftruefwd AidenPhoneReminder
	setval REMATCH_CONTACT_AIDEN
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_AIDEN
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, AidenPhoneOffer
.Flavor:
	farwritetext AidenEnginePhoneText
	end

AidenPhoneOffer:
	setval REMATCH_CONTACT_AIDEN
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_AIDEN
	special Special_OfferRematch
AidenPhoneReminder:
	getlandmarkname ROUTE_17, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
