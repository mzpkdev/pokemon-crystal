LizPhoneScript1:
	gettrainername PICNICKER, LIZ1, STRING_BUFFER_3
	setval REMATCH_CONTACT_LIZ
	special Special_CheckRematchPending
	iftruefwd .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	setval REMATCH_CONTACT_LIZ
	special Special_TryClaimRematchScheduleWindow
	iftruefwd LizScheduledRematch

.NotThursday:
	special RandomPhoneMon
	farsjump LizHangUpScript

.WantsBattle:
	getlandmarkname ROUTE_32, STRING_BUFFER_5
	farsjump LizReminderScript

LizPhoneScript2:
	gettrainername PICNICKER, LIZ1, STRING_BUFFER_3
	setval REMATCH_CONTACT_LIZ
	special Special_CheckRematchPending
	iftruefwd .CheckGoldenrod
	setval REMATCH_CONTACT_LIZ
	special Special_CheckRematchScheduleUsed

.CheckGoldenrod:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalsefwd .NoRematch
	setval PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates
	sjumpfwd .SelectEvent

.NoRematch:
	setval PHONE_EVENT_CAP_FLAVOR
	special Special_StageRematchPhoneEventCandidates

.SelectEvent:
	setval REMATCH_CONTACT_LIZ
	special Special_SelectRematchContactPhoneEvent
	ifequalfwd PHONE_EVENT_RESULT_WRONG_NUMBER, LizWrongNumber
	ifequalfwd PHONE_EVENT_RESULT_GOSSIP, .Gossip
	ifequalfwd PHONE_EVENT_REMATCH, .Rematch
	farscall PhoneScript_GreetPhone_Female

.Generic:
	farsjump Phone_GenericCall_Female

.Gossip:
	farscall PhoneScript_GreetPhone_Female
	sjumpfwd LizGossip

.Rematch:
	farscall PhoneScript_GreetPhone_Female
	sjumpfwd LizWantsBattle

LizWantsBattle:
	setval REMATCH_CONTACT_LIZ
	special Special_MarkRematchScheduleUsed

LizScheduledRematch:
	getlandmarkname ROUTE_32, STRING_BUFFER_5
	setval REMATCH_CONTACT_LIZ
	special Special_OfferRematch
	farsjump PhoneScript_WantsToBattle_Female

LizWrongNumber:
	farsjump LizWrongNumberScript

LizGossip:
	random $9
	ifequalfwd $0, .CoolTrainerM
	ifequalfwd $1, .Beauty
	ifequalfwd $2, .Grunt
	ifequalfwd $3, .Teacher
	ifequalfwd $4, .SwimmerF
	ifequalfwd $5, .KimonoGirl
	ifequalfwd $6, .Skier
	ifequalfwd $7, .Medium
	ifequalfwd $8, .PokefanM

.CoolTrainerM:
	gettrainerclassname COOLTRAINERM, STRING_BUFFER_4
	sjumpfwd LizGossipScript

.Beauty:
	gettrainerclassname BEAUTY, STRING_BUFFER_4
	sjumpfwd LizGossipScript

.Grunt:
	gettrainerclassname GRUNTM, STRING_BUFFER_4
	sjumpfwd LizGossipScript

.Teacher:
	gettrainerclassname TEACHER_F, STRING_BUFFER_4
	sjumpfwd LizGossipScript

.SwimmerF:
	gettrainerclassname SWIMMERF, STRING_BUFFER_4
	sjumpfwd LizGossipScript

.KimonoGirl:
	gettrainerclassname KIMONO_GIRL, STRING_BUFFER_4
	sjumpfwd LizGossipScript

.Skier:
	gettrainerclassname SKIER, STRING_BUFFER_4
	sjumpfwd LizGossipScript

.Medium:
	gettrainerclassname MEDIUM, STRING_BUFFER_4
	sjumpfwd LizGossipScript

.PokefanM:
	gettrainerclassname POKEFANM, STRING_BUFFER_4
	; fallthrough

LizGossipScript:
	farsjump LizGossipRandomScript
