SelectPhoneEvent::
; Select the first successful event from an ordered far-addressed table.
;
; Input:
;   a  = PHONE_EVENT_CAP_* candidate mask
;   b  = selection table ROM bank
;   hl = selection table address
;
; Each two-byte table entry is a PHONE_EVENT_* value followed by a denominator.
; Nonzero denominators perform the same RandomRange(n) == 0 test as the
; PhoneScript_RandomN helpers. Disabled candidates are skipped without calling
; RandomRange. A zero denominator is the deterministic terminal fallback.
;
; Output:
;   carry clear, a = selected PHONE_EVENT_*
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
	ld d, a

	ld a, b
	and a
	jr z, .invalid
	cp NUM_PHONE_EVENTS
	jr nc, .invalid

	; Convert PHONE_EVENT_* to its corresponding PHONE_EVENT_CAP_* bit.
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
	and a
	jr z, .selected

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
;   c = PHONE_EVENT_CAP_* candidate mask
;
; The caller's dynamic candidates are intersected with the contact's static
; capabilities before selection. Contacts without a modeled policy table fail
; safely instead of borrowing another contact's odds.
;
; Output:
;   carry clear, a = selected PHONE_EVENT_*
;   carry set,   a = PHONE_EVENT_NONE
;
; Clobbers: bc, de, hl
	cp NUM_REMATCH_CONTACTS
	jr nc, .failed
	ld e, a
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
