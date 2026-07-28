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
	ld bc, SWARMENTRY_MAP_SCOPE
	add hl, bc
	ld a, [hl]
	cp NUM_SWARM_SCOPES
	jr nc, .no_match
	add a
	ld c, a
	ld b, 0
	ld hl, SwarmMapScopePointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.map_loop
	ld a, [hli]
	cp -1
	jr z, .no_match
	ld b, a
	ld a, [wMapGroup]
	cp b
	jr nz, .next_map
	ld a, [wMapNumber]
	cp [hl]
	jr z, .match
.next_map
	inc hl
	jr .map_loop

.match
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
; Carry set means ineligible. Preserve hl for table iteration callers.
	push hl
	ld bc, SWARMENTRY_UNLOCK_RULE
	add hl, bc
	ld a, [hl]
	cp NUM_SWARM_UNLOCK_RULES
	jr nc, .locked
	ld hl, SwarmUnlockRulePointers
	call JumpTable
	pop hl
	ret

.locked
	pop hl
	scf
	ret

SwarmUnlockRulePointers:
	table_width 2
	dw .None
	assert_table_length NUM_SWARM_UNLOCK_RULES

.None:
	and a
	ret

	assert BANK(SwarmUnlockRulePointers) == BANK(.None)

CheckEncounterSwarmShinyBoost::
; Carry is set only when the transient encounter marker identifies the active
; swarm, its shiny policy is boosted, and its advertised species/form is the
; Pokemon currently being generated. NO_FORM advertises all forms of a species.
; Invalid state fails closed.
	ldh a, [hEncounterSwarmID]
	ld b, a
	xor a
	ldh [hEncounterSwarmID], a
	ld a, b
	and a
	jr z, .no_boost
	ld a, [wActiveSwarm]
	cp b
	jr nz, .no_boost
	call GetSwarmByID
	jr c, .no_boost
	push hl
	ld bc, SWARMENTRY_SHINY_POLICY
	add hl, bc
	ld a, [hl]
	cp NUM_SWARM_SHINY_POLICIES
	jr nc, .pop_no_boost
	cp SWARM_SHINY_BOOSTED
	jr nz, .pop_no_boost
	pop hl
	ld a, [hli]
	ld b, a
	ld a, [wCurPartySpecies]
	cp b
	jr nz, .no_boost
	ld a, [hl]
	and SPECIESFORM_MASK
	ld b, a
	ld a, [wCurForm]
	and SPECIESFORM_MASK
	ld c, a
	and EXTSPECIES_MASK
	ld d, a
	ld a, b
	and EXTSPECIES_MASK
	cp d
	jr nz, .no_boost
	ld a, b
	and FORM_MASK
	jr z, .boost
	ld b, a
	ld a, c
	and FORM_MASK
	cp b
	jr nz, .no_boost
.boost
	scf
	ret

.pop_no_boost
	pop hl
.no_boost
	and a
	ret

MACRO swarm_entry
;\1 species, \2 form, \3 map scope, \4 landmark, \5 method, \6 pools,
;\7 profile, \8 unlock rule, \9 shiny policy
	assert \3 < NUM_SWARM_SCOPES, "Invalid swarm map scope"
	assert \5 < NUM_SWARM_METHODS, "Invalid swarm encounter method"
	assert \6 & ~SWARM_POOL_ALL == 0, "Invalid swarm selection pool"
	assert \6 != 0, "Swarm must belong to a selection pool"
	assert \7 < NUM_SWARM_PROFILES, "Invalid swarm encounter profile"
	assert \8 < NUM_SWARM_UNLOCK_RULES, "Invalid swarm unlock rule"
	assert \9 < NUM_SWARM_SHINY_POLICIES, "Invalid swarm shiny policy"
	dp \1, \2
	db \3
	db \4, \5, \6, \7, \8, \9
ENDM

MACRO swarm_catalog_entry
;\1 species, \2 form, \3 stable ID, \4 map scope, \5 landmark, \6 method, \7 pool
	assert \3 - 1 < NUM_SWARM_PROFILES, "Swarm ID has no encounter profile"
	swarm_entry \1, \2, \4, \5, \6, \7, \3 - 1, SWARM_UNLOCK_NONE, SWARM_SHINY_BOOSTED
ENDM

SwarmData:
	table_width SWARMENTRY_LENGTH
	swarm_catalog_entry DUNSPARCE, NO_FORM, SWARM_DUNSPARCE_ID, SWARM_SCOPE_DARK_CAVE, DARK_CAVE, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry YANMA, NO_FORM, SWARM_YANMA_ID, SWARM_SCOPE_ROUTE_35, ROUTE_35, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry QWILFISH, NO_FORM, SWARM_QWILFISH_ID, SWARM_SCOPE_ROUTE_32, ROUTE_32, SWARM_METHOD_FISH, SWARM_POOL_JOHTO
	swarm_catalog_entry MARILL, NO_FORM, SWARM_MARILL_ID, SWARM_SCOPE_MOUNT_MORTAR, MT_MORTAR, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry MAGNEMITE, NO_FORM, SWARM_MAGNEMITE_ID, SWARM_SCOPE_ROUTE_38, ROUTE_38, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry CHINCHOU, NO_FORM, SWARM_CHINCHOU_ID, SWARM_SCOPE_OLIVINE_CITY, OLIVINE_CITY, SWARM_METHOD_FISH, SWARM_POOL_JOHTO
	swarm_catalog_entry REMORAID, NO_FORM, SWARM_REMORAID_ID, SWARM_SCOPE_ROUTE_44, ROUTE_44, SWARM_METHOD_FISH, SWARM_POOL_JOHTO
	swarm_catalog_entry PHANPY, NO_FORM, SWARM_PHANPY_ID, SWARM_SCOPE_ROUTE_46, ROUTE_46, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry CATERPIE, NO_FORM, SWARM_CATERPIE_ID, SWARM_SCOPE_ROUTE_30, ROUTE_30, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry SPINARAK, NO_FORM, SWARM_SPINARAK_ID, SWARM_SCOPE_ROUTE_31, ROUTE_31, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry PARAS, NO_FORM, SWARM_PARAS_ID, SWARM_SCOPE_ILEX_FOREST, ILEX_FOREST, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry HOPPIP, NO_FORM, SWARM_HOPPIP_ID, SWARM_SCOPE_ROUTE_29, ROUTE_29, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry DITTO, NO_FORM, SWARM_DITTO_ID, SWARM_SCOPE_ROUTE_34, ROUTE_34, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry SUNKERN, NO_FORM, SWARM_SUNKERN_ID, SWARM_SCOPE_NATIONAL_PARK, NATIONAL_PARK, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry VULPIX, NO_FORM, SWARM_VULPIX_ID, SWARM_SCOPE_ROUTE_36, ROUTE_36, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry MILTANK, NO_FORM, SWARM_MILTANK_ID, SWARM_SCOPE_ROUTE_39, ROUTE_39, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry SANDSHREW, NO_FORM, SWARM_SANDSHREW_ID, SWARM_SCOPE_UNION_CAVE, UNION_CAVE, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry EKANS, NO_FORM, SWARM_EKANS_ID, SWARM_SCOPE_ROUTE_33, ROUTE_33, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry SMEARGLE, NO_FORM, SWARM_SMEARGLE_ID, SWARM_SCOPE_RUINS_OF_ALPH, RUINS_OF_ALPH, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry HORSEA, NO_FORM, SWARM_HORSEA_ID, SWARM_SCOPE_ROUTE_41, ROUTE_41, SWARM_METHOD_FISH, SWARM_POOL_JOHTO
	swarm_catalog_entry MANKEY, NO_FORM, SWARM_MANKEY_ID, SWARM_SCOPE_ROUTE_42, ROUTE_42, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry PONYTA, NO_FORM, SWARM_PONYTA_ID, SWARM_SCOPE_ROUTE_47, ROUTE_47, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry DIGLETT, NO_FORM, SWARM_DIGLETT_ID, SWARM_SCOPE_ROUTE_48, ROUTE_48, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry DRATINI, NO_FORM, SWARM_DRATINI_ID, SWARM_SCOPE_DRAGONS_DEN, DRAGONS_DEN, SWARM_METHOD_FISH, SWARM_POOL_JOHTO
	swarm_catalog_entry SWINUB, NO_FORM, SWARM_SWINUB_ID, SWARM_SCOPE_ICE_PATH, ICE_PATH, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry GLIGAR, NO_FORM, SWARM_GLIGAR_ID, SWARM_SCOPE_ROUTE_45, ROUTE_45, SWARM_METHOD_LAND, SWARM_POOL_JOHTO
	swarm_catalog_entry PSYDUCK, NO_FORM, SWARM_PSYDUCK_ID, SWARM_SCOPE_ROUTE_35, ROUTE_35, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry TEDDIURSA, NO_FORM, SWARM_TEDDIURSA_ID, SWARM_SCOPE_DARK_CAVE, DARK_CAVE, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry BELLSPROUT, NO_FORM, SWARM_BELLSPROUT_ID, SWARM_SCOPE_ROUTE_32, ROUTE_32, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry MACHOP, NO_FORM, SWARM_MACHOP_ID, SWARM_SCOPE_MOUNT_MORTAR, MT_MORTAR, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry TAUROS, NO_FORM, SWARM_TAUROS_ID, SWARM_SCOPE_ROUTE_38, ROUTE_38, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry CORSOLA, NO_FORM, SWARM_CORSOLA_ID, SWARM_SCOPE_OLIVINE_CITY, OLIVINE_CITY, SWARM_METHOD_FISH, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry LICKITUNG, NO_FORM, SWARM_LICKITUNG_ID, SWARM_SCOPE_ROUTE_44, ROUTE_44, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry SLOWPOKE, NO_FORM, SWARM_SLOWPOKE_ID, SWARM_SCOPE_SLOWPOKE_WELL, SLOWPOKE_WELL, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry WEEDLE, NO_FORM, SWARM_WEEDLE_ID, SWARM_SCOPE_ROUTE_30, ROUTE_30, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry LEDYBA, NO_FORM, SWARM_LEDYBA_ID, SWARM_SCOPE_ROUTE_31, ROUTE_31, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry ODDISH, NO_FORM, SWARM_ODDISH_ID, SWARM_SCOPE_ILEX_FOREST, ILEX_FOREST, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry PINECO, NO_FORM, SWARM_PINECO_ID, SWARM_SCOPE_ROUTE_29, ROUTE_29, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry DROWZEE, NO_FORM, SWARM_DROWZEE_ID, SWARM_SCOPE_ROUTE_34, ROUTE_34, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry VENONAT, NO_FORM, SWARM_VENONAT_ID, SWARM_SCOPE_NATIONAL_PARK, NATIONAL_PARK, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry GROWLITHE, NO_FORM, SWARM_GROWLITHE_ID, SWARM_SCOPE_ROUTE_36, ROUTE_36, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry STANTLER, NO_FORM, SWARM_STANTLER_ID, SWARM_SCOPE_ROUTE_37, ROUTE_37, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry WOOPER, NO_FORM, SWARM_WOOPER_ID, SWARM_SCOPE_UNION_CAVE, UNION_CAVE, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry AIPOM, NO_FORM, SWARM_AIPOM_ID, SWARM_SCOPE_ROUTE_33, ROUTE_33, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry KOFFING, NO_FORM, SWARM_KOFFING_ID, SWARM_SCOPE_BURNED_TOWER, BURNED_TOWER, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry MANTINE, NO_FORM, SWARM_MANTINE_ID, SWARM_SCOPE_ROUTE_41, ROUTE_41, SWARM_METHOD_FISH, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry MAREEP, NO_FORM, SWARM_MAREEP_ID, SWARM_SCOPE_ROUTE_42, ROUTE_42, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry GIRAFARIG, NO_FORM, SWARM_GIRAFARIG_ID, SWARM_SCOPE_ROUTE_43, ROUTE_43, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry HOUNDOUR, NO_FORM, SWARM_HOUNDOUR_ID, SWARM_SCOPE_ROUTE_48, ROUTE_48, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry ONIX, NO_FORM, SWARM_ONIX_ID, SWARM_SCOPE_CLIFF_CAVE, CLIFF_CAVE, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry SNEASEL, NO_FORM, SWARM_SNEASEL_ID, SWARM_SCOPE_ICE_PATH, ICE_PATH, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry SKARMORY, NO_FORM, SWARM_SKARMORY_ID, SWARM_SCOPE_ROUTE_45, ROUTE_45, SWARM_METHOD_LAND, SWARM_POOL_JOHTO_ALT
	swarm_catalog_entry GOLBAT, NO_FORM, SWARM_GOLBAT_ID, SWARM_SCOPE_VICTORY_ROAD, VICTORY_ROAD, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry DODUO, NO_FORM, SWARM_DODUO_ID, SWARM_SCOPE_ROUTE_26, ROUTE_26, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry FURRET, NO_FORM, SWARM_FURRET_ID, SWARM_SCOPE_ROUTE_1, ROUTE_1, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry PIKACHU, NO_FORM, SWARM_PIKACHU_ID, SWARM_SCOPE_VIRIDIAN_FOREST, VIRIDIAN_FOREST, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry MAGMAR, NO_FORM, SWARM_MAGMAR_ID, SWARM_SCOPE_POKEMON_MANSION, POKEMON_MANSION, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry GEODUDE, NO_FORM, SWARM_GEODUDE_ID, SWARM_SCOPE_MOUNT_MOON, MT_MOON, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry JIGGLYPUFF, NO_FORM, SWARM_JIGGLYPUFF_ID, SWARM_SCOPE_ROUTE_5, ROUTE_5, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry POLIWAG, NO_FORM, SWARM_POLIWAG_ID, SWARM_SCOPE_ROUTE_6, ROUTE_6, SWARM_METHOD_SURF, SWARM_POOL_KANTO
	swarm_catalog_entry MEOWTH, NO_FORM, SWARM_MEOWTH_ID, SWARM_SCOPE_ROUTE_11, ROUTE_11, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry FEAROW, NO_FORM, SWARM_FEAROW_ID, SWARM_SCOPE_ROUTE_9, ROUTE_9, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry CUBONE, NO_FORM, SWARM_CUBONE_ID, SWARM_SCOPE_ROCK_TUNNEL, ROCK_TUNNEL, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry MURKROW, NO_FORM, SWARM_MURKROW_ID, SWARM_SCOPE_ROUTE_7, ROUTE_7, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry HAUNTER, NO_FORM, SWARM_HAUNTER_ID, SWARM_SCOPE_ROUTE_8, ROUTE_8, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry SLUGMA, NO_FORM, SWARM_SLUGMA_ID, SWARM_SCOPE_ROUTE_16, ROUTE_16, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry VOLTORB, NO_FORM, SWARM_VOLTORB_ID, SWARM_SCOPE_ROUTE_10, ROUTE_10, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry NIDORINO, NO_FORM, SWARM_NIDORINO_ID, SWARM_SCOPE_ROUTE_14, ROUTE_14, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry FARFETCH_D, NO_FORM, SWARM_FARFETCH_D_ID, SWARM_SCOPE_ROUTE_13, ROUTE_13, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry STARYU, NO_FORM, SWARM_STARYU_ID, SWARM_SCOPE_ROUTE_19, ROUTE_19, SWARM_METHOD_FISH, SWARM_POOL_KANTO
	swarm_catalog_entry SEEL, NO_FORM, SWARM_SEEL_ID, SWARM_SCOPE_SEAFOAM_ISLANDS, SEAFOAM_ISLANDS, SWARM_METHOD_LAND, SWARM_POOL_KANTO
	swarm_catalog_entry RHYHORN, NO_FORM, SWARM_RHYHORN_ID, SWARM_SCOPE_VICTORY_ROAD, VICTORY_ROAD, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry MR__MIME, NO_FORM, SWARM_MR__MIME_ID, SWARM_SCOPE_ROUTE_21, ROUTE_21, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry RATICATE, NO_FORM, SWARM_RATICATE_ID, SWARM_SCOPE_ROUTE_1, ROUTE_1, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry BULBASAUR, NO_FORM, SWARM_BULBASAUR_ID, SWARM_SCOPE_VIRIDIAN_FOREST, VIRIDIAN_FOREST, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry CHARMANDER, NO_FORM, SWARM_CHARMANDER_ID, SWARM_SCOPE_ROUTE_22, ROUTE_22, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry CLEFAIRY, NO_FORM, SWARM_CLEFAIRY_ID, SWARM_SCOPE_MOUNT_MOON, MT_MOON, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry NOCTOWL, NO_FORM, SWARM_NOCTOWL_ID, SWARM_SCOPE_ROUTE_5, ROUTE_5, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry ABRA, NO_FORM, SWARM_ABRA_ID, SWARM_SCOPE_ROUTE_6, ROUTE_6, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry PIDGEOTTO, NO_FORM, SWARM_PIDGEOTTO_ID, SWARM_SCOPE_ROUTE_11, ROUTE_11, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry SQUIRTLE, NO_FORM, SWARM_SQUIRTLE_ID, SWARM_SCOPE_ROUTE_25, ROUTE_25, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry KANGASKHAN, NO_FORM, SWARM_KANGASKHAN_ID, SWARM_SCOPE_ROCK_TUNNEL, ROCK_TUNNEL, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry ELECTABUZZ, NO_FORM, SWARM_ELECTABUZZ_ID, SWARM_SCOPE_ROUTE_10, ROUTE_10, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry TYROGUE, NO_FORM, SWARM_TYROGUE_ID, SWARM_SCOPE_ROUTE_8, ROUTE_8, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry GRIMER, NO_FORM, SWARM_GRIMER_ID, SWARM_SCOPE_ROUTE_17, ROUTE_17, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry EXEGGCUTE, NO_FORM, SWARM_EXEGGCUTE_ID, SWARM_SCOPE_ROUTE_15, ROUTE_15, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry NIDORINA, NO_FORM, SWARM_NIDORINA_ID, SWARM_SCOPE_ROUTE_14, ROUTE_14, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry CHANSEY, NO_FORM, SWARM_CHANSEY_ID, SWARM_SCOPE_ROUTE_13, ROUTE_13, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry SHELLDER, NO_FORM, SWARM_SHELLDER_ID, SWARM_SCOPE_ROUTE_20, ROUTE_20, SWARM_METHOD_FISH, SWARM_POOL_KANTO_ALT
	swarm_catalog_entry JYNX, NO_FORM, SWARM_JYNX_ID, SWARM_SCOPE_SEAFOAM_ISLANDS, SEAFOAM_ISLANDS, SWARM_METHOD_LAND, SWARM_POOL_KANTO_ALT
	assert_table_length NUM_SWARMS
	assert @ - SwarmData == NUM_SWARMS * SWARMENTRY_LENGTH

SwarmMapScopePointers:
	table_width 2
	dw .DarkCave
	dw .Route35
	dw .Route32
	dw .MountMortar
	dw .Route38
	dw .OlivineCity
	dw .Route44
	dw .Route46
	dw .Route30
	dw .Route31
	dw .IlexForest
	dw .Route29
	dw .Route34
	dw .NationalPark
	dw .Route36
	dw .Route39
	dw .UnionCave
	dw .Route33
	dw .RuinsOfAlph
	dw .Route41
	dw .Route42
	dw .Route47
	dw .Route48
	dw .DragonsDen
	dw .IcePath
	dw .Route45
	dw .SlowpokeWell
	dw .Route37
	dw .BurnedTower
	dw .Route43
	dw .CliffCave
	dw .VictoryRoad
	dw .Route26
	dw .Route1
	dw .ViridianForest
	dw .PokemonMansion
	dw .MountMoon
	dw .Route5
	dw .Route6
	dw .Route11
	dw .Route9
	dw .RockTunnel
	dw .Route7
	dw .Route8
	dw .Route16
	dw .Route10
	dw .Route14
	dw .Route13
	dw .Route19
	dw .SeafoamIslands
	dw .Route21
	dw .Route22
	dw .Route25
	dw .Route17
	dw .Route15
	dw .Route20
	assert_table_length NUM_SWARM_SCOPES

.DarkCave:
	map_id DARK_CAVE_VIOLET_ENTRANCE
	map_id DARK_CAVE_BLACKTHORN_ENTRANCE
	db -1

.Route35:
	map_id ROUTE_35
	db -1

.Route32:
	map_id ROUTE_32
	db -1

.MountMortar:
	map_id MOUNT_MORTAR_1F_OUTSIDE
	map_id MOUNT_MORTAR_1F_INSIDE
	map_id MOUNT_MORTAR_2F_INSIDE
	map_id MOUNT_MORTAR_B1F
	db -1

.Route38:
	map_id ROUTE_38
	db -1

.OlivineCity:
	map_id OLIVINE_CITY
	db -1

.Route44:
	map_id ROUTE_44
	db -1

.Route46:
	map_id ROUTE_46
	db -1

.Route30:
	map_id ROUTE_30
	db -1

.Route31:
	map_id ROUTE_31
	db -1

.IlexForest:
	map_id ILEX_FOREST
	db -1

.Route29:
	map_id ROUTE_29
	db -1

.Route34:
	map_id ROUTE_34
	db -1

.NationalPark:
	map_id NATIONAL_PARK
	map_id NATIONAL_PARK_BUG_CONTEST
	db -1

.Route36:
	map_id ROUTE_36
	db -1

.Route39:
	map_id ROUTE_39
	db -1

.UnionCave:
	map_id UNION_CAVE_1F
	map_id UNION_CAVE_B1F_NORTH
	map_id UNION_CAVE_B1F_SOUTH
	map_id UNION_CAVE_B2F
	db -1

.Route33:
	map_id ROUTE_33
	db -1

.RuinsOfAlph:
	map_id RUINS_OF_ALPH_OUTSIDE
	db -1

.Route41:
	map_id ROUTE_41
	db -1

.Route42:
	map_id ROUTE_42
	db -1

.Route47:
	map_id ROUTE_47
	db -1

.Route48:
	map_id ROUTE_48
	db -1

.DragonsDen:
	map_id DRAGONS_DEN_1F
	map_id DRAGONS_DEN_B1F
	db -1

.IcePath:
	map_id ICE_PATH_1F
	map_id ICE_PATH_B1F
	map_id ICE_PATH_B2F_MAHOGANY_SIDE
	map_id ICE_PATH_B2F_BLACKTHORN_SIDE
	map_id ICE_PATH_B3F
	db -1

.Route45:
	map_id ROUTE_45
	db -1

.SlowpokeWell:
	map_id SLOWPOKE_WELL_ENTRANCE
	map_id SLOWPOKE_WELL_B1F
	map_id SLOWPOKE_WELL_B2F
	db -1

.Route37:
	map_id ROUTE_37
	db -1

.BurnedTower:
	map_id BURNED_TOWER_1F
	map_id BURNED_TOWER_B1F
	db -1

.Route43:
	map_id ROUTE_43
	db -1

.CliffCave:
	map_id CLIFF_CAVE
	db -1

.VictoryRoad:
	map_id VICTORY_ROAD_1F
	map_id VICTORY_ROAD_2F
	map_id VICTORY_ROAD_3F
	db -1

.Route26:
	map_id ROUTE_26
	db -1

.Route1:
	map_id ROUTE_1
	db -1

.ViridianForest:
	map_id VIRIDIAN_FOREST
	db -1

.PokemonMansion:
	map_id POKEMON_MANSION_1F
	map_id POKEMON_MANSION_B1F
	db -1

.MountMoon:
	map_id MOUNT_MOON_1F
	map_id MOUNT_MOON_B1F
	map_id MOUNT_MOON_B2F
	db -1

.Route5:
	map_id ROUTE_5
	db -1

.Route6:
	map_id ROUTE_6
	db -1

.Route11:
	map_id ROUTE_11
	db -1

.Route9:
	map_id ROUTE_9
	db -1

.RockTunnel:
	map_id ROCK_TUNNEL_1F
	map_id ROCK_TUNNEL_B1F
	map_id ROCK_TUNNEL_2F
	db -1

.Route7:
	map_id ROUTE_7
	db -1

.Route8:
	map_id ROUTE_8
	db -1

.Route16:
	map_id ROUTE_16_WEST
	map_id ROUTE_16_NORTH
	db -1

.Route10:
	map_id ROUTE_10_NORTH
	map_id ROUTE_10_SOUTH
	db -1

.Route14:
	map_id ROUTE_14
	db -1

.Route13:
	map_id ROUTE_13
	db -1

.Route19:
	map_id ROUTE_19
	db -1

.SeafoamIslands:
	map_id SEAFOAM_ISLANDS_1F
	map_id SEAFOAM_ISLANDS_B1F
	map_id SEAFOAM_ISLANDS_B2F
	map_id SEAFOAM_ISLANDS_B3F
	map_id SEAFOAM_ISLANDS_B4F
	db -1

.Route21:
	map_id ROUTE_21
	db -1

.Route22:
	map_id ROUTE_22
	db -1

.Route25:
	map_id ROUTE_25
	db -1

.Route17:
	map_id ROUTE_17_NORTH
	map_id ROUTE_17_SOUTH
	db -1

.Route15:
	map_id ROUTE_15
	db -1

.Route20:
	map_id ROUTE_20
	db -1

	assert BANK(SwarmMapScopePointers) == BANK(.DarkCave)
	assert BANK(SwarmMapScopePointers) == BANK(.Route20)
