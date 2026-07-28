KrisePhoneScript1:
	gettrainername LASS, KRISE, STRING_BUFFER_3
	setval REMATCH_CONTACT_KRISE
	special Special_CheckRematchPending
	iftruefwd KrisePhoneReminder
	farscall KrisePhoneAnswer
	setval REMATCH_CONTACT_KRISE
	special Special_TryClaimRematchScheduleWindow
	iftruefwd KrisePhoneOffer
	farsjump KrisePhoneCalleeFlavor

KrisePhoneScript2:
	gettrainername LASS, KRISE, STRING_BUFFER_3
	farscall KrisePhoneGreeting
	setval REMATCH_CONTACT_KRISE
	special Special_CheckRematchPending
	iftruefwd KrisePhoneReminder
	setval REMATCH_CONTACT_KRISE
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_KRISE
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, KrisePhoneOffer
	ifequalfwd PHONE_EVENT_RARE_REPORT, KrisePhoneRare
.Flavor:
	farsjump KrisePhoneCallerFlavor
KrisePhoneCalleeFlavor:
	farwritetext KriseMiniskirtPhoneText
	end
KrisePhoneCallerFlavor:
	farwritetext KrisePcBoxesPhoneText
	end
KrisePhoneRare:
	farsjump Phone_CheckIfUnseenRare_Female
KrisePhoneOffer:
	setval REMATCH_CONTACT_KRISE
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_KRISE
	special Special_OfferRematch
KrisePhoneReminder:
	getlandmarkname NATIONAL_PARK, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Female

KrisePhoneAnswer:
	farwritetext KriseAnswerPhoneText
	promptbutton
	end

KrisePhoneGreeting:
	farwritetext KriseGreetPhoneText
	promptbutton
	end
