TorinPhoneScript1:
	gettrainername SCHOOLBOY, TORIN, STRING_BUFFER_3
	setval REMATCH_CONTACT_TORIN
	special Special_CheckRematchPending
	iftruefwd TorinPhoneReminder
	farwritetext TorinAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_TORIN
	special Special_TryClaimRematchScheduleWindow
	iftruefwd TorinPhoneOffer
	farwritetext TorinStudyPhoneText
	end

TorinPhoneScript2:
	gettrainername SCHOOLBOY, TORIN, STRING_BUFFER_3
	farwritetext TorinGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_TORIN
	special Special_CheckRematchPending
	iftruefwd TorinPhoneReminder
	setval REMATCH_CONTACT_TORIN
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_TORIN
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, TorinPhoneOffer
.Flavor:
	farwritetext TorinStudyPhoneText
	end

TorinPhoneOffer:
	setval REMATCH_CONTACT_TORIN
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_TORIN
	special Special_OfferRematch
TorinPhoneReminder:
	getlandmarkname ROUTE_14, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
