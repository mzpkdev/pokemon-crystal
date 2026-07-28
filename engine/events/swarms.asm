; Generic active swarm state and lookup API.

GetActiveSwarm::
; Return the active swarm entry in hl and its ID in a.
; Carry is set when there is no active swarm or the saved ID is invalid.
	ld a, [wActiveSwarm]
	; fallthrough

GetSwarmByID:
; Return swarm ID a's entry in hl.
; Carry is set for SWARM_NONE or an invalid ID.
	and a
	jr z, .invalid
	cp NUM_SWARMS + 1
	jr nc, .invalid
	push af
	dec a
	ld hl, SwarmData
	ld bc, SWARMENTRY_LENGTH
	rst AddNTimes
	pop af
	and a
	ret

.invalid
	scf
	ret

GetTownMapSwarm::
; Return the active swarm data needed by Town Map consumers.
; Carry is set when there is no active swarm or its landmark is not displayable.
; Otherwise:
; bc = species/form pair in the canonical dp encoding
; d  = landmark
; e  = region (JOHTO_REGION, KANTO_REGION, or ORANGE_REGION)
	call GetActiveSwarm
	ret c

; SwarmData may be in a different bank from the Town Map caller.
	push hl
	ld bc, SWARMENTRY_SPECIES
	add hl, bc
	ld a, BANK(SwarmData)
	call GetFarWord
	ld c, l
	ld b, h
	pop hl

	ld de, SWARMENTRY_LANDMARK
	add hl, de
	push bc
	ld a, BANK(SwarmData)
	call GetFarByte
	ld d, a
	pop bc

; SPECIAL_MAP has no map coordinates, and values outside the landmark table
; must never reach Town Map coordinate lookup.
	and a
	jr z, .invalid
	cp NUM_LANDMARKS
	jr nc, .invalid

	ld e, JOHTO_REGION
	cp KANTO_LANDMARK
	jr c, .valid
	inc e ; KANTO_REGION
	cp SHAMOUTI_LANDMARK
	jr c, .valid
	inc e ; ORANGE_REGION
.valid
	and a
	ret

.invalid
	scf
	ret

IsSwarmActive::
; Carry is set when a valid swarm is active.
	call GetActiveSwarm
	ccf
	ret

TryActivateSwarm::
; Input: a = stable swarm ID.
; Activates an eligible swarm only if none is active.
; Carry is set on failure; clear on success.
	ld b, a
	ld a, [wActiveSwarm]
	and a
	jr nz, .fail
	ld a, b
	push af
	call GetSwarmByID
	jr c, .restore_fail
	call IsSwarmEntryUnlocked
	jr c, .restore_fail
	pop af
	ld [wActiveSwarm], a
	and a
	ret

.restore_fail
	pop af
.fail
	scf
	ret

TryActivateRandomSwarm::
; Input: b = eligible pool/region mask.
; Chooses uniformly from eligible entries in the requested pools.
; Carry is set on failure; clear on success.
	ld a, [wActiveSwarm]
	and a
	jr nz, .fail
	ld e, b
	ld hl, SwarmData
	ld b, NUM_SWARMS
	ld c, 0
.count_loop
	push hl
	ld a, l
	add SWARMENTRY_POOL
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and e
	pop hl
	jr z, .count_next
	call IsSwarmEntryUnlocked
	jr c, .count_next
	inc c
.count_next
	ld a, l
	add SWARMENTRY_LENGTH
	ld l, a
	ld a, h
	adc 0
	ld h, a
	dec b
	jr nz, .count_loop

	ld a, c
	and a
	jr z, .fail
	call RandomRange
	ld d, a

	ld hl, SwarmData
	ld b, NUM_SWARMS
	ld c, SWARM_DUNSPARCE_ID
.select_loop
	push hl
	ld a, l
	add SWARMENTRY_POOL
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and e
	pop hl
	jr z, .select_next
	call IsSwarmEntryUnlocked
	jr c, .select_next
	ld a, d
	and a
	jr z, .selected
	dec d
.select_next
	ld a, l
	add SWARMENTRY_LENGTH
	ld l, a
	ld a, h
	adc 0
	ld h, a
	inc c
	dec b
	jr nz, .select_loop
.fail
	scf
	ret

.selected
	ld a, c
	ld [wActiveSwarm], a
	and a
	ret

ClearActiveSwarm::
	xor a
	ld [wActiveSwarm], a
	ret

IsCurrentMapActiveSwarm::
; Return the active swarm entry in hl and ID in a if its map is current.
; Carry is set when there is no match.
	call GetActiveSwarm
	ret c
	push hl
	ld bc, SWARMENTRY_MAP_GROUP
	add hl, bc
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .no_match
	inc hl
	ld a, [wMapNumber]
	cp [hl]
	jr nz, .no_match
	pop hl
	ld a, [wActiveSwarm]
	and a
	ret

.no_match
	pop hl
	scf
	ret

IsSwarmEntryUnlocked::
; Input: hl = swarm entry.
; Carry set means ineligible. Initially all entries are unlocked.
	and a
	ret

MACRO swarm_entry
;\1 species, \2 form, \3 map, \4 landmark, \5 method, \6 pools, \7 profile
	dp \1, \2
	map_id \3
	db \4, \5, \6, \7
ENDM

SwarmData:
	table_width SWARMENTRY_LENGTH
	swarm_entry DUNSPARCE, NO_FORM, DARK_CAVE_VIOLET_ENTRANCE, DARK_CAVE, SWARM_METHOD_LAND, SWARM_POOL_JOHTO, SWARM_PROFILE_DUNSPARCE
	swarm_entry YANMA, NO_FORM, ROUTE_35, ROUTE_35, SWARM_METHOD_LAND, SWARM_POOL_JOHTO, SWARM_PROFILE_YANMA
	swarm_entry QWILFISH, NO_FORM, ROUTE_32, ROUTE_32, SWARM_METHOD_FISH, SWARM_POOL_JOHTO, SWARM_PROFILE_QWILFISH
	assert_table_length NUM_SWARMS
	assert @ - SwarmData == NUM_SWARMS * SWARMENTRY_LENGTH
