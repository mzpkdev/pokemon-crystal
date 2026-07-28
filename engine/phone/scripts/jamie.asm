JamiePhoneScript1:
	gettrainername OFFICERF, JAMIE, STRING_BUFFER_3
	setval REMATCH_CONTACT_JAMIE
	special Special_CheckRematchPending
	iftruefwd JamiePhoneReminder
	farwritetext JamieAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_JAMIE
	special Special_TryClaimRematchScheduleWindow
	iftruefwd JamiePhoneOffer
	farwritetext JamiePatrolPhoneText
	end

JamiePhoneScript2:
	gettrainername OFFICERF, JAMIE, STRING_BUFFER_3
	farwritetext JamieGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_JAMIE
	special Special_CheckRematchPending
	iftruefwd JamiePhoneReminder
	setval REMATCH_CONTACT_JAMIE
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_JAMIE
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, JamiePhoneOffer
.Flavor:
	farwritetext JamiePatrolPhoneText
	end

JamiePhoneOffer:
	setval REMATCH_CONTACT_JAMIE
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_JAMIE
	special Special_OfferRematch
JamiePhoneReminder:
	getlandmarkname ROUTE_17, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Female
