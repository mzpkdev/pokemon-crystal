BillyPhoneScript1:
	gettrainername SCHOOLBOY, BILLY, STRING_BUFFER_3
	setval REMATCH_CONTACT_BILLY
	special Special_CheckRematchPending
	iftruefwd BillyPhoneReminder
	farwritetext BillyAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_BILLY
	special Special_TryClaimRematchScheduleWindow
	iftruefwd BillyPhoneOffer
	farwritetext BillyGymPhoneText
	end

BillyPhoneScript2:
	gettrainername SCHOOLBOY, BILLY, STRING_BUFFER_3
	farwritetext BillyGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_BILLY
	special Special_CheckRematchPending
	iftruefwd BillyPhoneReminder
	setval REMATCH_CONTACT_BILLY
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_BILLY
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, BillyPhoneOffer
.Flavor:
	farwritetext BillyGymPhoneText
	end

BillyPhoneOffer:
	setval REMATCH_CONTACT_BILLY
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_BILLY
	special Special_OfferRematch
BillyPhoneReminder:
	getlandmarkname ROUTE_15, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
