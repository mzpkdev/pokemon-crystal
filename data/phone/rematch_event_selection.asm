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
	no_rematch_phone_event_table                         ; JACK
	rematch_phone_event_table HueyPhoneEventSelection    ; HUEY
	no_rematch_phone_event_table                         ; GAVEN
	no_rematch_phone_event_table                         ; BETH
	no_rematch_phone_event_table                         ; JOSE
	no_rematch_phone_event_table                         ; REENA
	no_rematch_phone_event_table                         ; JOEY
	no_rematch_phone_event_table                         ; WADE
	no_rematch_phone_event_table                         ; RALPH
	no_rematch_phone_event_table                         ; LIZ
	rematch_phone_event_table AnthonyPhoneEventSelection ; ANTHONY
	no_rematch_phone_event_table                         ; TODD
	no_rematch_phone_event_table                         ; GINA
	no_rematch_phone_event_table                         ; ARNIE
	no_rematch_phone_event_table                         ; ALAN
	no_rematch_phone_event_table                         ; DANA
	no_rematch_phone_event_table                         ; CHAD
	no_rematch_phone_event_table                         ; TULLY
	no_rematch_phone_event_table                         ; BRENT
	no_rematch_phone_event_table                         ; TIFFANY
	no_rematch_phone_event_table                         ; VANCE
	no_rematch_phone_event_table                         ; WILTON
	no_rematch_phone_event_table                         ; PARRY
	no_rematch_phone_event_table                         ; ERIN
	assert_table_length NUM_REMATCH_CONTACTS

	assert REMATCH_CONTACT_HUEY == 1
	assert REMATCH_CONTACT_ANTHONY == 10
	assert BANK(RematchPhoneEventSelectionTables) == BANK(SelectRematchContactPhoneEvent)
	assert BANK(RematchPhoneEventCapabilities) == BANK(SelectRematchContactPhoneEvent)

HueyPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 2, 3
	phone_event_fallback PHONE_EVENT_FLAVOR

AnthonyPhoneEventSelection:
	phone_event_chance PHONE_EVENT_REMATCH, 1, 2
	phone_event_chance PHONE_EVENT_SWARM, 1, 5
	phone_event_fallback PHONE_EVENT_FLAVOR

	assert BANK(HueyPhoneEventSelection) == BANK(AnthonyPhoneEventSelection)
