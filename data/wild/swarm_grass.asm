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
