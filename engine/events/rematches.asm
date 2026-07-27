CheckRematchPending::
; Check whether a contact has a pending rematch.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry set and a = 0 if the ID is invalid
;         carry clear and a = 0 (z) if no rematch is pending
;         carry clear and a = 1 (nz) if a rematch is pending
; Clobbers: bc, de, hl
	call GetRematchFlag
	jr c, .invalid
	ld a, [hl]
	and b
	ret z
	ld a, 1
	ret

.invalid
	xor a
	scf
	ret

OfferRematch::
; Mark a contact's rematch as pending.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry set and a = 0 if the ID is invalid
;         carry clear and a = 1 on success
; Clobbers: bc, de, hl
	call GetRematchFlag
	jr c, .invalid
	ld a, [hl]
	or b
	ld [hl], a
	ld a, 1
	and a
	ret

.invalid
	xor a
	scf
	ret

ConsumeRematch::
; Clear a contact's pending rematch and report its previous state.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry set and a = 0 if the ID is invalid
;         carry clear and a = 0 (z) if no rematch was pending
;         carry clear and a = 1 (nz) if a rematch was consumed
; Clobbers: bc, de, hl
	call GetRematchFlag
	jr c, .invalid
	ld a, [hl]
	ld c, a
	ld a, b
	cpl
	and c
	ld [hl], a
	ld a, c
	and b
	ret z
	ld a, 1
	ret

.invalid
	xor a
	scf
	ret

GetRematchFlag:
; Resolve a canonical rematch contact ID to its byte and bit mask.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry set if the ID is invalid
;         carry clear, hl = flag byte, b = bit mask if valid
; Clobbers: af, c, de, hl
	cp NUM_REMATCH_CONTACTS
	jr nc, .invalid
	ld c, a
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, wDailyRematchFlags
	add hl, de
	ld a, c
	and 7
	ld c, a
	ld b, 1
	jr z, .resolved

.shift
	sla b
	dec c
	jr nz, .shift

.resolved
	and a
	ret

.invalid
	scf
	ret
