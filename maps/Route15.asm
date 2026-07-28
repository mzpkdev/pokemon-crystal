Route15_MapScriptHeader:
	def_scene_scripts

	def_callbacks

	def_warp_events
	warp_event  4,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  4,  5, ROUTE_15_FUCHSIA_GATE, 4

	def_coord_events

	def_bg_events
	bg_event 19,  9, BGEVENT_JUMPTEXT, Route15SignText

	def_object_events
	object_event 10, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolboyTommy, -1
	object_event 27, 10, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	object_event 33, 10, SPRITE_SCHOOLGIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 3, GenericTrainerSchoolgirlFaith, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, PAL_NPC_DARK_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 30,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 2, GenericTrainerPokefanfBoone, -1
	object_event 14,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, 0, OBJECTTYPE_GENERICTRAINER, 4, GenericTrainerPokefanfEleanor, -1
	object_event 19,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerTwinsKayandtia1, -1
	object_event 20,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerTwinsKayandtia2, -1
	itemball_event 12,  5, PP_UP, 1, EVENT_ROUTE_15_PP_UP
	cuttree_event 43,  5, EVENT_ROUTE_14_CUT_TREE_3

GenericTrainerTeacherColette:
	generictrainer TEACHER_F, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText

	text "Before I became a"
	line "teacher, I used to"

	para "forget a lot of"
	line "things."
	done

TrainerTeacherHillary:
	trainer TEACHER_F, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script, TRAINERPAL_DARK_TEACHER_F

.Script:
	loadvar VAR_CALLERID, PHONE_TEACHER_HILLARY
	opentext
	setval REMATCH_CONTACT_HILLARY
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_TEACHER_HILLARY
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_HILLARY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_HILLARY_ASKED_FOR_PHONE_NUMBER
	writetext .AskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext .AskAgainText
.Ask:
	askforphonenumber PHONE_TEACHER_HILLARY
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
	winlosstext TeacherHillaryBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer TEACHER_F, HILLARY
	sjumpfwd .Battle
.Fight2:
	loadtrainer TEACHER_F, HILLARY2
	sjumpfwd .Battle
.Fight3:
	loadtrainer TEACHER_F, HILLARY3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_HILLARY
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Studying is impor-"
	line "tant, but exercise"
	cont "is just as vital."
	done

.AskNumberText:
	text "We can discuss"
	line "training routines."

	para "May I register"
	line "your number?"
	done

.AskAgainText:
	text "May I register"
	line "your number now?"
	done

.AcceptedText:
	text "Thank you. I'll"
	line "call you later."
	done

.DeclinedText:
	text "Very well. Another"
	line "time, perhaps."
	done

.PhoneFullText:
	text "Your phone list"
	line "is full."
	done

.RematchText:
	text "Today's exercise"
	line "is a battle!"
	done

GenericTrainerSchoolboyKipp:
	generictrainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText

	text "My mom worries so"
	line "much about me, I"

	para "have to phone her"
	line "all the time."
	done

GenericTrainerSchoolboyTommy:
	generictrainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText

	text "Sayonara! I just"
	line "learned that in my"
	cont "Japanese class."
	done

TrainerSchoolboyBilly:
	trainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_BILLY
	opentext
	setval REMATCH_CONTACT_BILLY
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_SCHOOLBOY_BILLY
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_BILLY_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_BILLY_ASKED_FOR_PHONE_NUMBER
	writetext .AskNumberText
	sjumpfwd .Ask
.AskAgain:
	writetext .AskAgainText
.Ask:
	askforphonenumber PHONE_SCHOOLBOY_BILLY
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
	winlosstext SchoolboyBillyBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer SCHOOLBOY, BILLY
	sjumpfwd .Battle
.Fight2:
	loadtrainer SCHOOLBOY, BILLY2
	sjumpfwd .Battle
.Fight3:
	loadtrainer SCHOOLBOY, BILLY3
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_BILLY
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "If #mon were a"
	line "subject at school,"
	cont "I'd be the best!"
	done

.AskNumberText:
	text "Let's talk about"
	line "#mon training!"

	para "Can I register"
	line "your number?"
	done

.AskAgainText:
	text "Can I register"
	line "your number now?"
	done

.AcceptedText:
	text "Great! I'll call"
	line "after gym class!"
	done

.DeclinedText:
	text "Aw, no! Maybe next"
	line "time."
	done

.PhoneFullText:
	text "Your phone list"
	line "is full."
	done

.RematchText:
	text "Class is in!"
	line "Let's battle!"
	done

GenericTrainerSchoolgirlFaith:
	generictrainer SCHOOLGIRL, FAITH, EVENT_BEAT_SCHOOLGIRL_FAITH, SchoolgirlFaithSeenText, SchoolgirlFaithBeatenText

	text "I'm tired of walk-"
	line "ing. I need to"
	cont "take a break."
	done

GenericTrainerPokefanfBoone:
	generictrainer POKEFANF, BOONE, EVENT_BEAT_POKEFANF_BOONE, PokefanfBooneSeenText, PokefanfBooneBeatenText

	text "When you battle,"
	line "you get to see"
	cont "#mon you've"
	cont "never seen before."

	para "It's so great!"
	done

GenericTrainerPokefanfEleanor:
	generictrainer POKEFANF, ELEANOR, EVENT_BEAT_POKEFANF_ELEANOR, PokefanfEleanorSeenText, PokefanfEleanorBeatenText

	text "My #mon aren't"
	line "weak! Your #mon"
	cont "are too strong!"
	done

TrainerTwinsKayandtia1:
	trainer TWINS, KAYANDTIA1, EVENT_BEAT_TWINS_KAY_AND_TIA, TwinsKayandtia1SeenText, TwinsKayandtia1BeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_TWINS_KAY_AND_TIA
	opentext
	setval REMATCH_CONTACT_KAY_AND_TIA
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_TWINS_KAY_AND_TIA
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_KAY_AND_TIA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_KAY_AND_TIA_ASKED_FOR_PHONE_NUMBER
.AskAgain:
	scall Route15KayAndTiaPhoneRegistration
	end
.Rematch:
	writetext Route15KayAndTiaRematchText
	waitbutton
	closetext
	winlosstext TwinsKayandtia1BeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer TWINS, KAYANDTIA1
	sjumpfwd .Battle
.Fight2:
	loadtrainer TWINS, KAYANDTIA3
	sjumpfwd .Battle
.Fight3:
	loadtrainer TWINS, KAYANDTIA5
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_KAY_AND_TIA
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Absolute truth--"
	line "I'm Kay! Maybe…"
	done

TrainerTwinsKayandtia2:
	trainer TWINS, KAYANDTIA2, EVENT_BEAT_TWINS_KAY_AND_TIA, TwinsKayandtia2SeenText, TwinsKayandtia2BeatenText, 0, .Script
.Script:
	loadvar VAR_CALLERID, PHONE_TWINS_KAY_AND_TIA
	opentext
	setval REMATCH_CONTACT_KAY_AND_TIA
	special Special_CheckRematchPending
	iftruefwd .Rematch
	checkcellnum PHONE_TWINS_KAY_AND_TIA
	iftrue_jumpopenedtext .AfterBattleText
	checkevent EVENT_KAY_AND_TIA_ASKED_FOR_PHONE_NUMBER
	iftruefwd .AskAgain
	writetext .AfterBattleText
	promptbutton
	setevent EVENT_KAY_AND_TIA_ASKED_FOR_PHONE_NUMBER
.AskAgain:
	scall Route15KayAndTiaPhoneRegistration
	end
.Rematch:
	writetext Route15KayAndTiaRematchText
	waitbutton
	closetext
	winlosstext TwinsKayandtia2BeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftruefwd .Fight3
	checkflag ENGINE_FLYPOINT_PEWTER
	iftruefwd .Fight2
	loadtrainer TWINS, KAYANDTIA2
	sjumpfwd .Battle
.Fight2:
	loadtrainer TWINS, KAYANDTIA4
	sjumpfwd .Battle
.Fight3:
	loadtrainer TWINS, KAYANDTIA6
.Battle:
	startbattle
	reloadmapafterbattle
	setval REMATCH_CONTACT_KAY_AND_TIA
	special Special_ConsumeRematch
	end

.AfterBattleText:
	text "Maybe truth--I'm"
	line "Tia! Absolutely!"
	done

Route15KayAndTiaPhoneRegistration:
	writetext Route15KayAndTiaAskNumberText
	askforphonenumber PHONE_TWINS_KAY_AND_TIA
	ifequalfwd PHONE_CONTACTS_FULL, .Full
	ifequalfwd PHONE_CONTACT_REFUSED, .Declined
	writetext Route15KayAndTiaAcceptedText
	waitbutton
	endtext
.Full:
	writetext Route15KayAndTiaPhoneFullText
	waitbutton
	endtext
.Declined:
	writetext Route15KayAndTiaDeclinedText
	waitbutton
	endtext

Route15KayAndTiaAskNumberText:
	text "Kay: Let's trade"
	line "phone numbers!"

	para "Tia: Absolutely!"
	done

Route15KayAndTiaAcceptedText:
	text "Kay: We'll call!"
	line "Tia: Together!"
	done

Route15KayAndTiaDeclinedText:
	text "Kay: Maybe later?"
	line "Tia: Absolutely!"
	done

Route15KayAndTiaPhoneFullText:
	text "Kay: Your phone"
	line "list is full."
	done

Route15KayAndTiaRematchText:
	text "Kay: We're ready!"
	line "Tia: Battle us!"
	done

TeacherColetteSeenText:
	text "Have you forgotten"
	line "anything?"
	done

TeacherColetteBeatenText:
	text "Kyaaah!"
	done

TeacherHillarySeenText:
	text "On sunny days, I"
	line "think that the"

	para "kids would rather"
	line "be playing in the"

	para "schoolyard than"
	line "studying in class."
	done

TeacherHillaryBeatenText:
	text "I didn't want to"
	line "lose…"
	done

SchoolboyKippSeenText:
	text "Hang on. I have to"
	line "phone my mom."
	done

SchoolboyKippBeatenText:
	text "Sorry, Mom!"
	line "I was beaten!"
	done

SchoolboyTommySeenText:
	text "Let's battle."
	line "I won't lose!"
	done

SchoolboyTommyBeatenText:
	text "I forgot to do my"
	line "homework!"
	done

SchoolgirlFaithSeenText:
	text "We're on a field"
	line "trip to Lavender"

	para "Radio Tower for"
	line "social studies."
	done

SchoolgirlFaithBeatenText:
	text "You're wickedly"
	line "tough!"
	done

SchoolboyBillySeenText:
	text "My favorite class"
	line "is gym!"
	done

SchoolboyBillyBeatenText:
	text "Oh, no!"
	line "How could I lose?"
	done

PokefanfBooneSeenText:
	text "Hey, your"
	line "#mon…"

	para "Show me. Show me."
	line "Show me!"
	done

PokefanfBooneBeatenText:
	text "Yay! That was"
	line "great!"
	done

PokefanfEleanorSeenText:
	text "All right,"
	line "#mon, time for"
	cont "a battle!"
	done

PokefanfEleanorBeatenText:
	text "Oh, well…"
	done

TwinsKayandtia1SeenText:
	text "We're the twins"
	line "Kay and Tia!"

	para "Do you know which"
	line "one I am?"
	done

TwinsKayandtia1BeatenText:
	text "Tia and Kay both"
	line "lost…"
	done

TwinsKayandtia2SeenText:
	text "We're the twins"
	line "Kay and Tia!"

	para "Do you know which"
	line "one I am?"
	done

TwinsKayandtia2BeatenText:
	text "Tia and Kay both"
	line "lost…"
	done

Route15SignText:
	text "Route 15"

	para "Fuchsia City -"
	line "Lavender Town"
	done
