SelectPhoneEvent::
; Select the first successful event from an ordered far-addressed table.
;
; Input:
;   a  = PHONE_EVENT_CAP_* candidate mask
;   b  = selection table ROM bank
;   hl = selection table address
;
; Each four-byte table entry is a PHONE_EVENT_RESULT_* value, the broad
; PHONE_EVENT_* capability that gates it, then a numerator and denominator.
; Nonzero denominators select when RandomRange(denominator) returns less than
; numerator. Disabled capabilities are skipped without calling RandomRange.
; A zero numerator and denominator are the deterministic terminal fallback.
;
; Output:
;   carry clear, a = selected PHONE_EVENT_RESULT_*
;   carry set,   a = PHONE_EVENT_NONE if the terminal fallback is disabled,
;                or if the table is malformed
;
; Clobbers: bc, de, hl
	ld c, a
	ld d, b
	ld e, MAX_PHONE_EVENT_SELECTION_ENTRIES

.next
	push de

	ld a, d
	call GetFarByte
	inc hl
	ld b, a

	ld a, d
	call GetFarByte
	inc hl
	push af

	ld a, d
	call GetFarByte
	inc hl
	ld e, a

	ld a, d
	call GetFarByte
	inc hl
	ld d, a

	ld a, b
	and a
	jr z, .invalid_cap_on_stack
	cp NUM_PHONE_EVENT_RESULTS
	jr nc, .invalid_cap_on_stack

	ld a, d
	and a
	jr z, .validate_fallback
	ld a, e
	and a
	jr z, .invalid_cap_on_stack
	cp d
	jr z, .valid_entry
	jr nc, .invalid_cap_on_stack
	jr .valid_entry

.validate_fallback
	ld a, e
	and a
	jr nz, .invalid_cap_on_stack

.valid_entry
	pop af
	and a
	jr z, .invalid
	cp NUM_PHONE_EVENTS
	jr nc, .invalid

	; Convert the broad PHONE_EVENT_* capability to its corresponding bit.
	dec a
	push bc
	ld b, a
	and a
	ld a, 1
	jr z, .got_capability
.shift_capability
	add a
	dec b
	jr nz, .shift_capability
.got_capability
	pop bc
	and c
	jr z, .disabled

	ld a, d
	and a
	jr z, .selected
	push hl
	call RandomRange
	pop hl
	cp e
	jr c, .selected

.continue
	pop de
	dec e
	jr nz, .next
	jr .failed

.disabled
	; A fallback is terminal even when it is not in the candidate mask.
	ld a, d
	and a
	jr nz, .continue
	jr .invalid

.selected
	pop de
	ld a, b
	and a
	ret

.invalid_cap_on_stack
	pop af
.invalid
	pop de
.failed
	xor a
	scf
	ret

SelectRematchContactPhoneEvent::
; Select an event using one rematch contact's policy table.
;
; Input:
;   a = REMATCH_CONTACT_* ID
;   c = PHONE_EVENT_CAP_* candidate mask, optionally ORed with
;       PHONE_EVENT_USE_REPEAT_POLICY
;
; The caller's dynamic candidates are intersected with the contact's static
; capabilities before selection. Contacts without a modeled policy table fail
; safely instead of borrowing another contact's odds. Repeat-policy requests
; likewise fail safely when the contact has no alternate table.
;
; Output:
;   carry clear, a = selected PHONE_EVENT_RESULT_*
;   carry set,   a = PHONE_EVENT_NONE
;
; Clobbers: bc, de, hl
	cp NUM_REMATCH_CONTACTS
	jr nc, .failed
	ld e, a
	ld a, c
	and PHONE_EVENT_USE_REPEAT_POLICY
	ld b, a
	ld a, c
	and PHONE_EVENT_CAP_MASK
	ld c, a
	push de
	push bc
	call GetRematchPhoneEventCapabilities
	pop bc
	and c
	ld c, a
	pop de
	jr z, .failed

	; Three-byte far pointer indexed in canonical REMATCH_CONTACT_* order.
	ld d, 0
	ld hl, RematchPhoneEventSelectionTables
	bit 7, b
	jr z, .got_pointer_table
	ld hl, RematchPhoneEventRepeatSelectionTables
.got_pointer_table
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	or h
	or l
	jr z, .failed

	ld a, c
	call SelectPhoneEvent
	ret

.failed
	xor a
	scf
	ret
