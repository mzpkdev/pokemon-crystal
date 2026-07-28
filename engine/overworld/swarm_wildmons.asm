LoadSwarmWildmonProfile:
; Input: a = swarm profile, d = encounter method.
; Copy the current map's profile record to WRAM and return it in hl.
; Carry is clear when the profile or current map has no matching record.
	add a
	ld c, a
	ld b, 0
	ld a, d
	cp SWARM_METHOD_LAND
	ld hl, LandSwarmProfilePointers
	jr z, .got_profile_table
	cp SWARM_METHOD_SURF
	ld hl, SurfSwarmProfilePointers
	jr nz, .not_found
.got_profile_table
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	or l
	jr z, .not_found

	ld bc, GRASS_WILDDATA_LENGTH
	ld a, d
	cp SWARM_METHOD_LAND
	jr z, .got_record_length
	ld bc, WATER_WILDDATA_LENGTH
.got_record_length
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	ld e, a

.find_map
	push hl
	ld a, [hli]
	cp -1
	jr z, .map_not_found
	cp d
	jr nz, .next_map
	ld a, [hl]
	cp e
	jr z, .found
.next_map
	pop hl
	add hl, bc
	jr .find_map

.map_not_found
	pop hl
.not_found
	and a
	ret

.found
	pop hl
	push bc
	ld de, wWildEncounterDataBuffer
	rst CopyBytes
	pop bc
	ld hl, wWildEncounterDataBuffer
	scf
	ret

SwarmGrassWildMons:
INCLUDE "data/wild/swarm_grass.asm"

SwarmWaterWildMons:
INCLUDE "data/wild/swarm_water.asm"

LandSwarmProfilePointers:
	table_width 2
	dw DunsparceSwarmWildMons
	dw YanmaSwarmWildMons
	dw 0
	dw MarillSwarmWildMons
	dw MagnemiteSwarmWildMons
	dw 0
	dw 0
	dw PhanpySwarmWildMons
	dw CaterpieSwarmWildMons
	dw SpinarakSwarmWildMons
	dw ParasSwarmWildMons
	dw HoppipSwarmWildMons
	dw DittoSwarmWildMons
	dw SunkernSwarmWildMons
	dw VulpixSwarmWildMons
	dw MiltankSwarmWildMons
	dw SandshrewSwarmWildMons
	dw EkansSwarmWildMons
	dw SmeargleSwarmWildMons
	dw 0
	dw MankeySwarmWildMons
	dw PonytaSwarmWildMons
	dw DiglettSwarmWildMons
	dw 0
	dw SwinubSwarmWildMons
	dw GligarSwarmWildMons
	dw PsyduckSwarmWildMons
	dw TeddiursaSwarmWildMons
	dw BellsproutSwarmWildMons
	dw MachopSwarmWildMons
	dw TaurosSwarmWildMons
	dw 0
	dw LickitungSwarmWildMons
	dw SlowpokeSwarmWildMons
	dw WeedleSwarmWildMons
	dw LedybaSwarmWildMons
	dw OddishSwarmWildMons
	dw PinecoSwarmWildMons
	dw DrowzeeSwarmWildMons
	dw VenonatSwarmWildMons
	dw GrowlitheSwarmWildMons
	dw StantlerSwarmWildMons
	dw WooperSwarmWildMons
	dw AipomSwarmWildMons
	dw KoffingSwarmWildMons
	dw 0
	dw MareepSwarmWildMons
	dw GirafarigSwarmWildMons
	dw HoundourSwarmWildMons
	dw OnixSwarmWildMons
	dw SneaselSwarmWildMons
	dw SkarmorySwarmWildMons
	dw GolbatSwarmWildMons
	dw DoduoSwarmWildMons
	dw FurretSwarmWildMons
	dw PikachuSwarmWildMons
	dw MagmarSwarmWildMons
	dw GeodudeSwarmWildMons
	dw JigglypuffSwarmWildMons
	dw 0
	dw MeowthSwarmWildMons
	dw FearowSwarmWildMons
	dw CuboneSwarmWildMons
	dw MurkrowSwarmWildMons
	dw HaunterSwarmWildMons
	dw SlugmaSwarmWildMons
	dw VoltorbSwarmWildMons
	dw NidorinoSwarmWildMons
	dw FarfetchDSwarmWildMons
	dw 0
	dw SeelSwarmWildMons
	dw RhyhornSwarmWildMons
	dw MrMimeSwarmWildMons
	dw RaticateSwarmWildMons
	dw BulbasaurSwarmWildMons
	dw CharmanderSwarmWildMons
	dw ClefairySwarmWildMons
	dw NoctowlSwarmWildMons
	dw AbraSwarmWildMons
	dw PidgeottoSwarmWildMons
	dw SquirtleSwarmWildMons
	dw KangaskhanSwarmWildMons
	dw ElectabuzzSwarmWildMons
	dw TyrogueSwarmWildMons
	dw GrimerSwarmWildMons
	dw ExeggcuteSwarmWildMons
	dw NidorinaSwarmWildMons
	dw ChanseySwarmWildMons
	dw 0
	dw JynxSwarmWildMons
	assert_table_length NUM_SWARM_PROFILES

SurfSwarmProfilePointers:
	table_width 2
	rept SWARM_PROFILE_POLIWAG
		dw 0
	endr
	dw PoliwagSwarmWaterWildMons
	rept NUM_SWARM_PROFILES - SWARM_PROFILE_POLIWAG - 1
		dw 0
	endr
	assert_table_length NUM_SWARM_PROFILES

	assert BANK(LoadSwarmWildmonProfile) == BANK(LandSwarmProfilePointers)
	assert BANK(LandSwarmProfilePointers) == BANK(DunsparceSwarmWildMons)
	assert BANK(LandSwarmProfilePointers) == BANK(YanmaSwarmWildMons)
	assert BANK(LandSwarmProfilePointers) == BANK(SkarmorySwarmWildMons)
	assert BANK(LandSwarmProfilePointers) == BANK(GolbatSwarmWildMons)
	assert BANK(LandSwarmProfilePointers) == BANK(JynxSwarmWildMons)
	assert BANK(SurfSwarmProfilePointers) == BANK(SwarmWaterWildMons)
	assert BANK(SurfSwarmProfilePointers) == BANK(PoliwagSwarmWaterWildMons)
