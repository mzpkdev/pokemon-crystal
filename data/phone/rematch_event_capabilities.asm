MACRO rematch_phone_event_capabilities
	db \1
ENDM

RematchPhoneEventCapabilities:
; Entries correspond exactly to REMATCH_CONTACT_*.
; This is descriptive metadata only: bit order is not event selection order.
	table_width 1
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR ; JACK
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; HUEY
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR ; GAVEN
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; BETH
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR ; JOSE
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; REENA
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; JOEY
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_SPECIAL | PHONE_EVENT_CAP_FLAVOR ; WADE
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_FLAVOR ; RALPH
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; LIZ
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_FLAVOR ; ANTHONY
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_SPECIAL | PHONE_EVENT_CAP_FLAVOR ; TODD
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR ; GINA
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_SWARM | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR ; ARNIE
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR ; ALAN
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR ; DANA
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_RARE_REPORT | PHONE_EVENT_CAP_FLAVOR ; CHAD
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR ; TULLY
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; BRENT
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR ; TIFFANY
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; VANCE
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_GIFT | PHONE_EVENT_CAP_FLAVOR ; WILTON
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; PARRY
	rematch_phone_event_capabilities PHONE_EVENT_CAP_REMATCH | PHONE_EVENT_CAP_FLAVOR ; ERIN
	assert_table_length NUM_REMATCH_CONTACTS

	assert REMATCH_CONTACT_JACK == 0
	assert REMATCH_CONTACT_ERIN == NUM_REMATCH_CONTACTS - 1

GetRematchPhoneEventCapabilities::
; Return every phone event type a rematch contact can produce.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry clear and a = PHONE_EVENT_CAP_* mask if valid
;         carry set and a = 0 if invalid
; Clobbers: de, hl
	cp NUM_REMATCH_CONTACTS
	jr nc, .invalid
	ld e, a
	ld d, 0
	ld hl, RematchPhoneEventCapabilities
	add hl, de
	ld a, [hl]
	and a
	ret

.invalid
	xor a
	scf
	ret
