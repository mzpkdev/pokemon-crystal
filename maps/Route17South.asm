Route17South_MapScriptHeader:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17SouthAlwaysOnBikeCallback

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 11, 69, BGEVENT_ITEM + MAX_ETHER, EVENT_ROUTE_17_SOUTH_HIDDEN_MAX_ETHER
	bg_event 10, 121, BGEVENT_ITEM + MAX_ELIXIR, EVENT_ROUTE_17_SOUTH_HIDDEN_MAX_ELIXIR
	bg_event  9, 62, BGEVENT_JUMPTEXT, Route17SouthNotice1Text
	bg_event  9, 69, BGEVENT_JUMPTEXT, Route17SouthTrainerTips1Text
	bg_event  9, 92, BGEVENT_JUMPTEXT, Route17SouthTrainerTips2Text
	bg_event  9, 99, BGEVENT_JUMPTEXT, Route17SouthNotice2Text

	def_object_events
	object_event 12,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerBikerDale, -1
	object_event  4, 15, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerBikerReilly, -1
	object_event 18, 22, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerJacob, -1
	object_event  2, 35, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerDan, -1
	object_event  3, 54, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBikerGlenn, -1
	object_event 11, 63, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBikerJoel, -1
	object_event 13, 70, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerBikerAiden, -1
	object_event  3, 84, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBikerTeddy, -1
	object_event  6, 126, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1, 27, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerRoughneckBrian, -1
	object_event  6, 40, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRoughneckTheron, -1
	object_event  4, 89, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerRoughneckMarkey, -1

Route17SouthAlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

TrainerBikerReilly:
	trainer BIKER, REILLY, EVENT_BEAT_BIKER_REILLY, BikerReillySeenText, BikerReillyBeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_BIKER_REILLY
	opentext
	setval REMATCH_CONTACT_REILLY
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_BIKER_REILLY
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_REILLY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_REILLY_ASKED_FOR_PHONE_NUMBER
	writetext .AskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext .AskAgainText
.Ask:
	askforphonenumber PHONE_BIKER_REILLY
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext .AcceptedText
	waitbutton
	endtext
.Full:
	writetext .PhoneFullText
	waitbutton
	endtext
.Declined:
	writetext .DeclinedText
	waitbutton
	endtext
.Rematch:
	writetext .RematchText
	waitbutton
	closetext
	winlosstext BikerReillyBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer BIKER, REILLY
	sjumpfwd .Battle
.Fight2:
	loadtrainer BIKER, REILLY2
	sjumpfwd .Battle
.Fight3:
	loadtrainer BIKER, REILLY3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_REILLY
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Don't get cocky,"
	line "you Johto punk!"
	done

.AskNumberText:
	text "Let's settle this"
	line "again sometime."

	para "Trade phone"
	line "numbers with me?"
	done

.AskAgainText:
	text "Ready to trade"
	line "phone numbers?"
	done

.AcceptedText:
	text "Good. I'll call"
	line "when I'm ready."
	done

.DeclinedText:
	text "Your loss. Maybe"
	line "next time."
	done

.PhoneFullText:
	text "Your phone list"
	line "is full."
	done

.RematchText:
	text "Back for more?"
	line "Let's ride!"
	done

BikerReillySeenText:
	text "Hey, you! You're"
	line "from Johto, huh?"
	done

BikerReillyBeatenText:
	text "Whoa, you kick!"
	done

GenericTrainerBikerJoel:
	generictrainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText

	text "I look cool, but"
	line "I'm weak, so I'm"
	cont "not really cool."

	para "I have to train"
	line "harder…"
	done

BikerJoelSeenText:
	text "Wow. That's a cool"
	line "Bicycle!"
	done

BikerJoelBeatenText:
	text "But you don't just"
	line "look cool…"
	done

GenericTrainerBikerGlenn:
	generictrainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText

	text "Hands-free riding"
	line "is considered cool"
	cont "on Cycling Road."
	done

BikerGlennSeenText:
	text "Hey! Want to have"
	line "a speed battle?"
	done

BikerGlennBeatenText:
	text "Yikes! You've got"
	line "awesome torque!"
	done

TrainerBikerDale:
	trainer BIKER, DALE, EVENT_BEAT_BIKER_DALE, BikerDaleSeenText, BikerDaleBeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_BIKER_DALE
	opentext
	setval REMATCH_CONTACT_DALE
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_BIKER_DALE
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_DALE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_DALE_ASKED_FOR_PHONE_NUMBER
	writetext .AskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext .AskAgainText
.Ask:
	askforphonenumber PHONE_BIKER_DALE
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext .AcceptedText
	waitbutton
	endtext
.Full:
	writetext .PhoneFullText
	waitbutton
	endtext
.Declined:
	writetext .DeclinedText
	waitbutton
	endtext
.Rematch:
	writetext .RematchText
	waitbutton
	closetext
	winlosstext BikerDaleBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer BIKER, DALE
	sjumpfwd .Battle
.Fight2:
	loadtrainer BIKER, DALE2
	sjumpfwd .Battle
.Fight3:
	loadtrainer BIKER, DALE3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_DALE
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "You're so cool!"
	line "You don't do any-"
	cont "thing halfway!"
	done

.AskNumberText:
	text "My hunch says we"
	line "should battle"
	cont "again."

	para "Can I register"
	line "your number?"
	done

.AskAgainText:
	text "Can I register"
	line "your number now?"
	done

.AcceptedText:
	text "I knew you'd say"
	line "yes! I'll call."
	done

.DeclinedText:
	text "Guess my hunch was"
	line "off this time."
	done

.PhoneFullText:
	text "Your phone list"
	line "is full."
	done

.RematchText:
	text "My hunch was good!"
	line "Come on! Let's go!"
	done

BikerDaleSeenText:
	text "You're gonna lose!"
	line "I've got a hunch!"
	done

BikerDaleBeatenText:
	text "Maybe my hunch was"
	line "a little off…"
	done

GenericTrainerBikerJacob:
	generictrainer BIKER, JACOB, EVENT_BEAT_BIKER_JACOB, BikerJacobSeenText, BikerJacobBeatenText

	text "Chopper? Oh, I"
	line "was talking about"
	cont "my Bicycle!"
	done

BikerJacobSeenText:
	text "Modding my"
	line "chopper costs a"

	para "bunch of money!"
	line "I need a job!"
	done

BikerJacobBeatenText:
	text "Argh. I failed!"
	done

TrainerBikerAiden:
	trainer BIKER, AIDEN, EVENT_BEAT_BIKER_AIDEN, BikerAidenSeenText, BikerAidenBeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_BIKER_AIDEN
	opentext
	setval REMATCH_CONTACT_AIDEN
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_BIKER_AIDEN
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_AIDEN_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_AIDEN_ASKED_FOR_PHONE_NUMBER
	writetext .AskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext .AskAgainText
.Ask:
	askforphonenumber PHONE_BIKER_AIDEN
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext .AcceptedText
	waitbutton
	endtext
.Full:
	writetext .PhoneFullText
	waitbutton
	endtext
.Declined:
	writetext .DeclinedText
	waitbutton
	endtext
.Rematch:
	writetext .RematchText
	waitbutton
	closetext
	winlosstext BikerAidenBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer BIKER, AIDEN
	sjumpfwd .Battle
.Fight2:
	loadtrainer BIKER, AIDEN2
	sjumpfwd .Battle
.Fight3:
	loadtrainer BIKER, AIDEN3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_AIDEN
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Gaon gaooon!"
	line "Buwaribaribari…!"

	para "There, my engine"
	line "imitation has"
	cont "evolved!"
	done

.AskNumberText:
	text "Want to hear my"
	line "engine improve?"

	para "Trade phone"
	line "numbers with me?"
	done

.AskAgainText:
	text "Want to trade"
	line "phone numbers?"
	done

.AcceptedText:
	text "Vroom! I'll call"
	line "when I'm tuned up!"
	done

.DeclinedText:
	text "Hnnff... Maybe"
	line "next time."
	done

.PhoneFullText:
	text "Your phone list"
	line "is full."
	done

.RematchText:
	text "My engine's ready!"
	line "Vroom! Let's go!"
	done

BikerAidenSeenText:
	text "Vroom vroom!"
	line "Baribaribaribari!"

	para "What do you think"
	line "of my engine"
	cont "imitation?"
	done

BikerAidenBeatenText:
	text "Hnnff… hnnff…"
	line "I'm out of breath…"
	done

GenericTrainerBikerDan:
	generictrainer BIKER, DAN, EVENT_BEAT_BIKER_DAN, BikerDanSeenText, BikerDanBeatenText

	text "I love this melan-"
	line "choly melody."

	para "It really suits me"
	line "well…"
	done

BikerDanSeenText:
	text "Parara parapara"
	line "para-parara!"

	para "My horn's got a"
	line "great sound to it,"
	cont "don't you think?"
	done

BikerDanBeatenText:
	text "Paaraaraaaaa…"
	done

GenericTrainerBikerTeddy:
	generictrainer BIKER, TEDDY, EVENT_BEAT_BIKER_TEDDY, BikerTeddySeenText, BikerTeddyBeatenText

	text "I love the way you"
	line "do battle, too!"

	cont "Consider me a fan!"
	done

BikerTeddySeenText:
	text "Hey, that's a cool"
	line "Bike you're riding!"
	done

BikerTeddyBeatenText:
	text "Great job."
	done

GenericTrainerRoughneckBrian:
	generictrainer ROUGHNECK, BRIAN, EVENT_BEAT_ROUGHNECK_BRIAN, RoughneckBrianSeenText, RoughneckBrianBeatenText

	text "See you later!"
	line "Come back anytime!"
	done

RoughneckBrianSeenText:
	text "Hey, who told you"
	line "you could ride"
	cont "on this road?"
	done

RoughneckBrianBeatenText:
	text "Crash!"
	done

GenericTrainerRoughneckTheron:
	generictrainer ROUGHNECK, THERON, EVENT_BEAT_ROUGHNECK_THERON, RoughneckTheronSeenText, RoughneckTheronBeatenText

	text "You wanna join"
	line "my team?"

	para "Won't you give it"
	line "a try?"
	done

RoughneckTheronSeenText:
	text "I'll toughen you"
	line "up. Now, you come"
	cont "along with me."
	done

RoughneckTheronBeatenText:
	text "I lost. I lost!"
	done

GenericTrainerRoughneckMarkey:
	generictrainer ROUGHNECK, MARKEY, EVENT_BEAT_ROUGHNECK_MARKEY, RoughneckMarkeySeenText, RoughneckMarkeyBeatenText

	text "All right!"

	para "That fighting"
	line "yell was great!"
	done

RoughneckMarkeySeenText:
	text "Hey hey hey!"
	line "You're in my way!"

	para "IN MY WAY!"
	done

RoughneckMarkeyBeatenText:
	text "All right, thanks!"
	done

Route17SouthNotice1Text:
	text "It's a notice."

	para "Watch out for"
	line "discarded items!"
	done

Route17SouthTrainerTips1Text:
	text "Trainer Tips"

	para "All #mon are"
	line "unique."

	para "Two #mon of the"
	line "same species and"
	cont "level may still"

	para "look, act, and"
	line "grow differently."
	done

Route17SouthTrainerTips2Text:
	text "Trainer Tips"

	para "Open the Start"
	line "menu to stay in"
	cont "place while on a"
	cont "slope."
	done

Route17SouthNotice2Text:
	text "It's a notice."

	para "Don't throw the"
	line "game, throw #"
	cont "Balls instead!"
	done
