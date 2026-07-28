Route13_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 35, 13, BGEVENT_JUMPTEXT, Route13TrainerTips1Text
	bg_event 53,  5, BGEVENT_JUMPTEXT, Route13TrainerTips2Text
	bg_event 51, 11, BGEVENT_JUMPTEXT, Route13SignText
	bg_event 17, 13, BGEVENT_JUMPTEXT, Route13DirectionsSignText
	bg_event 36, 13, BGEVENT_ITEM + CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM
	bg_event  5, 15, BGEVENT_ITEM + OVAL_STONE, EVENT_ROUTE_13_HIDDEN_OVAL_STONE

	def_object_events
	object_event  5,  5, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 1, GenericTrainerCamperClark, -1
	object_event 16,  6, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPicnickerGinger, -1
	object_event 60, 11, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 5, GenericTrainerBird_keeperPerry, -1
	object_event 64,  1, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerBird_keeperBret, -1
	object_event 34,  5, SPRITE_CAMPER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerCamperTanner, -1
	object_event 65,  9, SPRITE_PICNICKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPicnickerPiper, -1
	object_event 52,  6, SPRITE_COOL_DUDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCoupleTimandsue1, -1
	object_event 53,  6, SPRITE_CUTE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerCoupleTimandsue2, -1
	object_event 38,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanmAlex, -1
	object_event 21, 13, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Route13GrampsScript, -1
	cuttree_event 54,  4, EVENT_ROUTE_13_CUT_TREE

Route13GrampsScript:
	special CheckIfTrendyPhraseIsLucky
	iftruefwd .lucky
	jumpthistextfaceplayer

	text "I can't see Lucky"
	line "Island today…"

	para "But I know it's"
	line "appeared before!"
	done

.lucky
	jumpthistextfaceplayer

	text "I can see Lucky"
	line "Island today!"
	cont "What a spectacle!"
	done

GenericTrainerCamperClark:
	generictrainer CAMPER, CLARK, EVENT_BEAT_CAMPER_CLARK, .SeenText, .BeatenText

	text "It doesn't matter"
	line "what kind of prep"
	cont "work you've done."

	para "If you lose, you"
	line "lose."
	done

.SeenText:
	text "Collect water!"
	line "Don't let the fire"
	cont "go out!"

	para "Look out for wild"
	line "#mon!"

	para "Let's go,"
	line "Campfire!"
	done

.BeatenText:
	text "Pfuuuuhh…"
	done

GenericTrainerPicnickerGinger:
	generictrainer PICNICKER, GINGER, EVENT_BEAT_PICNICKER_GINGER, .SeenText, .BeatenText

	text "You can communi-"
	line "cate with #mon"

	para "through whistling"
	line "instead of words!"
	done

.SeenText:
	text "Why do I always"
	line "get the urge to"
	cont "whistle outdoors?"
	done

.BeatenText:
	text "Tweeee!"
	done

GenericTrainerBird_keeperPerry:
	generictrainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, Bird_keeperPerrySeenText, Bird_keeperPerryBeatenText

	text "Your #mon are"
	line "remarkably well-"
	cont "trained."
	done

Bird_keeperPerrySeenText:
	text "Agility is the key"
	line "attribute of bird"
	cont "#mon."
	done

Bird_keeperPerryBeatenText:
	text "You beat me with"
	line "your speed…"
	done

GenericTrainerBird_keeperBret:
	generictrainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, Bird_keeperBretSeenText, Bird_keeperBretBeatenText

	text "If you groom them,"
	line "#mon get happy."
	done

Bird_keeperBretSeenText:
	text "Check out my #-"
	line "mon. Just look at"

	para "their coloring and"
	line "their plumage."
	done

Bird_keeperBretBeatenText:
	text "Shoot!"
	line "Not good enough!"
	done

TrainerCamperTanner:
	trainer CAMPER, TANNER, EVENT_BEAT_CAMPER_TANNER, .SeenText, .BeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_CAMPER_TANNER
	opentext
	setval REMATCH_CONTACT_TANNER
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_CAMPER_TANNER
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_TANNER_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_TANNER_ASKED_FOR_PHONE_NUMBER
	writetext Route13TannerAskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext Route13TannerAskAgainText
.Ask:
	askforphonenumber PHONE_CAMPER_TANNER
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext Route13TannerAcceptedText
	waitbutton
	endtext
.Full:
	writetext Route13PhoneFullText
	waitbutton
	endtext
.Declined:
	writetext Route13TannerDeclinedText
	waitbutton
	endtext
.Rematch:
	writetext Route13TannerRematchText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer CAMPER, TANNER
	sjumpfwd .Battle
.Fight2:
	loadtrainer CAMPER, TANNER2
	sjumpfwd .Battle
.Fight3:
	loadtrainer CAMPER, TANNER3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_TANNER
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "I figured it would"
	line "be easy to knock"
	cont "you out…"
	done

.SeenText:
	text "I can fit in a"
	line "quick battle while"
	cont "preparing a meal!"
	done

.BeatenText:
	text "Oh, I'm hungry…"
	done

GenericTrainerPicnickerPiper:
	generictrainer PICNICKER, PIPER, EVENT_BEAT_PICNICKER_PIPER, .SeenText, .BeatenText

	text "The way you were"
	line "walking made me"
	cont "think I could win."
	done

.SeenText:
	text "How about we bring"
	line "out your #mon"

	para "and mine for a"
	line "battle?"
	done

.BeatenText:
	text "Oh, that's too"
	line "bad…"
	done

TrainerCoupleTimandsue1:
	trainer COUPLE, TIMANDSUE1, EVENT_BEAT_COUPLE_TIM_AND_SUE, .SeenText, .BeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_COUPLE_TIM_AND_SUE
	opentext
	setval REMATCH_CONTACT_TIM_AND_SUE
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_COUPLE_TIM_AND_SUE
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_TIM_AND_SUE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_TIM_AND_SUE_ASKED_FOR_PHONE_NUMBER
.AskAgain:
	scall Route13TimAndSuePhoneRegistration
	end
.Rematch:
	writetext Route13TimAndSueRematchText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer COUPLE, TIMANDSUE1
	sjumpfwd .Battle
.Fight2:
	loadtrainer COUPLE, TIMANDSUE3
	sjumpfwd .Battle
.Fight3:
	loadtrainer COUPLE, TIMANDSUE5
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_TIM_AND_SUE
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Tim: If you've"
	line "beaten her, you"
	cont "must be strong!"
	done

.SeenText:
	text "Tim: I'll give you"
	line "a little hint."

	para "My girlfriend's"
	line "stronger than me!"
	done

.BeatenText:
	text "Tim: You're the"
	line "strongest!"
	done

TrainerCoupleTimandsue2:
	trainer COUPLE, TIMANDSUE2, EVENT_BEAT_COUPLE_TIM_AND_SUE, .SeenText, .BeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_COUPLE_TIM_AND_SUE
	opentext
	setval REMATCH_CONTACT_TIM_AND_SUE
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_COUPLE_TIM_AND_SUE
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_TIM_AND_SUE_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_TIM_AND_SUE_ASKED_FOR_PHONE_NUMBER
.AskAgain:
	scall Route13TimAndSuePhoneRegistration
	end
.Rematch:
	writetext Route13TimAndSueRematchText
	waitbutton
	closetext
	winlosstext .BeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer COUPLE, TIMANDSUE2
	sjumpfwd .Battle
.Fight2:
	loadtrainer COUPLE, TIMANDSUE4
	sjumpfwd .Battle
.Fight3:
	loadtrainer COUPLE, TIMANDSUE6
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_TIM_AND_SUE
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Sue: That strength"
	line "of yours…"
	cont "I've got it!"

	para "Are you in love?"
	done

.SeenText:
	text "Sue: Women who"
	line "don't take love"

	para "seriously might"
	line "get hurt."
	done

.BeatenText:
	text "Sue: Wa ha…"
	done

GenericTrainerPokefanmAlex:
	generictrainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText

	text "Doesn't everyone"
	line "wish to someday be"
	cont "a king?"
	done

PokefanmAlexSeenText:
	text "Bow down before my"
	line "regal #mon!"
	done

PokefanmAlexBeatenText:
	text "How… How dare you"
	line "mock royalty!"
	done

GenericTrainerPokefanmJoshua:
	generictrainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText

	text "You look like you"
	line "have many #mon,"

	para "but Pikachu is"
	line "still the best."
	done

PokefanmJoshuaSeenText:
	text "Nihihi! Would you"
	line "like to battle my"
	cont "Pikachu gang?"
	done

PokefanmJoshuaBeatenText:
	text "Pi-Pikachu!"
	done

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_HIKER_KENNY
	opentext
	setval REMATCH_CONTACT_KENNY
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_HIKER_KENNY
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_KENNY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_KENNY_ASKED_FOR_PHONE_NUMBER
	writetext Route13KennyAskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext Route13KennyAskAgainText
.Ask:
	askforphonenumber PHONE_HIKER_KENNY
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext Route13KennyAcceptedText
	waitbutton
	endtext
.Full:
	writetext Route13PhoneFullText
	waitbutton
	endtext
.Declined:
	writetext Route13KennyDeclinedText
	waitbutton
	endtext
.Rematch:
	writetext Route13KennyRematchText
	waitbutton
	closetext
	winlosstext HikerKennyBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer HIKER, KENNY
	sjumpfwd .Battle
.Fight2:
	loadtrainer HIKER, KENNY2
	sjumpfwd .Battle
.Fight3:
	loadtrainer HIKER, KENNY3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_KENNY
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Geological fea-"
	line "tures don't appear"
	cont "to change."

	para "But they actually"
	line "change, little by"
	cont "little."
	done

HikerKennySeenText:
	text "I should go to"
	line "Rock Tunnel to get"
	cont "myself an Onix."
	done

HikerKennyBeatenText:
	text "I lost…"
	done

Route13TimAndSuePhoneRegistration:
	writetext Route13TimAndSueAskNumberText
	askforphonenumber PHONE_COUPLE_TIM_AND_SUE
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext Route13TimAndSueAcceptedText
	waitbutton
	endtext
.Full:
	writetext Route13PhoneFullText
	waitbutton
	endtext
.Declined:
	writetext Route13TimAndSueDeclinedText
	waitbutton
	endtext

Route13TannerAskNumberText:
	text "Camping is more"
	line "fun with friends."
	para "Want to exchange"
	line "phone numbers?"
	done

Route13TannerAskAgainText:
	text "Want to talk about"
	line "camping by phone?"
	done

Route13TannerAcceptedText:
	text "I'll call when I'm"
	line "ready to battle!"
	done

Route13TannerDeclinedText:
	text "Maybe after the"
	line "next campfire."
	done

Route13TannerRematchText:
	text "The fire's ready,"
	line "and so am I!"
	done

Route13KennyAskNumberText:
	text "I can tell you"
	line "of mountain life"
	cont "over the phone."
	para "Want my number?"
	done

Route13KennyAskAgainText:
	text "Want to hear about"
	line "mountain life?"
	done

Route13KennyAcceptedText:
	text "I'll call from the"
	line "mountains!"
	done

Route13KennyDeclinedText:
	text "The mountains will"
	line "still be here."
	done

Route13KennyRematchText:
	text "Let's see how much"
	line "we've changed!"
	done

Route13TimAndSueAskNumberText:
	text "Sue: Let's swap"
	line "phone numbers!"
	para "We can talk about"
	line "love and battles!"
	done

Route13TimAndSueAcceptedText:
	text "Sue: We'll call"
	line "you together!"
	done

Route13TimAndSueDeclinedText:
	text "Sue: Maybe love"
	line "needs more time."
	done

Route13TimAndSueRematchText:
	text "Sue: We're both"
	line "ready this time!"
	done

Route13PhoneFullText:
	text "Your phone's"
	line "memory is full."
	done

Route13TrainerTips1Text:
	text "Trainer Tips"

	para "Look! Right there,"
	line "at the left side"
	cont "of the post."
	done

Route13TrainerTips2Text:
	text "Trainer Tips"

	para "Some #mon need"
	line "items to evolve."

	para "If you're lucky,"
	line "a wild #mon can"

	para "be found holding"
	line "its own evolution"
	cont "item!"
	done

Route13SignText:
	text "Route 13"

	para "North to Silence"
	line "Bridge"
	done

Route13DirectionsSignText:
	text "North to Lavender"
	line "Town"

	para "West to Fuchsia"
	line "City"
	done
