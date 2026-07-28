KennyPhoneScript1:
	gettrainername HIKER, KENNY, STRING_BUFFER_3
	setval REMATCH_CONTACT_KENNY
	special Special_CheckRematchPending
	iftruefwd KennyPhoneReminder
	farwritetext KennyAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_KENNY
	special Special_TryClaimRematchScheduleWindow
	iftruefwd KennyPhoneOffer
	farwritetext KennyBathsPhoneText
	end

KennyPhoneScript2:
	gettrainername HIKER, KENNY, STRING_BUFFER_3
	farwritetext KennyGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_KENNY
	special Special_CheckRematchPending
	iftruefwd KennyPhoneReminder
	setval REMATCH_CONTACT_KENNY
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_KENNY
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, KennyPhoneOffer
.Flavor:
	farwritetext KennyBathsPhoneText
	end

KennyPhoneOffer:
	setval REMATCH_CONTACT_KENNY
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_KENNY
	special Special_OfferRematch
KennyPhoneReminder:
	getlandmarkname ROUTE_13, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
