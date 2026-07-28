Route12North_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 10, 15, ROUTE_12_GATE, 1
	warp_event 11, 15, ROUTE_12_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13, 13, BGEVENT_JUMPTEXT, FishingSpotSignText

	def_object_events
	object_event  6, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle, -1

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_KYLE
	opentext
	setval REMATCH_CONTACT_KYLE
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_FISHER_KYLE
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_KYLE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_KYLE_ASKED_FOR_PHONE_NUMBER
	writetext Route12KyleAskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext Route12KyleAskAgainText
.Ask:
	askforphonenumber PHONE_FISHER_KYLE
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext Route12KyleAcceptedText
	waitbutton
	endtext
.Full:
	writetext Route12KylePhoneFullText
	waitbutton
	endtext
.Declined:
	writetext Route12KyleDeclinedText
	waitbutton
	endtext
.Rematch:
	writetext Route12KyleRematchText
	waitbutton
	closetext
	winlosstext FisherKyleBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer FISHER, KYLE
	sjumpfwd .Battle
.Fight2:
	loadtrainer FISHER, KYLE2
	sjumpfwd .Battle
.Fight3:
	loadtrainer FISHER, KYLE3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_KYLE
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "The tug you feel"
	line "on the Rod when"

	para "you hook a #-"
	line "mon…"
	done

FisherKyleSeenText:
	text "Do you remember?"
	done

FisherKyleBeatenText:
	text "You do remember?"
	done

Route12KyleAskNumberText:
	text "Let me teach you"
	line "about fishing."

	para "Can I get your"
	line "phone number?"
	done

Route12KyleAskAgainText:
	text "Want my best"
	line "fishing tips?"
	done

Route12KyleAcceptedText:
	text "Great! I'll call"
	line "when fish bite..."
	cont "or for a battle!"
	done

Route12KylePhoneFullText:
	text "Your phone's"
	line "memory is full."
	done

Route12KyleDeclinedText:
	text "Too bad. You could"
	line "learn a lot."
	done

Route12KyleRematchText:
	text "You remembered!"
	line "Let's battle!"
	done

FishingSpotSignText:
	text "Fishing Spot"
	done
