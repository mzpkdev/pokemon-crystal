ReillyPhoneScript1:
	gettrainername BIKER, REILLY, STRING_BUFFER_3
	setval REMATCH_CONTACT_REILLY
	special Special_CheckRematchPending
	iftruefwd ReillyPhoneReminder
	farwritetext ReillyAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_REILLY
	special Special_TryClaimRematchScheduleWindow
	iftruefwd ReillyPhoneOffer
	farwritetext ReillyCyclingPhoneText
	end

ReillyPhoneScript2:
	gettrainername BIKER, REILLY, STRING_BUFFER_3
	farwritetext ReillyGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_REILLY
	special Special_CheckRematchPending
	iftruefwd ReillyPhoneReminder
	setval REMATCH_CONTACT_REILLY
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_REILLY
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, ReillyPhoneOffer
.Flavor:
	farwritetext ReillyCyclingPhoneText
	end

ReillyPhoneOffer:
	setval REMATCH_CONTACT_REILLY
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_REILLY
	special Special_OfferRematch
ReillyPhoneReminder:
	getlandmarkname ROUTE_17, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
