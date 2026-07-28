Route2South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 19,  3, ROUTE_2_GATE, 3
	warp_event  9,  7, VIRIDIAN_FOREST_VIRIDIAN_GATE, 3

	def_coord_events

	def_bg_events
	bg_event  9, 29, BGEVENT_JUMPTEXT, Route2SignText

	def_object_events
	object_event 14, 23, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 5, TrainerBug_maniacRob, -1
	object_event  4, 16, SPRITE_BUG_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerBug_maniacDoug, -1
	itemball_event 18, 30, ELIXIR, 1, EVENT_ROUTE_2_ELIXIR
	cuttree_event 15, 16, EVENT_ROUTE_2_CUT_TREE_3
	cuttree_event 16, 24, EVENT_ROUTE_2_CUT_TREE_4
	cuttree_event 16, 30, EVENT_ROUTE_2_CUT_TREE_5

TrainerBug_maniacRob:
	trainer BUG_MANIAC, ROB, EVENT_BEAT_BUG_MANIAC_ROB, Bug_maniacRobSeenText, Bug_maniacRobBeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_BUG_MANIAC_ROB
	opentext
	checkevent EVENT_ROB_BERRY_READY
	iftruefwd .GiveBerry
	setval REMATCH_CONTACT_ROB
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_BUG_MANIAC_ROB
	iftrue_jumpopenedtext Bug_maniacRobAfterBattleText
	checkevent EVENT_ROB_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext Bug_maniacRobAfterBattleText
	promptbutton
	setevent EVENT_ROB_ASKED_FOR_PHONE_NUMBER
	writetext Route2SouthAskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext Route2SouthAskAgainText
.Ask:
	askforphonenumber PHONE_BUG_MANIAC_ROB
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext Route2SouthAcceptedText
	waitbutton
	endtext
.Full:
	writetext Route2SouthPhoneFullText
	waitbutton
	endtext
.Declined:
	writetext Route2SouthDeclinedText
	waitbutton
	endtext
.Rematch:
	writetext Route2SouthRematchText
	waitbutton
	closetext
	winlosstext Bug_maniacRobBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkevent EVENT_BEAT_BLAINE
	iftruefwd .Fight2
	loadtrainer BUG_MANIAC, ROB
	sjumpfwd .Battle
.Fight2:
	loadtrainer BUG_MANIAC, ROB2
	sjumpfwd .Battle
.Fight3:
	loadtrainer BUG_MANIAC, ROB3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_ROB
	special Special_ConsumeRematch
	end
.GiveBerry:
	writetext Route2SouthBerryText
	promptbutton
	scall Route2SouthGiveBerry
	iffalsefwd .PackFull
	clearevent EVENT_ROB_BERRY_READY
	setevent EVENT_ROB_BERRY_CLAIMED
	writetext Route2SouthBerryReceivedText
	waitbutton
	endtext
.PackFull:
	writetext Route2SouthPackFullText
	waitbutton
	endtext

TrainerBug_maniacDoug:
	trainer BUG_MANIAC, DOUG, EVENT_BEAT_BUG_MANIAC_DOUG, Bug_maniacDougSeenText, Bug_maniacDougBeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_BUG_MANIAC_DOUG
	opentext
	checkevent EVENT_DOUG_BERRY_READY
	iftruefwd .GiveBerry
	setval REMATCH_CONTACT_DOUG
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_BUG_MANIAC_DOUG
	iftrue_jumpopenedtext Bug_maniacDougAfterBattleText
	checkevent EVENT_DOUG_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext Bug_maniacDougAfterBattleText
	promptbutton
	setevent EVENT_DOUG_ASKED_FOR_PHONE_NUMBER
	writetext Route2SouthAskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext Route2SouthAskAgainText
.Ask:
	askforphonenumber PHONE_BUG_MANIAC_DOUG
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext Route2SouthAcceptedText
	waitbutton
	endtext
.Full:
	writetext Route2SouthPhoneFullText
	waitbutton
	endtext
.Declined:
	writetext Route2SouthDeclinedText
	waitbutton
	endtext
.Rematch:
	writetext Route2SouthRematchText
	waitbutton
	closetext
	winlosstext Bug_maniacDougBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkevent EVENT_BEAT_BLAINE
	iftruefwd .Fight2
	loadtrainer BUG_MANIAC, DOUG
	sjumpfwd .Battle
.Fight2:
	loadtrainer BUG_MANIAC, DOUG2
	sjumpfwd .Battle
.Fight3:
	loadtrainer BUG_MANIAC, DOUG3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_DOUG
	special Special_ConsumeRematch
	end
.GiveBerry:
	writetext Route2SouthBerryText
	promptbutton
	scall Route2SouthGiveBerry
	iffalsefwd .PackFull
	clearevent EVENT_DOUG_BERRY_READY
	setevent EVENT_DOUG_BERRY_CLAIMED
	writetext Route2SouthBerryReceivedText
	waitbutton
	endtext
.PackFull:
	writetext Route2SouthPackFullText
	waitbutton
	endtext

Route2SouthGiveBerry:
	random 4
	ifequalfwd 0, .Chesto
	ifequalfwd 1, .Leppa
	ifequalfwd 2, .Lum
	verbosegiveitem SITRUS_BERRY
	end
.Chesto:
	verbosegiveitem CHESTO_BERRY
	end
.Leppa:
	verbosegiveitem LEPPA_BERRY
	end
.Lum:
	verbosegiveitem LUM_BERRY
	end

Bug_maniacRobSeenText:
	text "My bug #mon are"
	line "tough. Prepare to"
	cont "lose!"
	done

Bug_maniacRobBeatenText:
	text "I was whipped…"
	done

Bug_maniacRobAfterBattleText:
	text "I'm going to look"
	line "for stronger bug"
	cont "#mon."
	done

Bug_maniacDougSeenText:
	text "Why don't girls"
	line "like bug #mon?"
	done

Bug_maniacDougBeatenText:
	text "No good!"
	done

Bug_maniacDougAfterBattleText:
	text "Bug #mon squish"
	line "like plush toys"

	para "when you squeeze"
	line "their bellies."

	para "I love how they"
	line "feel!"
	done

Route2SouthAskNumberText:
	text "Want to trade bug"
	line "training tips?"

	para "Register my phone"
	line "number!"
	done

Route2SouthAskAgainText:
	text "Want to register"
	line "my number now?"
	done

Route2SouthAcceptedText:
	text "I'll call when I"
	line "find something!"
	done

Route2SouthDeclinedText:
	text "Maybe another"
	line "time, then."
	done

Route2SouthPhoneFullText:
	text "Your phone list"
	line "is full."
	done

Route2SouthRematchText:
	text "My bugs are ready!"
	line "Let's battle!"
	done

Route2SouthBerryText:
	text "I found a Berry"
	line "for you. Take it!"
	done

Route2SouthBerryReceivedText:
	text "Use it well!"
	done

Route2SouthPackFullText:
	text "Your Pack is full."

	para "Come back after"
	line "making some room."
	done

Route2SignText:
	text "Route 2"

	para "Viridian City -"
	line "Pewter City"
	done
