AlfredPhoneScript1:
	gettrainername GENTLEMAN, ALFRED, STRING_BUFFER_3
	setval REMATCH_CONTACT_ALFRED
	special Special_CheckRematchPending
	iftruefwd AlfredPhoneReminder
	farscall AlfredPhoneAnswer
	setval REMATCH_CONTACT_ALFRED
	special Special_TryClaimRematchScheduleWindow
	iftruefwd AlfredPhoneOffer
	farsjump AlfredPhoneCalleeFlavor

AlfredPhoneScript2:
	gettrainername GENTLEMAN, ALFRED, STRING_BUFFER_3
	farscall AlfredPhoneGreeting
	setval REMATCH_CONTACT_ALFRED
	special Special_CheckRematchPending
	iftruefwd AlfredPhoneReminder
	setval REMATCH_CONTACT_ALFRED
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_ALFRED
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, AlfredPhoneOffer
.Flavor:
	farsjump AlfredPhoneCallerFlavor
AlfredPhoneCalleeFlavor:
	farwritetext AlfredExtraordinaryPhoneText
	end
AlfredPhoneCallerFlavor:
	farwritetext AlfredNoctowlPhoneText
	end
AlfredPhoneOffer:
	setval REMATCH_CONTACT_ALFRED
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_ALFRED
	special Special_OfferRematch
AlfredPhoneReminder:
	getlandmarkname LIGHTHOUSE, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male

AlfredPhoneAnswer:
	checktime 1 << DAY
	iftruefwd .Day
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .Nite
	farwritetext AlfredAnswerPhoneText
	promptbutton
	end
.Day:
	farwritetext AlfredAnswerPhoneDayText
	promptbutton
	end
.Nite:
	farwritetext AlfredAnswerPhoneNiteText
	promptbutton
	end

AlfredPhoneGreeting:
	checktime 1 << DAY
	iftruefwd .Day
	checktime (1 << EVE) | (1 << NITE)
	iftruefwd .Nite
	farwritetext AlfredGreetPhoneText
	promptbutton
	end
.Day:
	farwritetext AlfredGreetPhoneDayText
	promptbutton
	end
.Nite:
	farwritetext AlfredGreetPhoneNiteText
	promptbutton
	end
