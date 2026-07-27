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
	no_rematch_phone_event_table                         ; WADE: contest roll precedes its eligibility checks
	rematch_phone_event_table RalphPhoneEventSelection   ; RALPH
	rematch_phone_event_table LizPhoneEventSelection     ; LIZ
	rematch_phone_event_table AnthonyPhoneEventSelection ; ANTHONY
	rematch_phone_event_table ToddPhoneEventSelection    ; TODD
	no_rematch_phone_event_table                         ; GINA: gift odds depend on prior-gift state
	rematch_phone_event_table ArniePhoneEventSelection   ; ARNIE
	no_rematch_phone_event_table                         ; ALAN: gift odds depend on prior-gift state
	no_rematch_phone_event_table                         ; DANA: gift odds depend on prior-gift state
	rematch_phone_event_table ChadPhoneEventSelection    ; CHAD
	no_rematch_phone_event_table                         ; TULLY: gift odds depend on prior-gift state
	rematch_phone_event_table BrentPhoneEventSelection   ; BRENT
	no_rematch_phone_event_table                         ; TIFFANY: family and generic are distinct flavor results
	rematch_phone_event_table VancePhoneEventSelection   ; VANCE
	rematch_phone_event_table WiltonPhoneEventSelection  ; WILTON
	rematch_phone_event_table ParryPhoneEventSelection   ; PARRY
	rematch_phone_event_table ErinPhoneEventSelection    ; ERIN
	assert_table_length NUM_REMATCH_CONTACTS

RematchPhoneEventRepeatSelectionTables:
; Optional alternate policies selected by PHONE_EVENT_USE_REPEAT_POLICY.
; These remain null until a contact's repeat-gift odds are modeled.
	table_width 3
	rept NUM_REMATCH_CONTACTS
		no_rematch_phone_event_table
	endr
	assert_table_length NUM_REMATCH_CONTACTS

	assert REMATCH_CONTACT_HUEY == 1
	assert REMATCH_CONTACT_ANTHONY == 10
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

ChadPhoneEventSelection:
	phone_event_variant_chance PHONE_EVENT_RESULT_GOSSIP, PHONE_EVENT_FLAVOR, 1, 2
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_RARE_REPORT, 1, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

BrentPhoneEventSelection:
	phone_event_variant_chance PHONE_EVENT_RESULT_TRIVIA, PHONE_EVENT_FLAVOR, 1, 2
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
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

	assert BANK(JackPhoneEventSelection) == BANK(ErinPhoneEventSelection)
