; Stable active swarm IDs. Zero is reserved for no active swarm.
	const_def
	const SWARM_NONE
	const SWARM_DUNSPARCE_ID
	const SWARM_YANMA_ID
	const SWARM_QWILFISH_ID
DEF NUM_SWARMS EQU const_value - 1

static_assert SWARM_NONE == 0
static_assert SWARM_DUNSPARCE_ID == 1
static_assert SWARM_YANMA_ID == 2
static_assert SWARM_QWILFISH_ID == 3
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

; Map scopes. A scope can contain one or more maps that share a swarm.
	const_def
	const SWARM_SCOPE_DARK_CAVE
	const SWARM_SCOPE_ROUTE_35
	const SWARM_SCOPE_ROUTE_32
DEF NUM_SWARM_SCOPES EQU const_value

; Unlock rules. Rules are dispatched through SwarmUnlockRulePointers.
	const_def
	const SWARM_UNLOCK_NONE
DEF NUM_SWARM_UNLOCK_RULES EQU const_value

; Shiny policies.
	const_def
	const SWARM_SHINY_NORMAL
	const SWARM_SHINY_BOOSTED
DEF NUM_SWARM_SHINY_POLICIES EQU const_value

; SwarmData entry fields
	rsreset
DEF SWARMENTRY_SPECIES     rw
DEF SWARMENTRY_MAP_SCOPE   rb
DEF SWARMENTRY_LANDMARK    rb
DEF SWARMENTRY_METHOD      rb
DEF SWARMENTRY_POOL        rb
DEF SWARMENTRY_PROFILE     rb
DEF SWARMENTRY_UNLOCK_RULE rb
DEF SWARMENTRY_SHINY_POLICY rb
DEF SWARMENTRY_LENGTH EQU _RS

static_assert NUM_SWARM_PROFILES < $100
static_assert NUM_SWARM_SCOPES < $100
static_assert NUM_SWARM_UNLOCK_RULES < $100
static_assert NUM_SWARM_SHINY_POLICIES < $100
