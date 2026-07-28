; swarms in grass

; Dunsparce swarm
DunsparceSwarmWildMons:
	def_grass_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent ; encounter rate
	; morn
	wildmon 3, GEODUDE
	wildmon 3, DUNSPARCE, DUDUNSPARCE_THREE_SEGMENT_FORM
	wildmon 2, ZUBAT
	wildmon 2, GEODUDE
	wildmon 2, DUNSPARCE, DUDUNSPARCE_TWO_SEGMENT_FORM
	wildmon 4, DUNSPARCE, DUDUNSPARCE_THREE_SEGMENT_FORM
	wildmon 4, DUNSPARCE, DUDUNSPARCE_TWO_SEGMENT_FORM
	; day
	wildmon 3, GEODUDE
	wildmon 3, DUNSPARCE, DUDUNSPARCE_THREE_SEGMENT_FORM
	wildmon 2, ZUBAT
	wildmon 2, GEODUDE
	wildmon 2, DUNSPARCE, DUDUNSPARCE_TWO_SEGMENT_FORM
	wildmon 4, DUNSPARCE, DUDUNSPARCE_THREE_SEGMENT_FORM
	wildmon 4, DUNSPARCE, DUDUNSPARCE_TWO_SEGMENT_FORM
	; nite
	wildmon 3, GEODUDE
	wildmon 3, DUNSPARCE, DUDUNSPARCE_THREE_SEGMENT_FORM
	wildmon 2, ZUBAT
	wildmon 2, GEODUDE
	wildmon 2, DUNSPARCE, DUDUNSPARCE_TWO_SEGMENT_FORM
	wildmon 4, DUNSPARCE, DUDUNSPARCE_THREE_SEGMENT_FORM
	wildmon 4, DUNSPARCE, DUDUNSPARCE_TWO_SEGMENT_FORM
	end_grass_wildmons

	db -1 ; end

; Golbat swarm
GolbatSwarmWildMons:
	def_grass_wildmons VICTORY_ROAD_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 34, GOLBAT
	wildmon 32, GOLBAT
	wildmon 33, DONPHAN
	wildmon 34, ONIX
	wildmon 35, URSARING
	wildmon 35, RHYHORN
	wildmon 36, RHYDON
	; day
	wildmon 34, GOLBAT
	wildmon 32, GOLBAT
	wildmon 33, DONPHAN
	wildmon 34, ONIX
	wildmon 35, URSARING
	wildmon 35, RHYHORN
	wildmon 36, RHYDON
	; nite
	wildmon 34, GOLBAT
	wildmon 32, GOLBAT
	wildmon 33, DONPHAN
	wildmon 34, ONIX
	wildmon 35, URSARING
	wildmon 35, RHYHORN
	wildmon 36, RHYDON
	end_grass_wildmons

	db -1 ; end

; Doduo swarm
DoduoSwarmWildMons:
	def_grass_wildmons ROUTE_26
	db 10 percent ; encounter rate
	; morn
	wildmon 28, DODUO
	wildmon 28, SANDSLASH
	wildmon 32, DODUO
	wildmon 30, DODUO
	wildmon 30, RATICATE
	wildmon 30, PONYTA
	wildmon 30, ARBOK
	; day
	wildmon 28, DODUO
	wildmon 28, SANDSLASH
	wildmon 32, DODUO
	wildmon 30, DODUO
	wildmon 30, RATICATE
	wildmon 30, PONYTA
	wildmon 30, ARBOK
	; nite
	wildmon 28, DODUO
	wildmon 28, SANDSLASH
	wildmon 32, DODUO
	wildmon 30, QUAGSIRE
	wildmon 30, RATICATE
	wildmon 30, PONYTA
	wildmon 30, ARBOK
	end_grass_wildmons

	db -1 ; end

; Furret swarm
FurretSwarmWildMons:
	def_grass_wildmons ROUTE_1
	db 10 percent ; encounter rate
	; morn
	wildmon 6, FURRET
	wildmon 7, FURRET
	wildmon 3, RATTATA
	wildmon 4, SENTRET
	wildmon 4, RATTATA
	wildmon 6, PIDGEY
	wildmon 7, PIDGEY
	; day
	wildmon 6, FURRET
	wildmon 7, FURRET
	wildmon 3, RATTATA
	wildmon 4, SENTRET
	wildmon 4, RATTATA
	wildmon 6, PIDGEY
	wildmon 7, PIDGEY
	; nite
	wildmon 6, FURRET
	wildmon 7, FURRET
	wildmon 3, RATTATA
	wildmon 4, RATTATA
	wildmon 4, HOOTHOOT
	wildmon 6, HOOTHOOT
	wildmon 7, HOOTHOOT
	end_grass_wildmons

	db -1 ; end

; Pikachu swarm
PikachuSwarmWildMons:
	def_grass_wildmons VIRIDIAN_FOREST
	db 6 percent ; encounter rate
	; morn
	wildmon 3, PIKACHU
	wildmon 4, PIKACHU
	wildmon 5, METAPOD
	wildmon 5, KAKUNA
	wildmon 7, PIKACHU
	wildmon 8, BUTTERFREE
	wildmon 8, BEEDRILL
	; day
	wildmon 3, PIKACHU
	wildmon 4, PIKACHU
	wildmon 5, METAPOD
	wildmon 5, KAKUNA
	wildmon 7, PIKACHU
	wildmon 8, BUTTERFREE
	wildmon 8, BEEDRILL
	; nite
	wildmon 3, PIKACHU
	wildmon 4, PIKACHU
	wildmon 5, HOOTHOOT
	wildmon 5, NOCTOWL
	wildmon 7, PIKACHU
	wildmon 8, NOCTOWL
	wildmon 8, NOCTOWL
	end_grass_wildmons

	db -1 ; end

; Magmar swarm
MagmarSwarmWildMons:
	def_grass_wildmons POKEMON_MANSION_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 35, MAGMAR
	wildmon 35, MAGMAR
	wildmon 32, SLUGMA
	wildmon 30, DITTO
	wildmon 40, MUK
	wildmon 34, GRIMER
	wildmon 38, KOFFING
	; day
	wildmon 35, MAGMAR
	wildmon 35, MAGMAR
	wildmon 32, SLUGMA
	wildmon 30, DITTO
	wildmon 40, MUK
	wildmon 34, GRIMER
	wildmon 38, KOFFING
	; nite
	wildmon 35, MAGMAR
	wildmon 35, MAGMAR
	wildmon 32, SLUGMA
	wildmon 30, DITTO
	wildmon 40, MUK
	wildmon 34, GRIMER
	wildmon 38, KOFFING
	end_grass_wildmons

	def_grass_wildmons POKEMON_MANSION_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 36, MAGMAR
	wildmon 37, MAGMAR
	wildmon 35, SLUGMA
	wildmon 35, KOFFING
	wildmon 40, MAGMAR
	wildmon 32, DITTO
	wildmon 42, WEEZING
	; day
	wildmon 36, MAGMAR
	wildmon 37, MAGMAR
	wildmon 35, SLUGMA
	wildmon 35, KOFFING
	wildmon 40, MAGMAR
	wildmon 32, DITTO
	wildmon 42, WEEZING
	; nite
	wildmon 36, MAGMAR
	wildmon 37, MAGMAR
	wildmon 35, SLUGMA
	wildmon 35, KOFFING
	wildmon 40, MAGMAR
	wildmon 32, DITTO
	wildmon 42, WEEZING
	end_grass_wildmons

	db -1 ; end

; Geodude swarm
GeodudeSwarmWildMons:
	def_grass_wildmons MOUNT_MOON_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 8, GEODUDE
	wildmon 10, GEODUDE
	wildmon 12, SANDSHREW
	wildmon 12, ZUBAT
	wildmon 11, PARAS
	wildmon 10, ZUBAT
	wildmon 12, CLEFAIRY
	; day
	wildmon 8, GEODUDE
	wildmon 10, GEODUDE
	wildmon 12, SANDSHREW
	wildmon 12, ZUBAT
	wildmon 11, PARAS
	wildmon 10, ZUBAT
	wildmon 12, CLEFAIRY
	; nite
	wildmon 8, GEODUDE
	wildmon 10, GEODUDE
	wildmon 12, SANDSHREW
	wildmon 12, ZUBAT
	wildmon 11, PARAS
	wildmon 10, ZUBAT
	wildmon 12, CLEFAIRY
	end_grass_wildmons

	db -1 ; end

; Jigglypuff swarm
JigglypuffSwarmWildMons:
	def_grass_wildmons ROUTE_5
	db 10 percent ; encounter rate
	; morn
	wildmon 14, JIGGLYPUFF
	wildmon 15, JIGGLYPUFF
	wildmon 15, SNUBBULL
	wildmon 17, JIGGLYPUFF
	wildmon 12, PIDGEY
	wildmon 14, PIDGEOTTO
	wildmon 14, ABRA
	; day
	wildmon 14, JIGGLYPUFF
	wildmon 15, JIGGLYPUFF
	wildmon 15, SNUBBULL
	wildmon 17, JIGGLYPUFF
	wildmon 12, PIDGEY
	wildmon 14, PIDGEOTTO
	wildmon 14, ABRA
	; nite
	wildmon 14, JIGGLYPUFF
	wildmon 15, JIGGLYPUFF
	wildmon 15, MEOWTH
	wildmon 17, JIGGLYPUFF
	wildmon 12, HOOTHOOT
	wildmon 14, NOCTOWL
	wildmon 14, ABRA
	end_grass_wildmons

	db -1 ; end

; Meowth swarm
MeowthSwarmWildMons:
	def_grass_wildmons ROUTE_11
	db 10 percent ; encounter rate
	; morn
	wildmon 18, MEOWTH
	wildmon 20, MEOWTH
	wildmon 20, RATICATE
	wildmon 19, MAGNEMITE
	wildmon 17, MEOWTH
	wildmon 18, HOPPIP
	wildmon 18, HOPPIP
	; day
	wildmon 18, MEOWTH
	wildmon 20, MEOWTH
	wildmon 20, RATICATE
	wildmon 19, MAGNEMITE
	wildmon 17, MEOWTH
	wildmon 18, HOPPIP
	wildmon 18, HOPPIP
	; nite
	wildmon 18, MEOWTH
	wildmon 20, MEOWTH
	wildmon 16, DROWZEE
	wildmon 19, MAGNEMITE
	wildmon 17, MEOWTH
	wildmon 18, HYPNO
	wildmon 18, HYPNO
	end_grass_wildmons

	db -1 ; end

; Fearow swarm
FearowSwarmWildMons:
	def_grass_wildmons ROUTE_9
	db 10 percent ; encounter rate
	; morn
	wildmon 18, FEAROW
	wildmon 20, FEAROW
	wildmon 16, MANKEY
	wildmon 17, SPEAROW
	wildmon 19, FEAROW
	wildmon 18, PRIMEAPE
	wildmon 18, PRIMEAPE
	; day
	wildmon 18, FEAROW
	wildmon 20, FEAROW
	wildmon 16, MANKEY
	wildmon 17, SPEAROW
	wildmon 19, FEAROW
	wildmon 18, PRIMEAPE
	wildmon 18, PRIMEAPE
	; nite
	wildmon 18, FEAROW
	wildmon 20, FEAROW
	wildmon 16, MANKEY
	wildmon 17, VENONAT
	wildmon 19, FEAROW
	wildmon 18, VENOMOTH
	wildmon 18, PRIMEAPE
	end_grass_wildmons

	db -1 ; end

; Cubone swarm
CuboneSwarmWildMons:
	def_grass_wildmons ROCK_TUNNEL_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 15, CUBONE
	wildmon 16, CUBONE
	wildmon 17, MACHOP
	wildmon 17, ZUBAT
	wildmon 21, MACHOKE
	wildmon 17, GEODUDE
	wildmon 19, CUBONE
	; day
	wildmon 15, CUBONE
	wildmon 16, CUBONE
	wildmon 17, MACHOP
	wildmon 17, ZUBAT
	wildmon 21, MACHOKE
	wildmon 17, GEODUDE
	wildmon 19, CUBONE
	; nite
	wildmon 15, CUBONE
	wildmon 16, CUBONE
	wildmon 17, MACHOP
	wildmon 17, ZUBAT
	wildmon 21, MACHOKE
	wildmon 17, GEODUDE
	wildmon 19, CUBONE
	end_grass_wildmons

	def_grass_wildmons ROCK_TUNNEL_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 17, CUBONE
	wildmon 18, CUBONE
	wildmon 17, ONIX
	wildmon 20, CUBONE
	wildmon 22, MAROWAK
	wildmon 20, KANGASKHAN
	wildmon 22, KANGASKHAN
	; day
	wildmon 17, CUBONE
	wildmon 18, CUBONE
	wildmon 17, ONIX
	wildmon 20, CUBONE
	wildmon 22, MAROWAK
	wildmon 20, KANGASKHAN
	wildmon 22, KANGASKHAN
	; nite
	wildmon 17, CUBONE
	wildmon 18, CUBONE
	wildmon 17, ONIX
	wildmon 20, CUBONE
	wildmon 22, MAROWAK
	wildmon 20, KANGASKHAN
	wildmon 22, KANGASKHAN
	end_grass_wildmons

	db -1 ; end

; Murkrow swarm
MurkrowSwarmWildMons:
	def_grass_wildmons ROUTE_7
	db 10 percent ; encounter rate
	; morn
	wildmon 22, MURKROW
	wildmon 22, MURKROW
	wildmon 20, SNUBBULL
	wildmon 24, RATICATE
	wildmon 20, JIGGLYPUFF
	wildmon 19, ABRA
	wildmon 19, ABRA
	; day
	wildmon 22, MURKROW
	wildmon 22, MURKROW
	wildmon 20, SNUBBULL
	wildmon 24, RATICATE
	wildmon 20, JIGGLYPUFF
	wildmon 19, ABRA
	wildmon 19, ABRA
	; nite
	wildmon 22, MURKROW
	wildmon 22, MURKROW
	wildmon 20, HOUNDOUR
	wildmon 24, PERSIAN
	wildmon 20, JIGGLYPUFF
	wildmon 19, ABRA
	wildmon 19, ABRA
	end_grass_wildmons

	db -1 ; end

; Haunter swarm
HaunterSwarmWildMons:
	def_grass_wildmons ROUTE_8
	db 10 percent ; encounter rate
	; morn
	wildmon 24, HAUNTER
	wildmon 24, HAUNTER
	wildmon 22, SNUBBULL
	wildmon 19, ABRA
	wildmon 24, HAUNTER
	wildmon 20, KADABRA
	wildmon 27, KADABRA
	; day
	wildmon 24, HAUNTER
	wildmon 24, HAUNTER
	wildmon 22, SNUBBULL
	wildmon 19, ABRA
	wildmon 24, HAUNTER
	wildmon 20, KADABRA
	wildmon 27, KADABRA
	; nite
	wildmon 24, HAUNTER
	wildmon 24, HAUNTER
	wildmon 22, MEOWTH
	wildmon 19, ABRA
	wildmon 24, HAUNTER
	wildmon 20, KADABRA
	wildmon 27, KADABRA
	end_grass_wildmons

	db -1 ; end

; Slugma swarm
SlugmaSwarmWildMons:
	def_grass_wildmons ROUTE_16_WEST
	db 10 percent ; encounter rate
	; morn
	wildmon 27, SLUGMA
	wildmon 29, SLUGMA
	wildmon 26, GRIMER
	wildmon 28, GRIMER
	wildmon 29, SLUGMA
	wildmon 30, MUK
	wildmon 30, MUK
	; day
	wildmon 27, SLUGMA
	wildmon 29, SLUGMA
	wildmon 26, GRIMER
	wildmon 28, GRIMER
	wildmon 29, SLUGMA
	wildmon 30, MUK
	wildmon 30, MUK
	; nite
	wildmon 27, SLUGMA
	wildmon 29, SLUGMA
	wildmon 26, GRIMER
	wildmon 28, GRIMER
	wildmon 29, SLUGMA
	wildmon 30, MUK
	wildmon 30, MUK
	end_grass_wildmons

	db -1 ; end

; Voltorb swarm
VoltorbSwarmWildMons:
	def_grass_wildmons ROUTE_10_NORTH
	db 10 percent ; encounter rate
	; morn
	wildmon 17, VOLTORB
	wildmon 18, VOLTORB
	wildmon 16, MANKEY
	wildmon 17, MAGNEMITE
	wildmon 20, VOLTORB
	wildmon 18, PRIMEAPE
	wildmon 18, PRIMEAPE
	; day
	wildmon 17, VOLTORB
	wildmon 18, VOLTORB
	wildmon 16, MANKEY
	wildmon 17, MAGNEMITE
	wildmon 20, VOLTORB
	wildmon 18, PRIMEAPE
	wildmon 18, PRIMEAPE
	; nite
	wildmon 17, VOLTORB
	wildmon 18, VOLTORB
	wildmon 16, MANKEY
	wildmon 17, MAGNEMITE
	wildmon 20, VOLTORB
	wildmon 18, PRIMEAPE
	wildmon 18, PRIMEAPE
	end_grass_wildmons

	db -1 ; end

; Nidorino swarm
NidorinoSwarmWildMons:
	def_grass_wildmons ROUTE_14
	db 10 percent ; encounter rate
	; morn
	wildmon 28, NIDORINO
	wildmon 28, NIDORINO
	wildmon 28, NIDORINA
	wildmon 30, PIDGEOTTO
	wildmon 30, NIDORINO
	wildmon 30, SKIPLOOM
	wildmon 30, CHANSEY
	; day
	wildmon 28, NIDORINO
	wildmon 28, NIDORINO
	wildmon 28, NIDORINA
	wildmon 30, PIDGEOTTO
	wildmon 30, NIDORINO
	wildmon 30, SKIPLOOM
	wildmon 30, CHANSEY
	; nite
	wildmon 28, NIDORINO
	wildmon 28, NIDORINO
	wildmon 28, QUAGSIRE
	wildmon 30, NOCTOWL
	wildmon 28, NIDORINA
	wildmon 30, QUAGSIRE
	wildmon 30, CHANSEY
	end_grass_wildmons

	db -1 ; end

; Farfetch'd swarm
FarfetchDSwarmWildMons:
	def_grass_wildmons ROUTE_13
	db 10 percent ; encounter rate
	; morn
	wildmon 25, FARFETCH_D
	wildmon 28, FARFETCH_D
	wildmon 25, NIDORINO
	wildmon 25, NIDORINA
	wildmon 27, FARFETCH_D
	wildmon 29, SKIPLOOM
	wildmon 31, CHANSEY
	; day
	wildmon 25, FARFETCH_D
	wildmon 28, FARFETCH_D
	wildmon 25, NIDORINO
	wildmon 25, NIDORINA
	wildmon 27, FARFETCH_D
	wildmon 29, SKIPLOOM
	wildmon 31, CHANSEY
	; nite
	wildmon 25, FARFETCH_D
	wildmon 28, FARFETCH_D
	wildmon 25, VENONAT
	wildmon 25, QUAGSIRE
	wildmon 27, FARFETCH_D
	wildmon 29, QUAGSIRE
	wildmon 31, CHANSEY
	end_grass_wildmons

	db -1 ; end

; Seel swarm
SeelSwarmWildMons:
	def_grass_wildmons SEAFOAM_ISLANDS_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 32, SEEL
	wildmon 34, SEEL
	wildmon 34, GOLBAT
	wildmon 28, PSYDUCK
	wildmon 34, GOLDUCK
	wildmon 28, ZUBAT
	wildmon 29, ZUBAT
	; day
	wildmon 32, SEEL
	wildmon 34, SEEL
	wildmon 34, GOLBAT
	wildmon 28, PSYDUCK
	wildmon 34, GOLDUCK
	wildmon 28, ZUBAT
	wildmon 29, ZUBAT
	; nite
	wildmon 32, SEEL
	wildmon 34, SEEL
	wildmon 34, GOLBAT
	wildmon 28, PSYDUCK
	wildmon 35, GOLDUCK
	wildmon 28, ZUBAT
	wildmon 29, ZUBAT
	end_grass_wildmons

	def_grass_wildmons SEAFOAM_ISLANDS_B2F
	db 6 percent ; encounter rate
	; morn
	wildmon 33, SEEL
	wildmon 35, SEEL
	wildmon 35, GOLBAT
	wildmon 30, PSYDUCK
	wildmon 35, GOLDUCK
	wildmon 29, ZUBAT
	wildmon 30, ZUBAT
	; day
	wildmon 33, SEEL
	wildmon 35, SEEL
	wildmon 35, GOLBAT
	wildmon 30, PSYDUCK
	wildmon 35, GOLDUCK
	wildmon 29, ZUBAT
	wildmon 30, ZUBAT
	; nite
	wildmon 33, SEEL
	wildmon 35, SEEL
	wildmon 35, GOLBAT
	wildmon 30, PSYDUCK
	wildmon 35, GOLDUCK
	wildmon 29, ZUBAT
	wildmon 30, ZUBAT
	end_grass_wildmons

	def_grass_wildmons SEAFOAM_ISLANDS_B3F
	db 6 percent ; encounter rate
	; morn
	wildmon 34, SEEL
	wildmon 36, SEEL
	wildmon 32, PSYDUCK
	wildmon 36, GOLDUCK
	wildmon 36, DEWGONG
	wildmon 36, GOLBAT
	wildmon 32, ZUBAT
	; day
	wildmon 34, SEEL
	wildmon 36, SEEL
	wildmon 32, PSYDUCK
	wildmon 36, GOLDUCK
	wildmon 36, DEWGONG
	wildmon 36, GOLBAT
	wildmon 32, ZUBAT
	; nite
	wildmon 34, SEEL
	wildmon 36, SEEL
	wildmon 32, PSYDUCK
	wildmon 36, GOLDUCK
	wildmon 36, DEWGONG
	wildmon 36, GOLBAT
	wildmon 32, ZUBAT
	end_grass_wildmons

	def_grass_wildmons SEAFOAM_ISLANDS_B4F
	db 6 percent ; encounter rate
	; morn
	wildmon 38, SEEL
	wildmon 34, SEEL
	wildmon 34, PSYDUCK
	wildmon 38, GOLDUCK
	wildmon 40, DEWGONG
	wildmon 40, JYNX
	wildmon 40, JYNX
	; day
	wildmon 38, SEEL
	wildmon 34, SEEL
	wildmon 34, PSYDUCK
	wildmon 38, GOLDUCK
	wildmon 40, DEWGONG
	wildmon 40, JYNX
	wildmon 40, JYNX
	; nite
	wildmon 38, SEEL
	wildmon 34, SEEL
	wildmon 34, PSYDUCK
	wildmon 38, GOLDUCK
	wildmon 40, DEWGONG
	wildmon 40, JYNX
	wildmon 40, JYNX
	end_grass_wildmons

	db -1 ; end

; Rhyhorn swarm
RhyhornSwarmWildMons:
	def_grass_wildmons VICTORY_ROAD_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 34, RHYHORN
	wildmon 32, RHYHORN
	wildmon 33, DONPHAN
	wildmon 34, RHYHORN
	wildmon 35, URSARING
	wildmon 35, GOLBAT
	wildmon 36, RHYDON
	; day
	wildmon 34, RHYHORN
	wildmon 32, RHYHORN
	wildmon 33, DONPHAN
	wildmon 34, RHYHORN
	wildmon 35, URSARING
	wildmon 35, GOLBAT
	wildmon 36, RHYDON
	; nite
	wildmon 34, RHYHORN
	wildmon 32, RHYHORN
	wildmon 33, DONPHAN
	wildmon 34, RHYHORN
	wildmon 35, URSARING
	wildmon 35, GOLBAT
	wildmon 36, RHYDON
	end_grass_wildmons

	db -1 ; end

; Mr.Mime swarm
MrMimeSwarmWildMons:
	def_grass_wildmons ROUTE_21
	db 6 percent ; encounter rate
	; morn
	wildmon 27, MR__MIME
	wildmon 25, MR__MIME
	wildmon 35, TANGELA
	wildmon 20, RATICATE
	wildmon 30, TANGELA
	wildmon 28, MR__MIME
	wildmon 28, MR__MIME
	; day
	wildmon 27, MR__MIME
	wildmon 25, MR__MIME
	wildmon 35, TANGELA
	wildmon 20, RATICATE
	wildmon 28, MR__MIME
	wildmon 30, MR__MIME
	wildmon 30, MR__MIME
	; nite
	wildmon 27, MR__MIME
	wildmon 25, MR__MIME
	wildmon 35, TANGELA
	wildmon 20, RATICATE
	wildmon 30, TANGELA
	wildmon 28, MR__MIME
	wildmon 28, MR__MIME
	end_grass_wildmons

	db -1 ; end

; Raticate swarm
RaticateSwarmWildMons:
	def_grass_wildmons ROUTE_1
	db 10 percent ; encounter rate
	; morn
	wildmon 6, RATICATE
	wildmon 8, RATICATE
	wildmon 4, SENTRET
	wildmon 4, PIDGEY
	wildmon 7, RATICATE
	wildmon 6, PIDGEY
	wildmon 7, FURRET
	; day
	wildmon 6, RATICATE
	wildmon 8, RATICATE
	wildmon 4, SENTRET
	wildmon 4, PIDGEY
	wildmon 7, RATICATE
	wildmon 6, PIDGEY
	wildmon 7, FURRET
	; nite
	wildmon 6, RATICATE
	wildmon 8, RATICATE
	wildmon 4, RATTATA
	wildmon 4, HOOTHOOT
	wildmon 7, RATICATE
	wildmon 6, HOOTHOOT
	wildmon 7, HOOTHOOT
	end_grass_wildmons

	db -1 ; end

; Bulbasaur swarm
BulbasaurSwarmWildMons:
	def_grass_wildmons VIRIDIAN_FOREST
	db 6 percent ; encounter rate
	; morn
	wildmon 3, CATERPIE
	wildmon 3, WEEDLE
	wildmon 5, METAPOD
	wildmon 5, KAKUNA
	wildmon 8, BULBASAUR
	wildmon 8, BULBASAUR
	wildmon 7, PIKACHU
	; day
	wildmon 3, CATERPIE
	wildmon 3, WEEDLE
	wildmon 5, METAPOD
	wildmon 5, KAKUNA
	wildmon 8, BULBASAUR
	wildmon 8, BULBASAUR
	wildmon 7, PIKACHU
	; nite
	wildmon 3, HOOTHOOT
	wildmon 3, HOOTHOOT
	wildmon 5, HOOTHOOT
	wildmon 5, NOCTOWL
	wildmon 8, BULBASAUR
	wildmon 8, BULBASAUR
	wildmon 7, PIKACHU
	end_grass_wildmons

	db -1 ; end

; Charmander swarm
CharmanderSwarmWildMons:
	def_grass_wildmons ROUTE_22
	db 10 percent ; encounter rate
	; morn
	wildmon 3, RATTATA
	wildmon 3, SPEAROW
	wildmon 5, SPEAROW
	wildmon 4, DODUO
	wildmon 8, CHARMANDER
	wildmon 8, CHARMANDER
	wildmon 6, PONYTA
	; day
	wildmon 3, RATTATA
	wildmon 3, SPEAROW
	wildmon 5, SPEAROW
	wildmon 4, DODUO
	wildmon 8, CHARMANDER
	wildmon 8, CHARMANDER
	wildmon 6, PONYTA
	; nite
	wildmon 3, RATTATA
	wildmon 3, POLIWAG
	wildmon 5, RATTATA
	wildmon 4, POLIWAG
	wildmon 8, CHARMANDER
	wildmon 8, CHARMANDER
	wildmon 6, PONYTA
	end_grass_wildmons

	db -1 ; end

; Clefairy swarm
ClefairySwarmWildMons:
	def_grass_wildmons MOUNT_MOON_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 8, CLEFAIRY
	wildmon 10, CLEFAIRY
	wildmon 12, SANDSHREW
	wildmon 12, PARAS
	wildmon 11, ZUBAT
	wildmon 10, GEODUDE
	wildmon 12, GEODUDE
	; day
	wildmon 8, CLEFAIRY
	wildmon 10, CLEFAIRY
	wildmon 12, SANDSHREW
	wildmon 12, PARAS
	wildmon 11, ZUBAT
	wildmon 10, GEODUDE
	wildmon 12, GEODUDE
	; nite
	wildmon 8, CLEFAIRY
	wildmon 10, CLEFAIRY
	wildmon 12, SANDSHREW
	wildmon 12, PARAS
	wildmon 11, ZUBAT
	wildmon 10, GEODUDE
	wildmon 12, CLEFAIRY
	end_grass_wildmons

	db -1 ; end

; Noctowl swarm
NoctowlSwarmWildMons:
	def_grass_wildmons ROUTE_5
	db 10 percent ; encounter rate
	; morn
	wildmon 15, NOCTOWL
	wildmon 17, NOCTOWL
	wildmon 15, SNUBBULL
	wildmon 12, PIDGEY
	wildmon 14, JIGGLYPUFF
	wildmon 14, PIDGEOTTO
	wildmon 14, ABRA
	; day
	wildmon 15, NOCTOWL
	wildmon 17, NOCTOWL
	wildmon 15, SNUBBULL
	wildmon 12, PIDGEY
	wildmon 14, JIGGLYPUFF
	wildmon 14, PIDGEOTTO
	wildmon 14, ABRA
	; nite
	wildmon 13, NOCTOWL
	wildmon 15, NOCTOWL
	wildmon 13, MEOWTH
	wildmon 12, HOOTHOOT
	wildmon 14, JIGGLYPUFF
	wildmon 14, NOCTOWL
	wildmon 14, ABRA
	end_grass_wildmons

	db -1 ; end

; Abra swarm
AbraSwarmWildMons:
	def_grass_wildmons ROUTE_6
	db 10 percent ; encounter rate
	; morn
	wildmon 10, ABRA
	wildmon 11, ABRA
	wildmon 17, BELLSPROUT
	wildmon 17, MAGNEMITE
	wildmon 12, ABRA
	wildmon 17, SNUBBULL
	wildmon 17, GRANBULL
	; day
	wildmon 10, ABRA
	wildmon 11, ABRA
	wildmon 17, BELLSPROUT
	wildmon 17, MAGNEMITE
	wildmon 12, ABRA
	wildmon 17, SNUBBULL
	wildmon 17, GRANBULL
	; nite
	wildmon 10, ABRA
	wildmon 11, ABRA
	wildmon 17, ODDISH
	wildmon 17, MAGNEMITE
	wildmon 12, ABRA
	wildmon 17, MEOWTH
	wildmon 17, PSYDUCK
	end_grass_wildmons

	db -1 ; end

; Pidgeotto swarm
PidgeottoSwarmWildMons:
	def_grass_wildmons ROUTE_11
	db 10 percent ; encounter rate
	; morn
	wildmon 16, PIDGEOTTO
	wildmon 20, PIDGEOTTO
	wildmon 20, RATICATE
	wildmon 19, MAGNEMITE
	wildmon 17, PIDGEOTTO
	wildmon 18, HOPPIP
	wildmon 18, HOPPIP
	; day
	wildmon 16, PIDGEOTTO
	wildmon 20, PIDGEOTTO
	wildmon 20, RATICATE
	wildmon 19, MAGNEMITE
	wildmon 17, PIDGEOTTO
	wildmon 18, HOPPIP
	wildmon 18, HOPPIP
	; nite
	wildmon 16, PIDGEOTTO
	wildmon 20, PIDGEOTTO
	wildmon 16, DROWZEE
	wildmon 19, MAGNEMITE
	wildmon 20, RATICATE
	wildmon 18, HYPNO
	wildmon 18, HYPNO
	end_grass_wildmons

	db -1 ; end

; Squirtle swarm
SquirtleSwarmWildMons:
	def_grass_wildmons ROUTE_25
	db 10 percent ; encounter rate
	; morn
	wildmon 13, PIDGEY
	wildmon 15, BELLSPROUT
	wildmon 16, VENONAT
	wildmon 12, ABRA
	wildmon 8, SQUIRTLE
	wildmon 8, SQUIRTLE
	wildmon 16, WEEPINBELL
	; day
	wildmon 13, PIDGEY
	wildmon 15, BELLSPROUT
	wildmon 16, VENONAT
	wildmon 12, ABRA
	wildmon 8, SQUIRTLE
	wildmon 8, SQUIRTLE
	wildmon 16, WEEPINBELL
	; nite
	wildmon 13, VENONAT
	wildmon 15, ODDISH
	wildmon 16, VENOMOTH
	wildmon 12, ABRA
	wildmon 8, SQUIRTLE
	wildmon 8, SQUIRTLE
	wildmon 16, BELLSPROUT
	end_grass_wildmons

	db -1 ; end

; Kangaskhan swarm
KangaskhanSwarmWildMons:
	def_grass_wildmons ROCK_TUNNEL_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 15, KANGASKHAN
	wildmon 16, KANGASKHAN
	wildmon 17, MACHOP
	wildmon 17, ZUBAT
	wildmon 21, MACHOKE
	wildmon 17, CUBONE
	wildmon 19, CUBONE
	; day
	wildmon 15, KANGASKHAN
	wildmon 16, KANGASKHAN
	wildmon 17, MACHOP
	wildmon 17, ZUBAT
	wildmon 21, MACHOKE
	wildmon 17, CUBONE
	wildmon 19, CUBONE
	; nite
	wildmon 15, KANGASKHAN
	wildmon 16, KANGASKHAN
	wildmon 17, MACHOP
	wildmon 17, ZUBAT
	wildmon 21, MACHOKE
	wildmon 17, CUBONE
	wildmon 19, CUBONE
	end_grass_wildmons

	def_grass_wildmons ROCK_TUNNEL_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 17, KANGASKHAN
	wildmon 20, KANGASKHAN
	wildmon 17, CUBONE
	wildmon 18, ONIX
	wildmon 22, KANGASKHAN
	wildmon 20, MAROWAK
	wildmon 22, MAROWAK
	; day
	wildmon 17, KANGASKHAN
	wildmon 20, KANGASKHAN
	wildmon 17, CUBONE
	wildmon 18, ONIX
	wildmon 22, KANGASKHAN
	wildmon 20, MAROWAK
	wildmon 22, MAROWAK
	; nite
	wildmon 17, KANGASKHAN
	wildmon 20, KANGASKHAN
	wildmon 17, CUBONE
	wildmon 18, ONIX
	wildmon 22, KANGASKHAN
	wildmon 20, MAROWAK
	wildmon 22, MAROWAK
	end_grass_wildmons

	db -1 ; end

; Electabuzz swarm
ElectabuzzSwarmWildMons:
	def_grass_wildmons ROUTE_10_SOUTH
	db 10 percent ; encounter rate
	; morn
	wildmon 33, ELECTABUZZ
	wildmon 34, ELECTABUZZ
	wildmon 33, VOLTORB
	wildmon 35, SPEAROW
	wildmon 37, ELECTABUZZ
	wildmon 33, FEAROW
	wildmon 36, RATICATE
	; day
	wildmon 33, ELECTABUZZ
	wildmon 34, ELECTABUZZ
	wildmon 33, VOLTORB
	wildmon 35, SPEAROW
	wildmon 37, ELECTABUZZ
	wildmon 33, FEAROW
	wildmon 36, RATICATE
	; nite
	wildmon 33, ELECTABUZZ
	wildmon 33, VOLTORB
	wildmon 35, QUAGSIRE
	wildmon 37, ELECTABUZZ
	wildmon 34, ELECTABUZZ
	wildmon 33, QUAGSIRE
	wildmon 36, RATICATE
	end_grass_wildmons

	db -1 ; end

; Tyrogue swarm
TyrogueSwarmWildMons:
	def_grass_wildmons ROUTE_8
	db 10 percent ; encounter rate
	; morn
	wildmon 19, TYROGUE
	wildmon 16, TYROGUE
	wildmon 22, SNUBBULL
	wildmon 24, PIDGEOTTO
	wildmon 18, TYROGUE
	wildmon 20, KADABRA
	wildmon 27, KADABRA
	; day
	wildmon 19, TYROGUE
	wildmon 16, TYROGUE
	wildmon 22, SNUBBULL
	wildmon 24, PIDGEOTTO
	wildmon 18, TYROGUE
	wildmon 20, KADABRA
	wildmon 27, KADABRA
	; nite
	wildmon 19, TYROGUE
	wildmon 16, TYROGUE
	wildmon 22, MEOWTH
	wildmon 24, NOCTOWL
	wildmon 18, TYROGUE
	wildmon 24, HAUNTER
	wildmon 27, KADABRA
	end_grass_wildmons

	db -1 ; end

; Grimer swarm
GrimerSwarmWildMons:
	def_grass_wildmons ROUTE_17_SOUTH
	db 10 percent ; encounter rate
	; morn
	wildmon 26, GRIMER
	wildmon 28, GRIMER
	wildmon 27, FEAROW
	wildmon 29, GRIMER
	wildmon 29, SLUGMA
	wildmon 30, MUK
	wildmon 32, MUK
	; day
	wildmon 26, GRIMER
	wildmon 28, GRIMER
	wildmon 27, FEAROW
	wildmon 29, GRIMER
	wildmon 29, SLUGMA
	wildmon 30, MUK
	wildmon 32, MUK
	; nite
	wildmon 26, GRIMER
	wildmon 27, GRIMER
	wildmon 28, GRIMER
	wildmon 29, MUK
	wildmon 29, SLUGMA
	wildmon 30, MUK
	wildmon 32, MUK
	end_grass_wildmons

	db -1 ; end

; Exeggcute swarm
ExeggcuteSwarmWildMons:
	def_grass_wildmons ROUTE_15
	db 10 percent ; encounter rate
	; morn
	wildmon 26, EXEGGCUTE
	wildmon 28, EXEGGCUTE
	wildmon 28, NIDORINO
	wildmon 28, NIDORINA
	wildmon 28, HOPPIP
	wildmon 30, SKIPLOOM
	wildmon 30, CHANSEY
	; day
	wildmon 26, EXEGGCUTE
	wildmon 28, EXEGGCUTE
	wildmon 28, NIDORINO
	wildmon 28, NIDORINA
	wildmon 28, HOPPIP
	wildmon 30, SKIPLOOM
	wildmon 30, CHANSEY
	; nite
	wildmon 26, EXEGGCUTE
	wildmon 28, EXEGGCUTE
	wildmon 28, VENONAT
	wildmon 32, NOCTOWL
	wildmon 28, VENOMOTH
	wildmon 30, QUAGSIRE
	wildmon 30, CHANSEY
	end_grass_wildmons

	db -1 ; end

; Nidorina swarm
NidorinaSwarmWildMons:
	def_grass_wildmons ROUTE_14
	db 10 percent ; encounter rate
	; morn
	wildmon 28, NIDORINA
	wildmon 28, NIDORINA
	wildmon 28, NIDORINO
	wildmon 30, PIDGEOTTO
	wildmon 30, NIDORINA
	wildmon 30, SKIPLOOM
	wildmon 30, CHANSEY
	; day
	wildmon 28, NIDORINA
	wildmon 28, NIDORINA
	wildmon 28, NIDORINO
	wildmon 30, PIDGEOTTO
	wildmon 30, NIDORINA
	wildmon 30, SKIPLOOM
	wildmon 30, CHANSEY
	; nite
	wildmon 28, NIDORINA
	wildmon 28, NIDORINA
	wildmon 28, QUAGSIRE
	wildmon 30, NOCTOWL
	wildmon 28, NIDORINO
	wildmon 30, QUAGSIRE
	wildmon 30, CHANSEY
	end_grass_wildmons

	db -1 ; end

; Chansey swarm
ChanseySwarmWildMons:
	def_grass_wildmons ROUTE_13
	db 10 percent ; encounter rate
	; morn
	wildmon 28, CHANSEY
	wildmon 25, CHANSEY
	wildmon 25, NIDORINO
	wildmon 25, NIDORINA
	wildmon 27, FARFETCH_D
	wildmon 29, SKIPLOOM
	wildmon 31, CHANSEY
	; day
	wildmon 28, CHANSEY
	wildmon 25, CHANSEY
	wildmon 25, NIDORINO
	wildmon 25, NIDORINA
	wildmon 27, FARFETCH_D
	wildmon 29, SKIPLOOM
	wildmon 31, CHANSEY
	; nite
	wildmon 28, CHANSEY
	wildmon 25, CHANSEY
	wildmon 25, VENONAT
	wildmon 25, QUAGSIRE
	wildmon 27, FARFETCH_D
	wildmon 29, QUAGSIRE
	wildmon 31, CHANSEY
	end_grass_wildmons

	db -1 ; end

; Jynx swarm
JynxSwarmWildMons:
	def_grass_wildmons SEAFOAM_ISLANDS_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 32, JYNX
	wildmon 34, JYNX
	wildmon 34, SEEL
	wildmon 28, PSYDUCK
	wildmon 34, GOLDUCK
	wildmon 28, GOLBAT
	wildmon 29, ZUBAT
	; day
	wildmon 32, JYNX
	wildmon 34, JYNX
	wildmon 34, SEEL
	wildmon 28, PSYDUCK
	wildmon 34, GOLDUCK
	wildmon 28, GOLBAT
	wildmon 29, ZUBAT
	; nite
	wildmon 32, JYNX
	wildmon 34, JYNX
	wildmon 34, SEEL
	wildmon 28, PSYDUCK
	wildmon 34, GOLDUCK
	wildmon 28, GOLBAT
	wildmon 29, ZUBAT
	end_grass_wildmons

	def_grass_wildmons SEAFOAM_ISLANDS_B2F
	db 6 percent ; encounter rate
	; morn
	wildmon 33, JYNX
	wildmon 35, JYNX
	wildmon 35, SEEL
	wildmon 30, PSYDUCK
	wildmon 35, GOLDUCK
	wildmon 29, GOLBAT
	wildmon 30, ZUBAT
	; day
	wildmon 33, JYNX
	wildmon 35, JYNX
	wildmon 35, SEEL
	wildmon 30, PSYDUCK
	wildmon 35, GOLDUCK
	wildmon 29, GOLBAT
	wildmon 30, ZUBAT
	; nite
	wildmon 33, JYNX
	wildmon 35, JYNX
	wildmon 35, SEEL
	wildmon 30, PSYDUCK
	wildmon 35, GOLDUCK
	wildmon 29, GOLBAT
	wildmon 30, ZUBAT
	end_grass_wildmons

	def_grass_wildmons SEAFOAM_ISLANDS_B3F
	db 6 percent ; encounter rate
	; morn
	wildmon 36, JYNX
	wildmon 36, JYNX
	wildmon 36, DEWGONG
	wildmon 36, GOLDUCK
	wildmon 32, PSYDUCK
	wildmon 34, SEEL
	wildmon 32, ZUBAT
	; day
	wildmon 36, JYNX
	wildmon 36, JYNX
	wildmon 36, DEWGONG
	wildmon 36, GOLDUCK
	wildmon 32, PSYDUCK
	wildmon 34, SEEL
	wildmon 32, ZUBAT
	; nite
	wildmon 36, JYNX
	wildmon 36, JYNX
	wildmon 36, DEWGONG
	wildmon 36, GOLDUCK
	wildmon 32, PSYDUCK
	wildmon 34, SEEL
	wildmon 32, ZUBAT
	end_grass_wildmons

	def_grass_wildmons SEAFOAM_ISLANDS_B4F
	db 6 percent ; encounter rate
	; morn
	wildmon 38, JYNX
	wildmon 36, JYNX
	wildmon 38, DEWGONG
	wildmon 38, GOLDUCK
	wildmon 40, JYNX
	wildmon 34, SEEL
	wildmon 40, GOLBAT
	; day
	wildmon 38, JYNX
	wildmon 36, JYNX
	wildmon 38, DEWGONG
	wildmon 38, GOLDUCK
	wildmon 40, JYNX
	wildmon 34, SEEL
	wildmon 40, GOLBAT
	; nite
	wildmon 38, JYNX
	wildmon 36, JYNX
	wildmon 38, DEWGONG
	wildmon 38, GOLDUCK
	wildmon 40, JYNX
	wildmon 34, SEEL
	wildmon 40, GOLBAT
	end_grass_wildmons

	db -1 ; end

; Yanma swarm
YanmaSwarmWildMons:
	def_grass_wildmons ROUTE_35
	db 10 percent ; encounter rate
	; morn
	wildmon 12, NIDORAN_M
	wildmon 12, NIDORAN_F
	wildmon 12, YANMA
	wildmon 14, YANMA
	wildmon 14, PIDGEY
	wildmon 10, DITTO
	wildmon 10, DITTO
	; day
	wildmon 12, NIDORAN_M
	wildmon 12, NIDORAN_F
	wildmon 12, YANMA
	wildmon 14, YANMA
	wildmon 14, PIDGEY
	wildmon 10, DITTO
	wildmon 10, DITTO
	; nite
	wildmon 12, NIDORAN_M
	wildmon 12, NIDORAN_F
	wildmon 12, YANMA
	wildmon 14, YANMA
	wildmon 14, HOOTHOOT
	wildmon 10, DITTO
	wildmon 10, DITTO
	end_grass_wildmons

	db -1 ; end

; Marill swarm
MarillSwarmWildMons:
	def_grass_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 6 percent ; encounter rate
	; morn
	wildmon 13, MARILL
	wildmon 15, MARILL
	wildmon 13, ZUBAT
	wildmon 13, MACHOP
	wildmon 14, GEODUDE
	wildmon 16, RATTATA
	wildmon 16, RATICATE
	; day
	wildmon 13, MARILL
	wildmon 15, MARILL
	wildmon 13, ZUBAT
	wildmon 13, MACHOP
	wildmon 14, GEODUDE
	wildmon 16, RATTATA
	wildmon 16, RATICATE
	; nite
	wildmon 13, MARILL
	wildmon 15, MARILL
	wildmon 13, ZUBAT
	wildmon 13, GOLBAT
	wildmon 14, GEODUDE
	wildmon 16, RATTATA
	wildmon 16, RATICATE

	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_1F_INSIDE
	db 6 percent ; encounter rate
	; morn
	wildmon 13, MARILL
	wildmon 15, MARILL
	wildmon 15, MACHOP
	wildmon 14, RATICATE
	wildmon 15, ZUBAT
	wildmon 15, GOLBAT
	wildmon 15, GOLBAT
	; day
	wildmon 13, MARILL
	wildmon 15, MARILL
	wildmon 15, MACHOP
	wildmon 14, RATICATE
	wildmon 15, ZUBAT
	wildmon 15, GOLBAT
	wildmon 15, GOLBAT
	; nite
	wildmon 13, MARILL
	wildmon 15, MARILL
	wildmon 15, RATICATE
	wildmon 14, ZUBAT
	wildmon 15, MARILL
	wildmon 15, GOLBAT
	wildmon 15, GOLBAT

	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_2F_INSIDE
	db 6 percent ; encounter rate
	; morn
	wildmon 31, MARILL
	wildmon 32, MARILL
	wildmon 31, GRAVELER
	wildmon 30, RATICATE
	wildmon 32, MACHOKE
	wildmon 30, GOLBAT
	wildmon 30, GOLBAT
	; day
	wildmon 31, MARILL
	wildmon 32, MARILL
	wildmon 31, GRAVELER
	wildmon 30, RATICATE
	wildmon 32, MACHOKE
	wildmon 30, GOLBAT
	wildmon 30, GOLBAT
	; nite
	wildmon 31, MARILL
	wildmon 32, MARILL
	wildmon 31, GRAVELER
	wildmon 30, RATICATE
	wildmon 32, MARILL
	wildmon 30, GOLBAT
	wildmon 30, GOLBAT

	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 15, MARILL
	wildmon 17, MARILL
	wildmon 17, GOLBAT
	wildmon 16, MACHOP
	wildmon 16, GEODUDE
	wildmon 18, RATICATE
	wildmon 18, RATICATE
	; day
	wildmon 15, MARILL
	wildmon 17, MARILL
	wildmon 17, GOLBAT
	wildmon 16, MACHOP
	wildmon 16, GEODUDE
	wildmon 18, RATICATE
	wildmon 18, RATICATE
	; nite
	wildmon 15, MARILL
	wildmon 17, MARILL
	wildmon 17, GOLBAT
	wildmon 16, MARILL
	wildmon 16, GEODUDE
	wildmon 18, RATICATE
	wildmon 18, RATICATE
	end_grass_wildmons

	db -1 ; end

; Magnemite swarm
MagnemiteSwarmWildMons:
	def_grass_wildmons ROUTE_38
	db 10 percent ; encounter rate
	; morn
	wildmon 14, MAGNEMITE
	wildmon 16, MAGNEMITE
	wildmon 16, RATICATE
	wildmon 16, PIDGEOTTO
	wildmon 13, TAUROS
	wildmon 13, MILTANK
	wildmon 13, MILTANK
	; day
	wildmon 14, MAGNEMITE
	wildmon 16, MAGNEMITE
	wildmon 16, RATICATE
	wildmon 16, PIDGEOTTO
	wildmon 13, TAUROS
	wildmon 13, MILTANK
	wildmon 13, MILTANK
	; nite
	wildmon 14, MAGNEMITE
	wildmon 16, MAGNEMITE
	wildmon 16, RATICATE
	wildmon 16, NOCTOWL
	wildmon 16, MEOWTH
	wildmon 16, MEOWTH
	wildmon 16, MEOWTH
	end_grass_wildmons

	db -1 ; end

; Phanpy swarm
PhanpySwarmWildMons:
	def_grass_wildmons ROUTE_46
	db 10 percent ; encounter rate
	; morn
	wildmon 2, PHANPY
	wildmon 3, PHANPY
	wildmon 2, SPEAROW
	wildmon 3, GEODUDE
	wildmon 2, PHANPY
	wildmon 2, RATTATA
	wildmon 2, RATTATA
	; day
	wildmon 2, PHANPY
	wildmon 3, PHANPY
	wildmon 2, SPEAROW
	wildmon 3, GEODUDE
	wildmon 2, PHANPY
	wildmon 2, RATTATA
	wildmon 2, RATTATA
	; nite
	wildmon 2, PHANPY
	wildmon 3, PHANPY
	wildmon 2, RATTATA
	wildmon 3, GEODUDE
	wildmon 2, PHANPY
	wildmon 2, RATTATA
	wildmon 2, RATTATA
	end_grass_wildmons

	db -1 ; end

; Caterpie swarm
CaterpieSwarmWildMons:
	def_grass_wildmons ROUTE_30
	db 10 percent ; encounter rate
	; morn
	wildmon 3, CATERPIE
	wildmon 3, CATERPIE
	wildmon 4, CATERPIE
	wildmon 4, PIDGEY
	wildmon 3, WEEDLE
	wildmon 4, HOPPIP
	wildmon 4, HOPPIP
	; day
	wildmon 3, CATERPIE
	wildmon 3, CATERPIE
	wildmon 4, CATERPIE
	wildmon 4, PIDGEY
	wildmon 3, WEEDLE
	wildmon 4, HOPPIP
	wildmon 4, HOPPIP
	; nite
	wildmon 3, CATERPIE
	wildmon 4, CATERPIE
	wildmon 3, SPINARAK
	wildmon 4, POLIWAG
	wildmon 4, CATERPIE
	wildmon 3, ZUBAT
	wildmon 4, HOOTHOOT
	end_grass_wildmons

	db -1 ; end

; Spinarak swarm
SpinarakSwarmWildMons:
	def_grass_wildmons ROUTE_31
	db 10 percent ; encounter rate
	; morn
	wildmon 4, LEDYBA
	wildmon 4, SPINARAK
	wildmon 5, BELLSPROUT
	wildmon 5, PIDGEY
	wildmon 4, SPINARAK
	wildmon 5, SPINARAK
	wildmon 5, HOPPIP
	; day
	wildmon 4, PIDGEY
	wildmon 4, SPINARAK
	wildmon 5, BELLSPROUT
	wildmon 5, PIDGEY
	wildmon 4, SPINARAK
	wildmon 5, SPINARAK
	wildmon 5, HOPPIP
	; nite
	wildmon 4, SPINARAK
	wildmon 4, SPINARAK
	wildmon 5, BELLSPROUT
	wildmon 5, HOOTHOOT
	wildmon 4, SPINARAK
	wildmon 5, POLIWAG
	wildmon 5, GASTLY
	end_grass_wildmons

	db -1 ; end

; Paras swarm
ParasSwarmWildMons:
	def_grass_wildmons ILEX_FOREST
	db 4 percent ; encounter rate
	; morn
	wildmon 5, PARAS
	wildmon 5, PARAS
	wildmon 7, METAPOD
	wildmon 7, KAKUNA
	wildmon 7, ZUBAT
	wildmon 6, CATERPIE
	wildmon 6, WEEDLE
	; day
	wildmon 5, PARAS
	wildmon 5, PARAS
	wildmon 7, METAPOD
	wildmon 7, KAKUNA
	wildmon 7, ZUBAT
	wildmon 6, CATERPIE
	wildmon 6, WEEDLE
	; nite
	wildmon 5, PARAS
	wildmon 5, PARAS
	wildmon 7, ODDISH
	wildmon 7, PSYDUCK
	wildmon 7, ZUBAT
	wildmon 6, VENONAT
	wildmon 6, VENONAT
	end_grass_wildmons

	db -1 ; end

; Hoppip swarm
HoppipSwarmWildMons:
	def_grass_wildmons ROUTE_29
	db 10 percent ; encounter rate
	; morn
	wildmon 2, HOPPIP
	wildmon 3, HOPPIP
	wildmon 2, PIDGEY
	wildmon 3, SENTRET
	wildmon 2, RATTATA
	wildmon 3, HOPPIP
	wildmon 3, HOPPIP
	; day
	wildmon 2, HOPPIP
	wildmon 3, HOPPIP
	wildmon 2, PIDGEY
	wildmon 3, SENTRET
	wildmon 2, RATTATA
	wildmon 3, HOPPIP
	wildmon 3, HOPPIP
	; nite
	wildmon 2, HOPPIP
	wildmon 3, HOPPIP
	wildmon 2, HOOTHOOT
	wildmon 3, RATTATA
	wildmon 2, RATTATA
	wildmon 3, HOOTHOOT
	wildmon 3, HOOTHOOT
	end_grass_wildmons

	db -1 ; end

; Ditto swarm
DittoSwarmWildMons:
	def_grass_wildmons ROUTE_34
	db 10 percent ; encounter rate
	; morn
	wildmon 10, DITTO
	wildmon 11, DITTO
	wildmon 10, SNUBBULL
	wildmon 12, PIDGEY
	wildmon 10, ABRA
	wildmon 12, JIGGLYPUFF
	wildmon 10, RATTATA
	; day
	wildmon 10, DITTO
	wildmon 11, DITTO
	wildmon 10, SNUBBULL
	wildmon 12, PIDGEY
	wildmon 10, ABRA
	wildmon 12, JIGGLYPUFF
	wildmon 10, RATTATA
	; nite
	wildmon 10, DITTO
	wildmon 11, DITTO
	wildmon 12, DROWZEE
	wildmon 12, HOOTHOOT
	wildmon 10, ABRA
	wildmon 12, JIGGLYPUFF
	wildmon 10, RATTATA
	end_grass_wildmons

	db -1 ; end

; Sunkern swarm
SunkernSwarmWildMons:
	def_grass_wildmons NATIONAL_PARK
	db 10 percent ; encounter rate
	; morn
	wildmon 12, SUNKERN
	wildmon 12, SUNKERN
	wildmon 14, NIDORAN_F
	wildmon 13, NIDORAN_M
	wildmon 10, CATERPIE
	wildmon 10, WEEDLE
	wildmon 10, WEEDLE
	; day
	wildmon 12, SUNKERN
	wildmon 12, SUNKERN
	wildmon 14, NIDORAN_F
	wildmon 13, NIDORAN_M
	wildmon 10, CATERPIE
	wildmon 10, WEEDLE
	wildmon 10, WEEDLE
	; nite
	wildmon 12, SUNKERN
	wildmon 12, SUNKERN
	wildmon 14, HOOTHOOT
	wildmon 13, HOOTHOOT
	wildmon 10, VENONAT
	wildmon 12, VENONAT
	wildmon 12, VENONAT
	end_grass_wildmons

	db -1 ; end

; Vulpix swarm
VulpixSwarmWildMons:
	def_grass_wildmons ROUTE_36
	db 10 percent ; encounter rate
	; morn
	wildmon 4, VULPIX
	wildmon 5, VULPIX
	wildmon 4, LEDYBA
	wildmon 5, BELLSPROUT
	wildmon 5, GROWLITHE
	wildmon 6, PIDGEY
	wildmon 6, PIDGEY
	; day
	wildmon 4, VULPIX
	wildmon 5, VULPIX
	wildmon 4, PIDGEY
	wildmon 5, BELLSPROUT
	wildmon 5, GROWLITHE
	wildmon 6, PIDGEY
	wildmon 6, PIDGEY
	; nite
	wildmon 4, VULPIX
	wildmon 5, VULPIX
	wildmon 4, SPINARAK
	wildmon 5, BELLSPROUT
	wildmon 5, HOOTHOOT
	wildmon 5, GASTLY
	wildmon 5, GASTLY
	end_grass_wildmons

	db -1 ; end

; Miltank swarm
MiltankSwarmWildMons:
	def_grass_wildmons ROUTE_39
	db 10 percent ; encounter rate
	; morn
	wildmon 15, MILTANK
	wildmon 16, MILTANK
	wildmon 16, RATICATE
	wildmon 16, MAGNEMITE
	wildmon 15, TAUROS
	wildmon 14, ELECTABUZZ
	wildmon 14, ELECTABUZZ
	; day
	wildmon 15, MILTANK
	wildmon 16, MILTANK
	wildmon 16, RATICATE
	wildmon 16, MAGNEMITE
	wildmon 16, ELECTABUZZ
	wildmon 15, TAUROS
	wildmon 15, TAUROS
	; nite
	wildmon 15, MILTANK
	wildmon 16, MILTANK
	wildmon 16, RATICATE
	wildmon 16, MAGNEMITE
	wildmon 16, MEOWTH
	wildmon 14, ELECTABUZZ
	wildmon 14, ELECTABUZZ
	end_grass_wildmons

	db -1 ; end

; Sandshrew swarm
SandshrewSwarmWildMons:
	def_grass_wildmons UNION_CAVE_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 6, SANDSHREW
	wildmon 6, SANDSHREW
	wildmon 5, ZUBAT
	wildmon 4, GEODUDE
	wildmon 7, RATTATA
	wildmon 6, ONIX
	wildmon 6, ONIX
	; day
	wildmon 6, SANDSHREW
	wildmon 6, SANDSHREW
	wildmon 5, ZUBAT
	wildmon 4, GEODUDE
	wildmon 7, RATTATA
	wildmon 6, ONIX
	wildmon 6, ONIX
	; nite
	wildmon 6, SANDSHREW
	wildmon 6, SANDSHREW
	wildmon 5, ZUBAT
	wildmon 4, WOOPER
	wildmon 7, RATTATA
	wildmon 6, ONIX
	wildmon 6, ONIX

	end_grass_wildmons

	; Sourcrystal's unsplit B1F matches this repo's northern half.
	def_grass_wildmons UNION_CAVE_B1F_NORTH
	db 6 percent ; encounter rate
	; morn
	wildmon 6, SANDSHREW
	wildmon 7, SANDSHREW
	wildmon 8, ZUBAT
	wildmon 8, ONIX
	wildmon 6, GEODUDE
	wildmon 8, RATTATA
	wildmon 8, RATTATA
	; day
	wildmon 6, SANDSHREW
	wildmon 7, SANDSHREW
	wildmon 8, ZUBAT
	wildmon 8, ONIX
	wildmon 6, GEODUDE
	wildmon 8, RATTATA
	wildmon 8, RATTATA
	; nite
	wildmon 6, SANDSHREW
	wildmon 7, SANDSHREW
	wildmon 8, WOOPER
	wildmon 8, ONIX
	wildmon 6, GEODUDE
	wildmon 8, RATTATA
	wildmon 8, RATTATA

	end_grass_wildmons

	def_grass_wildmons UNION_CAVE_B2F
	db 4 percent ; encounter rate
	; morn
	wildmon 22, SANDSHREW
	wildmon 22, SANDSHREW
	wildmon 22, ZUBAT
	wildmon 21, RATICATE
	wildmon 20, GEODUDE
	wildmon 23, ONIX
	wildmon 23, ONIX
	; day
	wildmon 22, SANDSHREW
	wildmon 22, SANDSHREW
	wildmon 22, ZUBAT
	wildmon 21, RATICATE
	wildmon 20, GEODUDE
	wildmon 23, ONIX
	wildmon 23, ONIX
	; nite
	wildmon 22, SANDSHREW
	wildmon 22, SANDSHREW
	wildmon 22, QUAGSIRE
	wildmon 21, RATICATE
	wildmon 20, GEODUDE
	wildmon 23, ONIX
	wildmon 23, ONIX
	end_grass_wildmons

	db -1 ; end

; Ekans swarm
EkansSwarmWildMons:
	def_grass_wildmons ROUTE_33
	db 10 percent ; encounter rate
	; morn
	wildmon 6, EKANS
	wildmon 7, EKANS
	wildmon 6, SPEAROW
	wildmon 6, GEODUDE
	wildmon 6, HOPPIP
	wildmon 7, HOPPIP
	wildmon 7, RATTATA
	; day
	wildmon 6, EKANS
	wildmon 7, EKANS
	wildmon 6, SPEAROW
	wildmon 6, GEODUDE
	wildmon 6, HOPPIP
	wildmon 7, HOPPIP
	wildmon 7, RATTATA
	; nite
	wildmon 6, EKANS
	wildmon 7, EKANS
	wildmon 6, ZUBAT
	wildmon 6, GEODUDE
	wildmon 6, ZUBAT
	wildmon 7, RATTATA
	wildmon 7, RATTATA
	end_grass_wildmons

	db -1 ; end

; Smeargle swarm
SmeargleSwarmWildMons:
	def_grass_wildmons RUINS_OF_ALPH_OUTSIDE
	db 10 percent ; encounter rate
	; morn
	wildmon 20, SMEARGLE
	wildmon 20, SMEARGLE
	wildmon 22, NATU
	wildmon 18, NATU
	wildmon 24, NATU
	wildmon 22, SMEARGLE
	wildmon 22, SMEARGLE
	; day
	wildmon 20, SMEARGLE
	wildmon 20, SMEARGLE
	wildmon 22, NATU
	wildmon 18, NATU
	wildmon 24, NATU
	wildmon 22, SMEARGLE
	wildmon 22, SMEARGLE
	; nite
	wildmon 20, SMEARGLE
	wildmon 20, SMEARGLE
	wildmon 22, NATU
	wildmon 18, NATU
	wildmon 24, NATU
	wildmon 22, SMEARGLE
	wildmon 22, SMEARGLE
	end_grass_wildmons

	db -1 ; end

; Mankey swarm
MankeySwarmWildMons:
	def_grass_wildmons ROUTE_42
	db 10 percent ; encounter rate
	; morn
	wildmon 15, MANKEY
	wildmon 14, MANKEY
	wildmon 15, EKANS
	wildmon 16, MAREEP
	wildmon 15, ARBOK
	wildmon 16, FEAROW
	wildmon 17, FLAAFFY
	; day
	wildmon 15, MANKEY
	wildmon 14, MANKEY
	wildmon 15, EKANS
	wildmon 16, MAREEP
	wildmon 15, ARBOK
	wildmon 16, FEAROW
	wildmon 17, FLAAFFY
	; nite
	wildmon 15, MANKEY
	wildmon 14, MANKEY
	wildmon 15, EKANS
	wildmon 16, MAREEP
	wildmon 15, ARBOK
	wildmon 16, GOLBAT
	wildmon 17, FLAAFFY
	end_grass_wildmons

	db -1 ; end

; Ponyta swarm
PonytaSwarmWildMons:
	def_grass_wildmons ROUTE_47
	db 10 percent ; encounter rate
	; morn
	wildmon 21, PONYTA
	wildmon 25, PONYTA
	wildmon 25, DITTO
	wildmon 24, FARFETCH_D
	wildmon 20, PONYTA
	wildmon 24, FEAROW
	wildmon 22, GLOOM
	; day
	wildmon 21, PONYTA
	wildmon 25, PONYTA
	wildmon 25, DITTO
	wildmon 24, FARFETCH_D
	wildmon 20, PONYTA
	wildmon 24, FEAROW
	wildmon 22, GLOOM
	; nite
	wildmon 21, PONYTA
	wildmon 25, PONYTA
	wildmon 25, DITTO
	wildmon 24, FARFETCH_D
	wildmon 20, PONYTA
	wildmon 24, NOCTOWL
	wildmon 22, GLOOM
	end_grass_wildmons

	db -1 ; end

; Diglett swarm
DiglettSwarmWildMons:
	def_grass_wildmons ROUTE_48
	db 10 percent ; encounter rate
	; morn
	wildmon 21, DIGLETT
	wildmon 20, DIGLETT
	wildmon 24, GLOOM
	wildmon 22, HOPPIP
	wildmon 21, FARFETCH_D
	wildmon 24, FEAROW
	wildmon 20, GIRAFARIG
	; day
	wildmon 21, DIGLETT
	wildmon 20, DIGLETT
	wildmon 24, GLOOM
	wildmon 22, HOPPIP
	wildmon 21, FARFETCH_D
	wildmon 24, FEAROW
	wildmon 20, GIRAFARIG
	; nite
	wildmon 21, DIGLETT
	wildmon 20, DIGLETT
	wildmon 24, GLOOM
	wildmon 22, HOUNDOUR
	wildmon 21, NOCTOWL
	wildmon 24, FEAROW
	wildmon 20, GIRAFARIG
	end_grass_wildmons

	db -1 ; end

; Swinub swarm
SwinubSwarmWildMons:
	def_grass_wildmons ICE_PATH_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 21, SWINUB
	wildmon 22, ZUBAT
	wildmon 22, SWINUB
	wildmon 23, SWINUB
	wildmon 24, GOLBAT
	wildmon 22, GOLBAT
	wildmon 22, GOLBAT
	; day
	wildmon 21, SWINUB
	wildmon 22, ZUBAT
	wildmon 22, SWINUB
	wildmon 23, SWINUB
	wildmon 24, GOLBAT
	wildmon 22, GOLBAT
	wildmon 22, GOLBAT
	; nite
	wildmon 21, SWINUB
	wildmon 22, DELIBIRD
	wildmon 22, SWINUB
	wildmon 23, SWINUB
	wildmon 24, GOLBAT
	wildmon 22, DELIBIRD
	wildmon 22, DELIBIRD

	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B1F
	db 2 percent ; encounter rate
	; morn
	wildmon 22, SWINUB
	wildmon 23, ZUBAT
	wildmon 23, SWINUB
	wildmon 24, SWINUB
	wildmon 25, GOLBAT
	wildmon 23, GOLBAT
	wildmon 22, JYNX
	; day
	wildmon 22, SWINUB
	wildmon 23, ZUBAT
	wildmon 23, SWINUB
	wildmon 24, SWINUB
	wildmon 25, GOLBAT
	wildmon 23, GOLBAT
	wildmon 22, JYNX
	; nite
	wildmon 22, SWINUB
	wildmon 23, DELIBIRD
	wildmon 23, SWINUB
	wildmon 24, SWINUB
	wildmon 25, GOLBAT
	wildmon 23, DELIBIRD
	wildmon 22, SNEASEL

	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B2F_MAHOGANY_SIDE
	db 2 percent ; encounter rate
	; morn
	wildmon 23, SWINUB
	wildmon 24, ZUBAT
	wildmon 24, SWINUB
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, JYNX
	wildmon 24, JYNX
	; day
	wildmon 23, SWINUB
	wildmon 24, ZUBAT
	wildmon 24, SWINUB
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, JYNX
	wildmon 24, JYNX
	; nite
	wildmon 23, SWINUB
	wildmon 24, DELIBIRD
	wildmon 24, SWINUB
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, SNEASEL
	wildmon 24, SNEASEL

	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B2F_BLACKTHORN_SIDE
	db 2 percent ; encounter rate
	; morn
	wildmon 23, SWINUB
	wildmon 24, ZUBAT
	wildmon 24, SWINUB
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, JYNX
	wildmon 24, JYNX
	; day
	wildmon 23, SWINUB
	wildmon 24, ZUBAT
	wildmon 24, SWINUB
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, JYNX
	wildmon 24, JYNX
	; nite
	wildmon 23, SWINUB
	wildmon 24, DELIBIRD
	wildmon 24, SWINUB
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, SNEASEL
	wildmon 24, SNEASEL

	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B3F
	db 2 percent ; encounter rate
	; morn
	wildmon 24, SWINUB
	wildmon 25, ZUBAT
	wildmon 25, SWINUB
	wildmon 26, SWINUB
	wildmon 22, JYNX
	wildmon 24, JYNX
	wildmon 26, JYNX
	; day
	wildmon 24, SWINUB
	wildmon 25, ZUBAT
	wildmon 25, SWINUB
	wildmon 26, SWINUB
	wildmon 22, JYNX
	wildmon 24, JYNX
	wildmon 26, JYNX
	; nite
	wildmon 24, SWINUB
	wildmon 25, DELIBIRD
	wildmon 25, SWINUB
	wildmon 26, SWINUB
	wildmon 22, SNEASEL
	wildmon 24, SNEASEL
	wildmon 26, SNEASEL
	end_grass_wildmons

	db -1 ; end

; Gligar swarm
GligarSwarmWildMons:
	def_grass_wildmons ROUTE_45
	db 10 percent ; encounter rate
	; morn
	wildmon 23, GLIGAR
	wildmon 24, GLIGAR
	wildmon 23, GRAVELER
	wildmon 25, DONPHAN
	wildmon 20, PHANPY
	wildmon 27, SKARMORY
	wildmon 27, SKARMORY
	; day
	wildmon 23, GLIGAR
	wildmon 24, GLIGAR
	wildmon 23, GRAVELER
	wildmon 25, DONPHAN
	wildmon 30, DONPHAN
	wildmon 27, SKARMORY
	wildmon 27, SKARMORY
	; nite
	wildmon 23, GLIGAR
	wildmon 24, GLIGAR
	wildmon 23, GRAVELER
	wildmon 25, GRAVELER
	wildmon 27, GRAVELER
	wildmon 27, SKARMORY
	wildmon 27, SKARMORY
	end_grass_wildmons

	db -1 ; end

; Psyduck swarm
PsyduckSwarmWildMons:
	def_grass_wildmons ROUTE_35
	db 10 percent ; encounter rate
	; morn
	wildmon 12, PSYDUCK
	wildmon 14, PSYDUCK
	wildmon 12, SNUBBULL
	wildmon 14, PIDGEY
	wildmon 12, JIGGLYPUFF
	wildmon 10, DITTO
	wildmon 10, DITTO
	; day
	wildmon 12, PSYDUCK
	wildmon 14, PSYDUCK
	wildmon 12, SNUBBULL
	wildmon 14, PIDGEY
	wildmon 12, JIGGLYPUFF
	wildmon 10, DITTO
	wildmon 10, DITTO
	; nite
	wildmon 12, PSYDUCK
	wildmon 14, PSYDUCK
	wildmon 12, DROWZEE
	wildmon 14, HOOTHOOT
	wildmon 12, JIGGLYPUFF
	wildmon 10, DITTO
	wildmon 10, DITTO
	end_grass_wildmons

	db -1 ; end

; Teddiursa swarm
TeddiursaSwarmWildMons:
	def_grass_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 6 percent ; encounter rate
	; morn
	wildmon 2, TEDDIURSA
	wildmon 3, TEDDIURSA
	wildmon 3, GEODUDE
	wildmon 2, ZUBAT
	wildmon 2, GEODUDE
	wildmon 4, TEDDIURSA
	wildmon 4, DUNSPARCE
	; day
	wildmon 2, TEDDIURSA
	wildmon 3, TEDDIURSA
	wildmon 3, GEODUDE
	wildmon 2, ZUBAT
	wildmon 2, GEODUDE
	wildmon 4, TEDDIURSA
	wildmon 4, DUNSPARCE
	; nite
	wildmon 2, TEDDIURSA
	wildmon 3, TEDDIURSA
	wildmon 3, GEODUDE
	wildmon 2, ZUBAT
	wildmon 2, GEODUDE
	wildmon 4, TEDDIURSA
	wildmon 4, DUNSPARCE
	end_grass_wildmons

	db -1 ; end

; Bellsprout swarm
BellsproutSwarmWildMons:
	def_grass_wildmons ROUTE_32
	db 10 percent ; encounter rate
	; morn
	wildmon 4, BELLSPROUT
	wildmon 7, BELLSPROUT
	wildmon 6, MAREEP
	wildmon 6, HOPPIP
	wildmon 7, PIDGEY
	wildmon 6, BELLSPROUT
	wildmon 6, RATTATA
	; day
	wildmon 4, BELLSPROUT
	wildmon 7, BELLSPROUT
	wildmon 6, MAREEP
	wildmon 6, HOPPIP
	wildmon 7, PIDGEY
	wildmon 6, BELLSPROUT
	wildmon 6, RATTATA
	; nite
	wildmon 5, BELLSPROUT
	wildmon 6, WOOPER
	wildmon 7, BELLSPROUT
	wildmon 6, MAREEP
	wildmon 7, HOOTHOOT
	wildmon 7, BELLSPROUT
	wildmon 7, GASTLY
	end_grass_wildmons

	db -1 ; end

; Machop swarm
MachopSwarmWildMons:
	def_grass_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 6 percent ; encounter rate
	; morn
	wildmon 13, MACHOP
	wildmon 13, MACHOP
	wildmon 13, ZUBAT
	wildmon 15, MARILL
	wildmon 14, GEODUDE
	wildmon 16, RATTATA
	wildmon 16, RATICATE
	; day
	wildmon 13, MACHOP
	wildmon 13, MACHOP
	wildmon 13, ZUBAT
	wildmon 15, MARILL
	wildmon 14, GEODUDE
	wildmon 16, RATTATA
	wildmon 16, RATICATE
	; nite
	wildmon 13, MACHOP
	wildmon 13, MACHOP
	wildmon 13, ZUBAT
	wildmon 15, MARILL
	wildmon 14, GOLBAT
	wildmon 16, RATTATA
	wildmon 16, RATICATE

	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_1F_INSIDE
	db 6 percent ; encounter rate
	; morn
	wildmon 13, MACHOP
	wildmon 15, MACHOP
	wildmon 15, MARILL
	wildmon 14, RATICATE
	wildmon 15, ZUBAT
	wildmon 15, GOLBAT
	wildmon 15, GOLBAT
	; day
	wildmon 13, MACHOP
	wildmon 15, MACHOP
	wildmon 15, MARILL
	wildmon 14, RATICATE
	wildmon 15, ZUBAT
	wildmon 15, GOLBAT
	wildmon 15, GOLBAT
	; nite
	wildmon 13, MACHOP
	wildmon 15, MACHOP
	wildmon 15, RATICATE
	wildmon 14, ZUBAT
	wildmon 15, MARILL
	wildmon 15, GOLBAT
	wildmon 15, GOLBAT

	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_2F_INSIDE
	db 6 percent ; encounter rate
	; morn
	wildmon 31, MACHOP
	wildmon 32, MACHOP
	wildmon 31, GRAVELER
	wildmon 30, RATICATE
	wildmon 32, MACHOKE
	wildmon 30, GOLBAT
	wildmon 30, GOLBAT
	; day
	wildmon 31, MACHOP
	wildmon 32, MACHOP
	wildmon 31, GRAVELER
	wildmon 30, RATICATE
	wildmon 32, MACHOKE
	wildmon 30, GOLBAT
	wildmon 30, GOLBAT
	; nite
	wildmon 31, MACHOP
	wildmon 32, MACHOP
	wildmon 31, GRAVELER
	wildmon 30, RATICATE
	wildmon 32, MARILL
	wildmon 30, GOLBAT
	wildmon 30, GOLBAT

	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 15, MACHOP
	wildmon 17, MACHOP
	wildmon 17, GOLBAT
	wildmon 16, MACHOP
	wildmon 16, GEODUDE
	wildmon 18, RATICATE
	wildmon 18, RATICATE
	; day
	wildmon 15, MACHOP
	wildmon 17, MACHOP
	wildmon 17, GOLBAT
	wildmon 16, MACHOP
	wildmon 16, GEODUDE
	wildmon 18, RATICATE
	wildmon 18, RATICATE
	; nite
	wildmon 15, MACHOP
	wildmon 17, MACHOP
	wildmon 17, GOLBAT
	wildmon 16, MARILL
	wildmon 16, GEODUDE
	wildmon 18, RATICATE
	wildmon 18, RATICATE
	end_grass_wildmons

	db -1 ; end

; Tauros swarm
TaurosSwarmWildMons:
	def_grass_wildmons ROUTE_38
	db 10 percent ; encounter rate
	; morn
	wildmon 13, TAUROS
	wildmon 14, TAUROS
	wildmon 16, RATICATE
	wildmon 16, MAGNEMITE
	wildmon 16, PIDGEOTTO
	wildmon 13, TAUROS
	wildmon 13, MILTANK
	; day
	wildmon 13, TAUROS
	wildmon 14, TAUROS
	wildmon 16, RATICATE
	wildmon 16, MAGNEMITE
	wildmon 16, PIDGEOTTO
	wildmon 13, TAUROS
	wildmon 13, MILTANK
	; nite
	wildmon 13, TAUROS
	wildmon 14, TAUROS
	wildmon 16, RATICATE
	wildmon 16, MAGNEMITE
	wildmon 16, NOCTOWL
	wildmon 13, TAUROS
	wildmon 16, MEOWTH
	end_grass_wildmons

	db -1 ; end

; Lickitung swarm
LickitungSwarmWildMons:
	def_grass_wildmons ROUTE_44
	db 10 percent ; encounter rate
	; morn
	wildmon 23, LICKITUNG
	wildmon 22, LICKITUNG
	wildmon 22, BELLSPROUT
	wildmon 24, WEEPINBELL
	wildmon 24, LICKITUNG
	wildmon 26, TANGELA
	wildmon 26, TANGELA
	; day
	wildmon 23, LICKITUNG
	wildmon 22, LICKITUNG
	wildmon 22, BELLSPROUT
	wildmon 24, WEEPINBELL
	wildmon 24, LICKITUNG
	wildmon 26, TANGELA
	wildmon 26, TANGELA
	; nite
	wildmon 23, LICKITUNG
	wildmon 22, LICKITUNG
	wildmon 22, BELLSPROUT
	wildmon 24, WEEPINBELL
	wildmon 24, LICKITUNG
	wildmon 26, POLIWAG
	wildmon 26, POLIWHIRL
	end_grass_wildmons

	db -1 ; end

; Slowpoke swarm
SlowpokeSwarmWildMons:
	def_grass_wildmons SLOWPOKE_WELL_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 5, SLOWPOKE
	wildmon 6, SLOWPOKE
	wildmon 7, ZUBAT
	wildmon 6, SLOWPOKE
	wildmon 8, ZUBAT
	wildmon 8, SLOWPOKE
	wildmon 8, ZUBAT
	; day
	wildmon 5, SLOWPOKE
	wildmon 6, SLOWPOKE
	wildmon 7, ZUBAT
	wildmon 6, SLOWPOKE
	wildmon 8, ZUBAT
	wildmon 8, SLOWPOKE
	wildmon 8, ZUBAT
	; nite
	wildmon 5, SLOWPOKE
	wildmon 6, SLOWPOKE
	wildmon 7, ZUBAT
	wildmon 6, SLOWPOKE
	wildmon 8, ZUBAT
	wildmon 8, SLOWPOKE
	wildmon 8, ZUBAT

	end_grass_wildmons

	def_grass_wildmons SLOWPOKE_WELL_B2F
	db 2 percent ; encounter rate
	; morn
	wildmon 21, SLOWPOKE
	wildmon 23, SLOWPOKE
	wildmon 19, ZUBAT
	wildmon 21, SLOWPOKE
	wildmon 23, GOLBAT
	wildmon 23, SLOWPOKE
	wildmon 23, GOLBAT
	; day
	wildmon 21, SLOWPOKE
	wildmon 23, SLOWPOKE
	wildmon 19, ZUBAT
	wildmon 21, SLOWPOKE
	wildmon 23, GOLBAT
	wildmon 23, SLOWPOKE
	wildmon 23, GOLBAT
	; nite
	wildmon 21, SLOWPOKE
	wildmon 23, SLOWPOKE
	wildmon 19, ZUBAT
	wildmon 21, SLOWPOKE
	wildmon 23, GOLBAT
	wildmon 23, SLOWPOKE
	wildmon 23, GOLBAT
	end_grass_wildmons

	db -1 ; end

; Weedle swarm
WeedleSwarmWildMons:
	def_grass_wildmons ROUTE_30
	db 10 percent ; encounter rate
	; morn
	wildmon 3, WEEDLE
	wildmon 3, WEEDLE
	wildmon 4, WEEDLE
	wildmon 4, PIDGEY
	wildmon 3, CATERPIE
	wildmon 4, HOPPIP
	wildmon 4, HOPPIP
	; day
	wildmon 3, WEEDLE
	wildmon 3, WEEDLE
	wildmon 4, WEEDLE
	wildmon 4, PIDGEY
	wildmon 3, CATERPIE
	wildmon 4, HOPPIP
	wildmon 4, HOPPIP
	; nite
	wildmon 3, WEEDLE
	wildmon 4, WEEDLE
	wildmon 3, SPINARAK
	wildmon 4, POLIWAG
	wildmon 4, WEEDLE
	wildmon 3, ZUBAT
	wildmon 4, HOOTHOOT
	end_grass_wildmons

	db -1 ; end

; Ledyba swarm
LedybaSwarmWildMons:
	def_grass_wildmons ROUTE_31
	db 10 percent ; encounter rate
	; morn
	wildmon 4, LEDYBA
	wildmon 4, LEDYBA
	wildmon 5, BELLSPROUT
	wildmon 5, PIDGEY
	wildmon 4, LEDYBA
	wildmon 5, HOPPIP
	wildmon 5, HOPPIP
	; day
	wildmon 4, LEDYBA
	wildmon 4, LEDYBA
	wildmon 4, PIDGEY
	wildmon 5, BELLSPROUT
	wildmon 5, PIDGEY
	wildmon 4, LEDYBA
	wildmon 5, HOPPIP
	; nite
	wildmon 4, LEDYBA
	wildmon 4, LEDYBA
	wildmon 4, SPINARAK
	wildmon 5, BELLSPROUT
	wildmon 5, HOOTHOOT
	wildmon 5, POLIWAG
	wildmon 5, GASTLY
	end_grass_wildmons

	db -1 ; end

; Oddish swarm
OddishSwarmWildMons:
	def_grass_wildmons ILEX_FOREST
	db 6 percent ; encounter rate
	; morn
	wildmon 5, ODDISH
	wildmon 5, ODDISH
	wildmon 7, METAPOD
	wildmon 7, KAKUNA
	wildmon 7, ZUBAT
	wildmon 6, PARAS
	wildmon 6, PARAS
	; day
	wildmon 5, ODDISH
	wildmon 5, ODDISH
	wildmon 7, METAPOD
	wildmon 7, KAKUNA
	wildmon 7, ZUBAT
	wildmon 6, PARAS
	wildmon 6, PARAS
	; nite
	wildmon 5, ODDISH
	wildmon 5, ODDISH
	wildmon 7, ODDISH
	wildmon 7, PSYDUCK
	wildmon 7, ZUBAT
	wildmon 6, PARAS
	wildmon 6, PARAS
	end_grass_wildmons

	db -1 ; end

; Pineco swarm
PinecoSwarmWildMons:
	def_grass_wildmons ROUTE_29
	db 10 percent ; encounter rate
	; morn
	wildmon 2, PINECO
	wildmon 2, PINECO
	wildmon 3, PIDGEY
	wildmon 3, SENTRET
	wildmon 2, RATTATA
	wildmon 3, PINECO
	wildmon 3, HOPPIP
	; day
	wildmon 2, PINECO
	wildmon 2, PINECO
	wildmon 3, PIDGEY
	wildmon 3, SENTRET
	wildmon 2, RATTATA
	wildmon 3, PINECO
	wildmon 3, HOPPIP
	; nite
	wildmon 2, PINECO
	wildmon 2, PINECO
	wildmon 3, HOOTHOOT
	wildmon 3, RATTATA
	wildmon 2, RATTATA
	wildmon 3, PINECO
	wildmon 3, HOOTHOOT
	end_grass_wildmons

	db -1 ; end

; Drowzee swarm
DrowzeeSwarmWildMons:
	def_grass_wildmons ROUTE_34
	db 10 percent ; encounter rate
	; morn
	wildmon 10, DROWZEE
	wildmon 11, DROWZEE
	wildmon 12, PIDGEY
	wildmon 10, ABRA
	wildmon 12, JIGGLYPUFF
	wildmon 10, SNUBBULL
	wildmon 10, DITTO
	; day
	wildmon 10, DROWZEE
	wildmon 11, DROWZEE
	wildmon 12, PIDGEY
	wildmon 10, ABRA
	wildmon 12, JIGGLYPUFF
	wildmon 10, SNUBBULL
	wildmon 10, DITTO
	; nite
	wildmon 12, DROWZEE
	wildmon 11, DROWZEE
	wildmon 12, HOOTHOOT
	wildmon 10, ABRA
	wildmon 12, JIGGLYPUFF
	wildmon 10, DROWZEE
	wildmon 10, DITTO
	end_grass_wildmons

	db -1 ; end

; Venonat swarm
VenonatSwarmWildMons:
	def_grass_wildmons NATIONAL_PARK
	db 10 percent ; encounter rate
	; morn
	wildmon 12, VENONAT
	wildmon 12, VENONAT
	wildmon 14, NIDORAN_F
	wildmon 13, NIDORAN_M
	wildmon 10, CATERPIE
	wildmon 10, WEEDLE
	wildmon 10, LEDYBA
	; day
	wildmon 12, VENONAT
	wildmon 12, VENONAT
	wildmon 14, NIDORAN_F
	wildmon 13, NIDORAN_M
	wildmon 10, CATERPIE
	wildmon 10, WEEDLE
	wildmon 10, SUNKERN
	; nite
	wildmon 12, VENONAT
	wildmon 12, VENONAT
	wildmon 14, HOOTHOOT
	wildmon 13, HOOTHOOT
	wildmon 10, VENONAT
	wildmon 12, VENONAT
	wildmon 12, SPINARAK
	end_grass_wildmons

	db -1 ; end

; Growlithe swarm
GrowlitheSwarmWildMons:
	def_grass_wildmons ROUTE_36
	db 10 percent ; encounter rate
	; morn
	wildmon 4, GROWLITHE
	wildmon 5, GROWLITHE
	wildmon 4, LEDYBA
	wildmon 5, BELLSPROUT
	wildmon 5, VULPIX
	wildmon 6, GROWLITHE
	wildmon 6, PIDGEY
	; day
	wildmon 4, GROWLITHE
	wildmon 5, GROWLITHE
	wildmon 4, PIDGEY
	wildmon 5, BELLSPROUT
	wildmon 5, VULPIX
	wildmon 6, GROWLITHE
	wildmon 6, PIDGEY
	; nite
	wildmon 4, GROWLITHE
	wildmon 5, GROWLITHE
	wildmon 4, SPINARAK
	wildmon 5, BELLSPROUT
	wildmon 5, HOOTHOOT
	wildmon 5, GROWLITHE
	wildmon 5, GASTLY
	end_grass_wildmons

	db -1 ; end

; Stantler swarm
StantlerSwarmWildMons:
	def_grass_wildmons ROUTE_37
	db 10 percent ; encounter rate
	; morn
	wildmon 13, STANTLER
	wildmon 15, STANTLER
	wildmon 14, VULPIX
	wildmon 16, GROWLITHE
	wildmon 15, PIDGEOTTO
	wildmon 15, STANTLER
	wildmon 15, LEDIAN
	; day
	wildmon 13, STANTLER
	wildmon 15, STANTLER
	wildmon 14, GROWLITHE
	wildmon 16, VULPIX
	wildmon 15, PIDGEOTTO
	wildmon 15, STANTLER
	wildmon 15, PIDGEY
	; nite
	wildmon 13, STANTLER
	wildmon 14, STANTLER
	wildmon 15, HOOTHOOT
	wildmon 16, STANTLER
	wildmon 15, NOCTOWL
	wildmon 15, ARIADOS
	wildmon 15, ARIADOS
	end_grass_wildmons

	db -1 ; end

; Wooper swarm
WooperSwarmWildMons:
	def_grass_wildmons UNION_CAVE_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 6, WOOPER
	wildmon 6, WOOPER
	wildmon 5, ZUBAT
	wildmon 4, WOOPER
	wildmon 7, GEODUDE
	wildmon 6, SANDSHREW
	wildmon 6, ONIX
	; day
	wildmon 6, WOOPER
	wildmon 6, WOOPER
	wildmon 5, ZUBAT
	wildmon 4, WOOPER
	wildmon 7, GEODUDE
	wildmon 6, SANDSHREW
	wildmon 6, ONIX
	; nite
	wildmon 6, WOOPER
	wildmon 6, WOOPER
	wildmon 5, GEODUDE
	wildmon 4, WOOPER
	wildmon 7, ZUBAT
	wildmon 6, ONIX
	wildmon 6, ONIX

	end_grass_wildmons

	; Sourcrystal's unsplit B1F matches this repo's northern half.
	def_grass_wildmons UNION_CAVE_B1F_NORTH
	db 6 percent ; encounter rate
	; morn
	wildmon 6, WOOPER
	wildmon 7, WOOPER
	wildmon 8, ZUBAT
	wildmon 8, ONIX
	wildmon 6, GEODUDE
	wildmon 8, RATTATA
	wildmon 8, RATTATA
	; day
	wildmon 6, WOOPER
	wildmon 7, WOOPER
	wildmon 8, ZUBAT
	wildmon 8, ONIX
	wildmon 6, GEODUDE
	wildmon 8, RATTATA
	wildmon 8, RATTATA
	; nite
	wildmon 6, WOOPER
	wildmon 7, WOOPER
	wildmon 8, WOOPER
	wildmon 8, ONIX
	wildmon 6, GEODUDE
	wildmon 8, RATTATA
	wildmon 8, RATTATA
	end_grass_wildmons

	db -1 ; end

; Aipom swarm
AipomSwarmWildMons:
	def_grass_wildmons ROUTE_33
	db 10 percent ; encounter rate
	; morn
	wildmon 6, AIPOM
	wildmon 6, AIPOM
	wildmon 6, GEODUDE
	wildmon 6, SPEAROW
	wildmon 7, EKANS
	wildmon 7, AIPOM
	wildmon 7, HOPPIP
	; day
	wildmon 6, AIPOM
	wildmon 6, AIPOM
	wildmon 6, GEODUDE
	wildmon 6, SPEAROW
	wildmon 7, EKANS
	wildmon 7, AIPOM
	wildmon 7, HOPPIP
	; nite
	wildmon 6, AIPOM
	wildmon 6, AIPOM
	wildmon 6, GEODUDE
	wildmon 6, ZUBAT
	wildmon 7, EKANS
	wildmon 7, AIPOM
	wildmon 7, RATTATA
	end_grass_wildmons

	db -1 ; end

; Koffing swarm
KoffingSwarmWildMons:
	def_grass_wildmons BURNED_TOWER_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 13, KOFFING
	wildmon 14, KOFFING
	wildmon 15, RATTATA
	wildmon 14, ZUBAT
	wildmon 15, KOFFING
	wildmon 15, RATICATE
	wildmon 15, RATICATE
	; day
	wildmon 13, KOFFING
	wildmon 14, KOFFING
	wildmon 15, RATTATA
	wildmon 14, ZUBAT
	wildmon 15, KOFFING
	wildmon 15, RATICATE
	wildmon 15, RATICATE
	; nite
	wildmon 13, KOFFING
	wildmon 14, KOFFING
	wildmon 15, RATTATA
	wildmon 14, ZUBAT
	wildmon 15, KOFFING
	wildmon 15, RATICATE
	wildmon 15, RATICATE

	end_grass_wildmons

	def_grass_wildmons BURNED_TOWER_B1F
	db 6 percent ; encounter rate
	; morn
	wildmon 14, KOFFING
	wildmon 16, KOFFING
	wildmon 14, RATTATA
	wildmon 16, RATTATA
	wildmon 15, ZUBAT
	wildmon 14, MAGMAR
	wildmon 14, MAGMAR
	; day
	wildmon 14, KOFFING
	wildmon 16, KOFFING
	wildmon 14, RATTATA
	wildmon 16, MAGMAR
	wildmon 15, ZUBAT
	wildmon 14, RATTATA
	wildmon 14, RATTATA
	; nite
	wildmon 14, KOFFING
	wildmon 16, KOFFING
	wildmon 14, RATTATA
	wildmon 16, RATTATA
	wildmon 15, ZUBAT
	wildmon 14, MAGMAR
	wildmon 14, MAGMAR
	end_grass_wildmons

	db -1 ; end

; Mareep swarm
MareepSwarmWildMons:
	def_grass_wildmons ROUTE_42
	db 10 percent ; encounter rate
	; morn
	wildmon 15, MAREEP
	wildmon 14, MAREEP
	wildmon 15, MANKEY
	wildmon 16, MAREEP
	wildmon 15, ARBOK
	wildmon 16, FEAROW
	wildmon 17, FLAAFFY
	; day
	wildmon 15, MAREEP
	wildmon 14, MAREEP
	wildmon 15, MANKEY
	wildmon 16, MAREEP
	wildmon 15, ARBOK
	wildmon 16, FEAROW
	wildmon 17, FLAAFFY
	; nite
	wildmon 15, MAREEP
	wildmon 14, MAREEP
	wildmon 15, MANKEY
	wildmon 16, MAREEP
	wildmon 15, ARBOK
	wildmon 16, GOLBAT
	wildmon 17, FLAAFFY
	end_grass_wildmons

	db -1 ; end

; Girafarig swarm
GirafarigSwarmWildMons:
	def_grass_wildmons ROUTE_43
	db 10 percent ; encounter rate
	; morn
	wildmon 15, GIRAFARIG
	wildmon 15, GIRAFARIG
	wildmon 16, PIDGEOTTO
	wildmon 16, FARFETCH_D
	wildmon 15, GIRAFARIG
	wildmon 17, FURRET
	wildmon 17, FURRET
	; day
	wildmon 15, GIRAFARIG
	wildmon 15, GIRAFARIG
	wildmon 16, PIDGEOTTO
	wildmon 16, FARFETCH_D
	wildmon 15, GIRAFARIG
	wildmon 17, FURRET
	wildmon 17, FURRET
	; nite
	wildmon 15, GIRAFARIG
	wildmon 15, GIRAFARIG
	wildmon 16, NOCTOWL
	wildmon 16, VENONAT
	wildmon 15, GIRAFARIG
	wildmon 17, VENOMOTH
	wildmon 17, VENOMOTH
	end_grass_wildmons

	db -1 ; end

; Houndour swarm
HoundourSwarmWildMons:
	def_grass_wildmons ROUTE_48
	db 10 percent ; encounter rate
	; morn
	wildmon 21, HOUNDOUR
	wildmon 20, HOUNDOUR
	wildmon 21, FEAROW
	wildmon 22, HOPPIP
	wildmon 21, FARFETCH_D
	wildmon 20, DIGLETT
	wildmon 20, GIRAFARIG
	; day
	wildmon 21, HOUNDOUR
	wildmon 20, HOUNDOUR
	wildmon 21, FEAROW
	wildmon 22, HOPPIP
	wildmon 21, FARFETCH_D
	wildmon 20, DIGLETT
	wildmon 20, GIRAFARIG
	; nite
	wildmon 21, HOUNDOUR
	wildmon 20, HOUNDOUR
	wildmon 21, FEAROW
	wildmon 22, HOUNDOUR
	wildmon 21, NOCTOWL
	wildmon 20, DIGLETT
	wildmon 20, GIRAFARIG
	end_grass_wildmons

	db -1 ; end

; Onix swarm
OnixSwarmWildMons:
	def_grass_wildmons CLIFF_CAVE
	db 6 percent ; encounter rate
	; morn
	wildmon 18, ONIX
	wildmon 19, ONIX
	wildmon 20, KRABBY
	wildmon 22, GRAVELER
	wildmon 20, ONIX
	wildmon 22, MACHOKE
	wildmon 23, STEELIX
	; day
	wildmon 18, ONIX
	wildmon 19, ONIX
	wildmon 20, KRABBY
	wildmon 22, GRAVELER
	wildmon 20, ONIX
	wildmon 22, MACHOKE
	wildmon 23, STEELIX
	; nite
	wildmon 18, ONIX
	wildmon 19, ONIX
	wildmon 20, KRABBY
	wildmon 22, KINGLER
	wildmon 20, ONIX
	wildmon 20, MISDREAVUS
	wildmon 23, STEELIX
	end_grass_wildmons

	db -1 ; end

; Sneasel swarm
SneaselSwarmWildMons:
	def_grass_wildmons ICE_PATH_1F
	db 6 percent ; encounter rate
	; morn
	wildmon 21, SNEASEL
	wildmon 22, SNEASEL
	wildmon 22, ZUBAT
	wildmon 23, SWINUB
	wildmon 24, GOLBAT
	wildmon 22, GOLBAT
	wildmon 22, GOLBAT
	; day
	wildmon 21, SNEASEL
	wildmon 22, SNEASEL
	wildmon 22, ZUBAT
	wildmon 23, SWINUB
	wildmon 24, GOLBAT
	wildmon 22, GOLBAT
	wildmon 22, GOLBAT
	; nite
	wildmon 21, SNEASEL
	wildmon 22, SNEASEL
	wildmon 22, ZUBAT
	wildmon 23, DELIBIRD
	wildmon 24, GOLBAT
	wildmon 22, DELIBIRD
	wildmon 22, DELIBIRD

	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B1F
	db 2 percent ; encounter rate
	; morn
	wildmon 22, SNEASEL
	wildmon 23, SNEASEL
	wildmon 23, ZUBAT
	wildmon 24, SWINUB
	wildmon 25, GOLBAT
	wildmon 23, GOLBAT
	wildmon 22, JYNX
	; day
	wildmon 22, SNEASEL
	wildmon 23, SNEASEL
	wildmon 23, ZUBAT
	wildmon 24, SWINUB
	wildmon 25, GOLBAT
	wildmon 23, GOLBAT
	wildmon 22, JYNX
	; nite
	wildmon 22, SNEASEL
	wildmon 23, SNEASEL
	wildmon 23, ZUBAT
	wildmon 24, DELIBIRD
	wildmon 25, GOLBAT
	wildmon 23, DELIBIRD
	wildmon 22, DELIBIRD

	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B2F_MAHOGANY_SIDE
	db 2 percent ; encounter rate
	; morn
	wildmon 23, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, GOLBAT
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, JYNX
	wildmon 24, JYNX
	; day
	wildmon 23, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, GOLBAT
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, JYNX
	wildmon 24, JYNX
	; nite
	wildmon 23, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, GOLBAT
	wildmon 25, DELIBIRD
	wildmon 26, GOLBAT
	wildmon 22, DELIBIRD
	wildmon 24, DELIBIRD

	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B2F_BLACKTHORN_SIDE
	db 2 percent ; encounter rate
	; morn
	wildmon 23, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, GOLBAT
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, JYNX
	wildmon 24, JYNX
	; day
	wildmon 23, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, GOLBAT
	wildmon 25, SWINUB
	wildmon 26, GOLBAT
	wildmon 22, JYNX
	wildmon 24, JYNX
	; nite
	wildmon 23, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, GOLBAT
	wildmon 25, DELIBIRD
	wildmon 26, GOLBAT
	wildmon 22, DELIBIRD
	wildmon 24, DELIBIRD

	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B3F
	db 6 percent ; encounter rate
	; morn
	wildmon 22, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, SWINUB
	wildmon 25, GOLBAT
	wildmon 26, SWINUB
	wildmon 24, JYNX
	wildmon 26, JYNX
	; day
	wildmon 22, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, SWINUB
	wildmon 25, GOLBAT
	wildmon 26, SWINUB
	wildmon 24, JYNX
	wildmon 26, JYNX
	; nite
	wildmon 22, SNEASEL
	wildmon 24, SNEASEL
	wildmon 24, DELIBIRD
	wildmon 25, GOLBAT
	wildmon 22, SNEASEL
	wildmon 24, DELIBIRD
	wildmon 26, DELIBIRD
	end_grass_wildmons

	db -1 ; end

; Skarmory swarm
SkarmorySwarmWildMons:
	def_grass_wildmons ROUTE_45
	db 10 percent ; encounter rate
	; morn
	wildmon 23, SKARMORY
	wildmon 24, SKARMORY
	wildmon 23, GEODUDE
	wildmon 24, GLIGAR
	wildmon 25, DONPHAN
	wildmon 27, SKARMORY
	wildmon 27, SKARMORY
	; day
	wildmon 23, SKARMORY
	wildmon 24, SKARMORY
	wildmon 23, GEODUDE
	wildmon 24, GLIGAR
	wildmon 25, DONPHAN
	wildmon 27, SKARMORY
	wildmon 27, SKARMORY
	; nite
	wildmon 23, SKARMORY
	wildmon 24, SKARMORY
	wildmon 23, GEODUDE
	wildmon 24, GLIGAR
	wildmon 25, GRAVELER
	wildmon 27, SKARMORY
	wildmon 27, SKARMORY
	end_grass_wildmons

	db -1 ; end
