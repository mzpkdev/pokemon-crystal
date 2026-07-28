MACRO rematch_phone_event_table
	dba \1
ENDM

MACRO no_rematch_phone_event_table
	db 0
	dw 0
ENDM

RematchPhoneEventSelectionTables:
; Canonical REMATCH_CONTACT_* order. Null entries are intentionally unmodeled
; and SelectRematchContactPhoneEvent returns PHONE_EVENT_NONE for them.
	table_width 3
	rematch_phone_event_table JackPhoneEventSelection    ; JACK
	rematch_phone_event_table HueyPhoneEventSelection    ; HUEY
	rematch_phone_event_table GavenPhoneEventSelection   ; GAVEN
	rematch_phone_event_table BethPhoneEventSelection    ; BETH
	rematch_phone_event_table JosePhoneEventSelection    ; JOSE
	rematch_phone_event_table ReenaPhoneEventSelection   ; REENA
	rematch_phone_event_table JoeyPhoneEventSelection    ; JOEY
	rematch_phone_event_table WadePhoneEventSelection    ; WADE
	rematch_phone_event_table RalphPhoneEventSelection   ; RALPH
	rematch_phone_event_table LizPhoneEventSelection     ; LIZ
	rematch_phone_event_table AnthonyPhoneEventSelection ; ANTHONY
	rematch_phone_event_table ToddPhoneEventSelection    ; TODD
	rematch_phone_event_table GinaPhoneEventSelection    ; GINA
	rematch_phone_event_table ArniePhoneEventSelection   ; ARNIE
	rematch_phone_event_table AlanPhoneEventSelection    ; ALAN
	rematch_phone_event_table DanaPhoneEventSelection    ; DANA
	rematch_phone_event_table ChadPhoneEventSelection    ; CHAD
	rematch_phone_event_table TullyPhoneEventSelection   ; TULLY
	rematch_phone_event_table BrentPhoneEventSelection   ; BRENT
	rematch_phone_event_table TiffanyPhoneEventSelection ; TIFFANY
	rematch_phone_event_table VancePhoneEventSelection   ; VANCE
	rematch_phone_event_table WiltonPhoneEventSelection  ; WILTON
	rematch_phone_event_table ParryPhoneEventSelection   ; PARRY
	rematch_phone_event_table ErinPhoneEventSelection    ; ERIN
	rematch_phone_event_table SourBasicPhoneEventSelection ; BRANDON
	rematch_phone_event_table SourRarePhoneEventSelection  ; WALT
	rematch_phone_event_table SourRarePhoneEventSelection  ; KRISE
	rematch_phone_event_table SourBasicPhoneEventSelection ; ALFRED
	rematch_phone_event_table BerryRematchPhoneEventSelection ; DOUG
	rematch_phone_event_table BerryRematchPhoneEventSelection ; ROB
	rept REMATCH_CONTACT_JAMIE - REMATCH_CONTACT_KYLE
		rematch_phone_event_table SourBasicPhoneEventSelection
	endr
	rematch_phone_event_table SourBasicPhoneEventSelection ; JAMIE
	rept REMATCH_CONTACT_AIDEN - REMATCH_CONTACT_TORIN
		rematch_phone_event_table SourBasicPhoneEventSelection
	endr
	rematch_phone_event_table SourBasicPhoneEventSelection ; AIDEN
	rematch_phone_event_table SourBasicPhoneEventSelection ; DALE
	rematch_phone_event_table SourBasicPhoneEventSelection ; REILLY
	rematch_phone_event_table SourBasicPhoneEventSelection ; KYLER
	assert_table_length NUM_REMATCH_CONTACTS

RematchPhoneEventRepeatSelectionTables:
; Optional alternate policies selected by PHONE_EVENT_USE_REPEAT_POLICY.
; Only contacts whose gift odds change after the first gift have entries.
	table_width 3
	no_rematch_phone_event_table                               ; JACK
	no_rematch_phone_event_table                               ; HUEY
	no_rematch_phone_event_table                               ; GAVEN
	no_rematch_phone_event_table                               ; BETH
	no_rematch_phone_event_table                               ; JOSE
	no_rematch_phone_event_table                               ; REENA
	no_rematch_phone_event_table                               ; JOEY
	no_rematch_phone_event_table                               ; WADE
	no_rematch_phone_event_table                               ; RALPH
	no_rematch_phone_event_table                               ; LIZ
	no_rematch_phone_event_table                               ; ANTHONY
	no_rematch_phone_event_table                               ; TODD
	rematch_phone_event_table GinaPhoneEventRepeatSelection    ; GINA
	no_rematch_phone_event_table                               ; ARNIE
	rematch_phone_event_table AlanPhoneEventRepeatSelection    ; ALAN
	rematch_phone_event_table DanaPhoneEventRepeatSelection    ; DANA
	no_rematch_phone_event_table                               ; CHAD
	rematch_phone_event_table TullyPhoneEventRepeatSelection   ; TULLY
	no_rematch_phone_event_table                               ; BRENT
	rematch_phone_event_table TiffanyPhoneEventRepeatSelection ; TIFFANY
	no_rematch_phone_event_table                               ; VANCE
	no_rematch_phone_event_table                               ; WILTON
	no_rematch_phone_event_table                               ; PARRY
	no_rematch_phone_event_table                               ; ERIN
	rept NUM_REMATCH_CONTACTS - REMATCH_CONTACT_BRANDON
		no_rematch_phone_event_table
	endr
	assert_table_length NUM_REMATCH_CONTACTS

	assert REMATCH_CONTACT_HUEY == 1
	assert REMATCH_CONTACT_WADE == 7
	assert REMATCH_CONTACT_ANTHONY == 10
	assert REMATCH_CONTACT_GINA == 12
	assert REMATCH_CONTACT_ALAN == 14
	assert REMATCH_CONTACT_DANA == 15
	assert REMATCH_CONTACT_TULLY == 17
	assert REMATCH_CONTACT_TIFFANY == 19
	assert BANK(RematchPhoneEventSelectionTables) == BANK(SelectRematchContactPhoneEvent)
	assert BANK(RematchPhoneEventRepeatSelectionTables) == BANK(SelectRematchContactPhoneEvent)
	assert BANK(RematchPhoneEventCapabilities) == BANK(SelectRematchContactPhoneEvent)

JackPhoneEventSelection:
	phone_event_variant_chance PHONE_EVENT_RESULT_TRIVIA, PHONE_EVENT_FLAVOR, 1, 2
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

HueyPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 2, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

AnthonyPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_SWARM, 1, 5
	phone_event_fallback PHONE_EVENT_FLAVOR

GavenPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

BethPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_fallback PHONE_EVENT_FLAVOR

JosePhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 3
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

ReenaPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_fallback PHONE_EVENT_FLAVOR

JoeyPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 2, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

WadePhoneEventSelection:
	phone_event_chance_always PHONE_EVENT_SPECIAL, 1, 2
	phone_event_chance PHONE_EVENT_GIFT, 1, 2
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

RalphPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_SWARM, 1, 5
	phone_event_fallback PHONE_EVENT_FLAVOR

LizPhoneEventSelection:
	phone_event_variant_chance PHONE_EVENT_RESULT_WRONG_NUMBER, PHONE_EVENT_FLAVOR, 1, 4
	phone_event_variant_chance PHONE_EVENT_RESULT_GOSSIP, PHONE_EVENT_FLAVOR, 1, 2
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_fallback PHONE_EVENT_FLAVOR

ToddPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_SPECIAL, 1, 2
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

ArniePhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_SWARM, 1, 5
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

GinaPhoneEventSelection:
	phone_event_chance PHONE_EVENT_GIFT, 1, 2
GinaPhoneEventRepeatSelection:
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

AlanPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 2
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_fallback PHONE_EVENT_FLAVOR

AlanPhoneEventRepeatSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_fallback PHONE_EVENT_FLAVOR

DanaPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 2
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

DanaPhoneEventRepeatSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

ChadPhoneEventSelection:
	phone_event_variant_chance PHONE_EVENT_RESULT_GOSSIP, PHONE_EVENT_FLAVOR, 1, 2
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

TullyPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 2
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_fallback PHONE_EVENT_FLAVOR

TullyPhoneEventRepeatSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_fallback PHONE_EVENT_FLAVOR

BrentPhoneEventSelection:
	phone_event_variant_chance PHONE_EVENT_RESULT_TRIVIA, PHONE_EVENT_FLAVOR, 1, 2
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_fallback PHONE_EVENT_FLAVOR

TiffanyPhoneEventSelection:
	phone_event_variant_chance PHONE_EVENT_RESULT_FAMILY, PHONE_EVENT_FLAVOR, 1, 4
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 2
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_fallback PHONE_EVENT_FLAVOR

TiffanyPhoneEventRepeatSelection:
	phone_event_variant_chance PHONE_EVENT_RESULT_FAMILY, PHONE_EVENT_FLAVOR, 1, 4
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_GIFT, 1, 11
	phone_event_fallback PHONE_EVENT_FLAVOR

VancePhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 2, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

WiltonPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_GIFT, 1, 2
	phone_event_fallback PHONE_EVENT_FLAVOR

ParryPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 2, 2
	phone_event_fallback PHONE_EVENT_FLAVOR

ErinPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 2, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

ExtendedPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_fallback PHONE_EVENT_FLAVOR

SourBasicPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

SourRarePhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 4
	phone_event_fallback PHONE_EVENT_FLAVOR

BerryRematchPhoneEventSelection:
	phone_event_chance PHONE_EVENT_GIFT, 1, 3
	phone_event_chance PHONE_EVENT_REMATCH, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

	assert BANK(JackPhoneEventSelection) == BANK(BerryRematchPhoneEventSelection)
