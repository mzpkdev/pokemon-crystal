BrandonPhoneScript1:
	gettrainername POKEFANM, BRANDON, STRING_BUFFER_3
	setval REMATCH_CONTACT_BRANDON
	special Special_CheckRematchPending
	iftruefwd BrandonPhoneReminder
	farscall BrandonPhoneAnswer
	setval REMATCH_CONTACT_BRANDON
	special Special_TryClaimRematchScheduleWindow
	iftruefwd BrandonPhoneOffer
	farsjump BrandonPhoneCalleeFlavor

BrandonPhoneScript2:
	gettrainername POKEFANM, BRANDON, STRING_BUFFER_3
	farscall BrandonPhoneGreeting
	setval REMATCH_CONTACT_BRANDON
	special Special_CheckRematchPending
	iftruefwd BrandonPhoneReminder
	setval REMATCH_CONTACT_BRANDON
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_BRANDON
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, BrandonPhoneOffer
.Flavor:
	farsjump BrandonPhoneCallerFlavor

BrandonPhoneCalleeFlavor:
	farwritetext BrandonShortsPhoneText
	end

BrandonPhoneCallerFlavor:
	farwritetext BrandonImprovedPhoneText
	end

BrandonPhoneOffer:
	setval REMATCH_CONTACT_BRANDON
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_BRANDON
	special Special_OfferRematch
BrandonPhoneReminder:
	getlandmarkname ROUTE_34, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male

BrandonPhoneAnswer:
	farwritetext BrandonAnswerPhoneText
	promptbutton
	end

BrandonPhoneGreeting:
	farwritetext BrandonGreetPhoneText
	promptbutton
	end
