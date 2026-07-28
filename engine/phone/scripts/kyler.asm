KylerPhoneScript1:
	gettrainername FISHER, KYLER, STRING_BUFFER_3
	setval REMATCH_CONTACT_KYLER
	special Special_CheckRematchPending
	iftruefwd KylerPhoneReminder
	farwritetext KylerAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_KYLER
	special Special_TryClaimRematchScheduleWindow
	iftruefwd KylerPhoneOffer
	farwritetext KylerFishingTipsPhoneText
	end

KylerPhoneScript2:
	gettrainername FISHER, KYLER, STRING_BUFFER_3
	farwritetext KylerGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_KYLER
	special Special_CheckRematchPending
	iftruefwd .Flavor
	setval REMATCH_CONTACT_KYLER
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_KYLER
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, KylerPhoneOffer
.Flavor:
	farwritetext KylerFishingTipsPhoneText
	end

KylerPhoneOffer:
	setval REMATCH_CONTACT_KYLER
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_KYLER
	special Special_OfferRematch
KylerPhoneReminder:
	getlandmarkname ROUTE_12, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
