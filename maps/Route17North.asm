Route17North_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17NorthAlwaysOnBikeCallback

	def_warp_events
	warp_event 15,  6, ROUTE_16_17_GATE, 1
	warp_event 15,  7, ROUTE_16_17_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  3, BGEVENT_JUMPTEXT, CyclingRoadSignText

	def_object_events
	object_event  9,  6, SPRITE_OFFICER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerfJamieScript, -1

Route17NorthAlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

OfficerfJamieScript:
	checktime 1 << NITE
	iffalse_jumptextfaceplayer OfficerfJamieDaytimeText
	checkevent EVENT_BEAT_OFFICERF_JAMIE
	iftruefwd .Phone
	faceplayer
	opentext
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerfJamieSeenText
	waitbutton
	closetext
	winlosstext OfficerfJamieBeatenText, 0
	loadtrainer OFFICERF, JAMIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICERF_JAMIE
.Phone:
	loadvar VAR_CALLERID, PHONE_OFFICERF_JAMIE
	faceplayer
	opentext
	setval REMATCH_CONTACT_JAMIE
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_OFFICERF_JAMIE
	iftrue_jumpopenedtext OfficerfJamieAfterText
	checkevent EVENT_JAMIE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext OfficerfJamieAfterText
	promptbutton
	setevent EVENT_JAMIE_ASKED_FOR_PHONE_NUMBER
	writetext OfficerfJamieAskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext OfficerfJamieAskAgainText
.Ask:
	askforphonenumber PHONE_OFFICERF_JAMIE
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext OfficerfJamieAcceptedText
	waitbutton
	endtext
.Full:
	writetext OfficerfJamiePhoneFullText
	waitbutton
	endtext
.Declined:
	writetext OfficerfJamieDeclinedText
	waitbutton
	endtext
.Rematch:
	writetext OfficerfJamieRematchText
	waitbutton
	closetext
	winlosstext OfficerfJamieBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer OFFICERF, JAMIE
	sjumpfwd .Battle
.Fight2:
	loadtrainer OFFICERF, JAMIE2
	sjumpfwd .Battle
.Fight3:
	loadtrainer OFFICERF, JAMIE3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_JAMIE
	special Special_ConsumeRematch
	end

OfficerfJamieSeenText:
	text "Hey you! Are you"
	line "causing trouble?"
	done

OfficerfJamieBeatenText:
	text "Hmph!"
	done

OfficerfJamieAfterText:
	text "Riding around late"
	line "at night just"
	cont "looks suspicious."
	done

OfficerfJamieDaytimeText:
	text "Bikers and"
	line "Roughnecks like"

	para "to make trouble"
	line "on this road."

	para "Don't you get"
	line "involved, got it?"
	done

OfficerfJamieAskNumberText:
	text "I can notify you"
	line "when I am ready"
	cont "for our rematch."

	para "May I register"
	line "your phone number?"
	done

OfficerfJamieAskAgainText:
	text "May I register"
	line "your number now?"
	done

OfficerfJamieAcceptedText:
	text "Thank you. I will"
	line "call after patrol."
	done

OfficerfJamieDeclinedText:
	text "Understood. Ride"
	line "safely out there."
	done

OfficerfJamiePhoneFullText:
	text "Your phone list"
	line "is full."
	done

OfficerfJamieRematchText:
	text "Right on time."
	line "Let us begin!"
	done

CyclingRoadSignText:
	text "Cycling Road"

	para "Downhill coasting"
	line "all the way!"
	done
