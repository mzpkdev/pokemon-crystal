WaltPhoneScript1:
	gettrainername FIREBREATHER, WALT, STRING_BUFFER_3
	setval REMATCH_CONTACT_WALT
	special Special_CheckRematchPending
	iftruefwd WaltPhoneReminder
	farscall WaltPhoneAnswer
	setval REMATCH_CONTACT_WALT
	special Special_TryClaimRematchScheduleWindow
	iftruefwd WaltPhoneOffer
	readvar VAR_WEEKDAY
	ifequalfwd TUESDAY, .Contest
	ifequalfwd THURSDAY, .Contest
	ifequalfwd SATURDAY, .Contest
	farsjump WaltPhoneCalleeFlavor
.Contest:
	farwritetext WaltBugContestPhoneText
	end

WaltPhoneScript2:
	gettrainername FIREBREATHER, WALT, STRING_BUFFER_3
	farscall WaltPhoneGreeting
	setval REMATCH_CONTACT_WALT
	special Special_CheckRematchPending
	iftruefwd .Flavor
	setval REMATCH_CONTACT_WALT
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_WALT
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, WaltPhoneOffer
	ifequalfwd PHONE_EVENT_RARE_REPORT, WaltPhoneRare
.Flavor:
	farsjump WaltPhoneCallerFlavor
WaltPhoneCalleeFlavor:
	farwritetext WaltTypesPhoneText
	end
WaltPhoneCallerFlavor:
	farwritetext WaltTechniquePhoneText
	end
WaltPhoneRare:
	farsjump Phone_CheckIfUnseenRare_Male
WaltPhoneOffer:
	setval REMATCH_CONTACT_WALT
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_WALT
	special Special_OfferRematch
WaltPhoneReminder:
	getlandmarkname ROUTE_35, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male

WaltPhoneAnswer:
	farwritetext WaltAnswerPhoneText
	promptbutton
	end

WaltPhoneGreeting:
	farwritetext WaltGreetPhoneText
	promptbutton
	end
