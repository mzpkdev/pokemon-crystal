EnsurePhoneStorageFormat::
; Saved extension bytes replaced historical padding. Clear them once when
; loading an older save, then mark the new layout as initialized.
	ld a, [wPhoneStorageMagic]
	cp PHONE_STORAGE_MAGIC_1
	jr nz, .initialize
	ld a, [wPhoneStorageMagic + 1]
	cp PHONE_STORAGE_MAGIC_2
	jr nz, .initialize
	ld a, [wPhoneStorageMagic + 2]
	cp PHONE_STORAGE_MAGIC_3
	jr nz, .initialize
	ld a, [wPhoneStorageMagic + 3]
	cp PHONE_STORAGE_MAGIC_4
	ret z
.initialize
	xor a
	ld hl, wPhoneStorageExtension
	ld bc, wPhoneStorageMagic - wPhoneStorageExtension
	call ByteFill
	ld a, PHONE_STORAGE_MAGIC_1
	ld [wPhoneStorageMagic], a
	ld a, PHONE_STORAGE_MAGIC_2
	ld [wPhoneStorageMagic + 1], a
	ld a, PHONE_STORAGE_MAGIC_3
	ld [wPhoneStorageMagic + 2], a
	ld a, PHONE_STORAGE_MAGIC_4
	ld [wPhoneStorageMagic + 3], a
	ret

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

CheckRematchScheduleUsed::
; Check whether a contact's daily rematch schedule window was already used.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry set and a = 0 if the ID is invalid
;         carry clear and a = 0 (z) if the schedule is unused
;         carry clear and a = 1 (nz) if the schedule was used
; Clobbers: bc, de, hl
	call GetRematchScheduleFlag
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

MarkRematchScheduleUsed::
; Mark a contact's daily rematch schedule window as used.
; This is intentionally separate from OfferRematch so random outgoing calls
; can claim the daily schedule only after their random selection succeeds.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry set and a = 0 if the ID is invalid
;         carry clear and a = 1 on success
; Clobbers: bc, de, hl
	call GetRematchScheduleFlag
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

TryClaimRematchScheduleWindow::
; Atomically claim a contact's schedule when its configured day and time match.
; A previously used schedule never matches. This does not offer a rematch;
; callers compose a successful claim with OfferRematch when appropriate.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry set and a = 0 if the ID is invalid
;         carry clear and a = 0 (z) if used or outside the configured window
;         carry clear and a = 1 (nz) if the matching window was claimed
; Clobbers: bc, de, hl
	cp NUM_REMATCH_SCHEDULES
	jr nc, .invalid
	push af
	call CheckRematchScheduleUsed
	jr nz, .no_match
	pop af
	push af
	ld e, a
	ld d, 0
	ld hl, RematchSchedules
	add hl, de
	add hl, de
	ld a, [wCurDay]
	cp [hl]
	jr nz, .no_match
	inc hl
	ld b, [hl]
	push bc
	call CheckTime
	pop de
	ld a, c
	and d
	jr z, .no_match
	pop af
	jp MarkRematchScheduleUsed

.no_match
	pop af
	xor a
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
	cp REMATCH_FLAG_BASE_BYTES
	jr c, .got_byte
	sub REMATCH_FLAG_BASE_BYTES
	ld e, a
	ld hl, wDailyRematchFlagsExtension
.got_byte
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

GetRematchScheduleFlag:
; Resolve a canonical rematch contact ID to its daily schedule byte and mask.
; Input:  a = REMATCH_CONTACT_* ID
; Output: carry set if the ID is invalid
;         carry clear, hl = flag byte, b = bit mask if valid
; Clobbers: af, c, de, hl
	cp NUM_REMATCH_SCHEDULES
	jr nc, .invalid
	ld c, a
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, wDailyPhoneTimeOfDayFlags
	cp REMATCH_SCHEDULE_FLAG_BASE_BYTES
	jr c, .got_byte
	sub REMATCH_SCHEDULE_FLAG_BASE_BYTES
	ld e, a
	ld hl, wDailyPhoneTimeOfDayFlagsExtension
.got_byte
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
