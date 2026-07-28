; Stable active swarm IDs. Zero is reserved for no active swarm.
	const_def
	const SWARM_NONE
	const SWARM_DUNSPARCE_ID
	const SWARM_YANMA_ID
	const SWARM_QWILFISH_ID
DEF NUM_SWARMS EQU const_value - 1

static_assert SWARM_NONE == 0
static_assert NUM_SWARMS < $100

; Script-facing activation results
	const_def
	const SWARM_ACTIVATE_BLOCKED
	const SWARM_ACTIVATE_NEW
	const SWARM_ACTIVATE_CURRENT

; Swarm encounter methods
	const_def
	const SWARM_METHOD_LAND
	const SWARM_METHOD_SURF
	const SWARM_METHOD_FISH
DEF NUM_SWARM_METHODS EQU const_value

; Swarm selection pools (bitmasks)
	const_def 0
	const SWARM_POOL_JOHTO_F
	const SWARM_POOL_KANTO_F

DEF SWARM_POOL_JOHTO EQU 1 << SWARM_POOL_JOHTO_F
DEF SWARM_POOL_KANTO EQU 1 << SWARM_POOL_KANTO_F

; Encounter profiles. Consumers interpret these according to the method.
	const_def
	const SWARM_PROFILE_DUNSPARCE
	const SWARM_PROFILE_YANMA
	const SWARM_PROFILE_QWILFISH
DEF NUM_SWARM_PROFILES EQU const_value

; SwarmData entry fields
	rsreset
DEF SWARMENTRY_SPECIES     rw
DEF SWARMENTRY_MAP_GROUP   rb
DEF SWARMENTRY_MAP_NUMBER  rb
DEF SWARMENTRY_LANDMARK    rb
DEF SWARMENTRY_METHOD      rb
DEF SWARMENTRY_POOL        rb
DEF SWARMENTRY_PROFILE     rb
DEF SWARMENTRY_LENGTH EQU _RS
