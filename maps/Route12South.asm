Route12South_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event 11, 57, ROUTE_12_SUPER_ROD_HOUSE, 1
	warp_event  0, 42, ROUTE_11_GATE, 3
	warp_event  0, 43, ROUTE_11_GATE, 4
	warp_event 10,  1, ROUTE_12_GATE, 3

	def_coord_events

	def_bg_events
	bg_event 11, 43, BGEVENT_JUMPTEXT, Route12SignText
	bg_event 14, 15, BGEVENT_ITEM + ELIXIR, EVENT_ROUTE_12_HIDDEN_ELIXIR

	def_object_events
	object_event  7,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherMartin, -1
	object_event 14, 33, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerFisherStephen, -1
	object_event 12, 63, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerFisherBarney, -1
	object_event 10, 74, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerFisherKyler, -1
	object_event 10, 24, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerBird_keeperJustin, -1
	object_event  7, 57, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerBird_keeperGail, -1
	object_event 10, 39, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleVicandtara1, -1
	object_event 10, 38, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCoupleVicandtara2, -1
	object_event 14, 89, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	itemball_event  5, 68, CALCIUM, 1, EVENT_ROUTE_12_CALCIUM
	itemball_event  5, 82, NUGGET, 1, EVENT_ROUTE_12_NUGGET
	cuttree_event  6, 71, EVENT_ROUTE_12_CUT_TREE_1
	cuttree_event  9, 79, EVENT_ROUTE_12_CUT_TREE_2

GenericTrainerFisherMartin:
	generictrainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText

	text "I'm too impatient"
	line "for fishing…"
	done

FisherMartinSeenText:
	text "Patience is the"
	line "key to both fish-"
	cont "ing and #mon."
	done

FisherMartinBeatenText:
	text "Gwaaah!"
	done

GenericTrainerFisherStephen:
	generictrainer FISHER, STEPHEN, EVENT_BEAT_FISHER_STEPHEN, FisherStephenSeenText, FisherStephenBeatenText

	text "Have you checked"
	line "out Kanto's radio"

	para "programs? We get a"
	line "good variety here."
	done

FisherStephenSeenText:
	text "I feel so content,"
	line "fishing while lis-"
	cont "tening to some"
	cont "tunes on my radio."
	done

FisherStephenBeatenText:
	text "My stupid radio"
	line "distracted me!"
	done

GenericTrainerFisherBarney:
	generictrainer FISHER, BARNEY, EVENT_BEAT_FISHER_BARNEY, FisherBarneySeenText, FisherBarneyBeatenText

	text "I think electric-"
	line "ity is the most"

	para "important thing in"
	line "our daily lives."

	para "If it weren't,"
	line "people wouldn't"

	para "have made such a"
	line "fuss when the"

	para "Power Plant went"
	line "out of commission."
	done

FisherBarneySeenText:
	text "What's most impor-"
	line "tant in our every-"
	cont "day lives?"
	done

FisherBarneyBeatenText:
	text "The answer is"
	line "coming up next!"
	done

TrainerFisherKyler:
	trainer FISHER, KYLER, EVENT_BEAT_FISHER_KYLER, .SeenText, .BeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_KYLER
	opentext
	setval REMATCH_CONTACT_KYLER
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_FISHER_KYLER
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_KYLER_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_KYLER_ASKED_FOR_PHONE_NUMBER
	writetext Route12KylerAskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext Route12KylerAskAgainText
.Ask:
	askforphonenumber PHONE_FISHER_KYLER
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext Route12KylerAcceptedText
	waitbutton
	endtext
.Full:
	writetext Route12KylerPhoneFullText
	waitbutton
	endtext
.Declined:
	writetext Route12KylerDeclinedText
	waitbutton
	endtext
.Rematch:
	writetext Route12KylerRematchText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight4
	checkflag ENGINE_FLYPOINT_CINNABAR
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer FISHER, KYLER
	sjumpfwd .Battle
.Fight2:
	loadtrainer FISHER, KYLER2
	sjumpfwd .Battle
.Fight3:
	loadtrainer FISHER, KYLER3
	sjumpfwd .Battle
.Fight4:
	loadtrainer FISHER, KYLER4
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_KYLER
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Really? Rather"
	line "than always catch-"
	cont "ing new #mon,"

	para "it's good to train"
	line "them?"
	done

.SeenText:
	text "#mon battles"
	line "lure people in!"
	done

.BeatenText:
	text "My #mon bucket"
	line "is empty!"
	done

Route12KylerAskNumberText:
	text "Let's trade fish"
	line "stories by phone."

	para "How about your"
	line "number?"
	done

Route12KylerAskAgainText:
	text "Want to trade"
	line "fishing stories?"
	done

Route12KylerAcceptedText:
	text "Maybe we'll hook"
	line "a legend!"
	done

Route12KylerPhoneFullText:
	text "Your phone's"
	line "memory is full."
	done

Route12KylerDeclinedText:
	text "I'll keep fishing"
	line "on my own, then."
	done

Route12KylerRematchText:
	text "A battle is on!"
	line "Let's reel it in!"
	done

GenericTrainerBird_keeperJustin:
	generictrainer BIRD_KEEPER, BIRD_KEEPER_JUSTIN, EVENT_BEAT_BIRD_KEEPER_JUSTIN, .SeenText, .BeatenText

	text "Since the wind has"
	line "changed, I'll lay"
	cont "low…"
	done

.SeenText:
	text "Huh? The wind has"
	line "changed direction!"
	done

.BeatenText:
	text "Phew…"
	done

GenericTrainerBird_keeperGail:
	generictrainer BIRD_KEEPER, GAIL, EVENT_BEAT_BIRD_KEEPER_GAIL, .SeenText, .BeatenText

	text "Chuun-Chuun?"
	line "Chunchun!"
	done

.SeenText:
	text "BASABASABASA-"
	line "BASABASA!"
	done

.BeatenText:
	text "Pyopyopyopyo…"
	done

GenericTrainerCoupleVicandtara1:
	generictrainer COUPLE, VICANDTARA1, EVENT_BEAT_COUPLE_VIC_AND_TARA, .SeenText, .BeatenText

	text "Vic: Tara already"
	line "saw me humiliated…"
	done

.SeenText:
	text "Vic: All right!"
	line "I'll be able to"
	cont "show off for Tara!"
	done

.BeatenText:
	text "Vic: Oh no, my"
	line "plans!"
	done

GenericTrainerCoupleVicandtara2:
	generictrainer COUPLE, VICANDTARA2, EVENT_BEAT_COUPLE_VIC_AND_TARA, .SeenText, .BeatenText

	text "Tara: Even though"
	line "my boyfriend lost,"
	cont "he's still wonder-"
	cont "ful."
	done

.SeenText:
	text "Tara: I love to"
	line "look at my boy-"
	cont "friend's face while"
	cont "he's battling!"
	done

.BeatenText:
	text "Tara: Oh no,"
	line "oh no…"
	done

Route12SignText:
	text "Route 12"

	para "North to Lavender"
	line "Town"
	done
