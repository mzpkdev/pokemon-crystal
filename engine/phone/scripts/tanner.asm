TannerPhoneScript1:
	gettrainername CAMPER, TANNER, STRING_BUFFER_3
	setval REMATCH_CONTACT_TANNER
	special Special_CheckRematchPending
	iftruefwd TannerPhoneReminder
	farwritetext TannerAnswerPhoneText
	promptbutton
	setval REMATCH_CONTACT_TANNER
	special Special_TryClaimRematchScheduleWindow
	iftruefwd TannerPhoneOffer
	farwritetext TannerCampingPhoneText
	end

TannerPhoneScript2:
	gettrainername CAMPER, TANNER, STRING_BUFFER_3
	farwritetext TannerGreetPhoneText
	promptbutton
	setval REMATCH_CONTACT_TANNER
	special Special_CheckRematchPending
	iftruefwd .Flavor
	setval REMATCH_CONTACT_TANNER
	special Special_CheckRematchScheduleUsed
	iftruefwd .Flavor
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	setval REMATCH_CONTACT_TANNER
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_REMATCH, TannerPhoneOffer
.Flavor:
	farwritetext TannerCampingPhoneText
	end

TannerPhoneOffer:
	setval REMATCH_CONTACT_TANNER
	special Special_MarkRematchScheduleUsed
	setval REMATCH_CONTACT_TANNER
	special Special_OfferRematch
TannerPhoneReminder:
	getlandmarkname ROUTE_13, STRING_BUFFER_5
	farsjump PhoneScript_WantsToBattle_Male
