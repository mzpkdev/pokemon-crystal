"""Automation for collecting the Mystery Egg from Mr. Pokémon."""

from tools.rom_tests.emulator import Emulator
from tools.rom_tests.scenarios.cherrygrove_city import reach_cherrygrove_city
from tools.rom_tests.scenarios.elms_lab import (
    CHERRYGROVE_CITY,
    walk_to_map,
    walk_to_value,
)
from tools.rom_tests.test_support import apply_debug_repel


ROUTE_30 = (26, 1)
MR_POKEMONS_HOUSE = (26, 11)
MYSTERY_EGG = 0x0F
SCENE_CHERRYGROVECITY_NOOP = 2
SCENE_MRPOKEMONSHOUSE_NOOP = 1


def complete_guide_gent_tour(emulator: Emulator) -> None:
    """Trigger the mandatory Cherrygrove tour and receive the Map Card."""
    if (emulator.read("wMapGroup"), emulator.read("wMapNumber")) != (
        CHERRYGROVE_CITY
    ):
        raise AssertionError("Guide tour must start in Cherrygrove City")

    walk_to_value(emulator, "wXCoord", 34, "left", "Guide Gent approach")
    emulator.press("left")
    emulator.advance_until(
        lambda: emulator.read("wCherrygroveCitySceneID")
        == SCENE_CHERRYGROVECITY_NOOP
        and emulator.read("wScriptRunning") == 0,
        button="a",
        max_presses=100,
        description="Guide Gent tour",
    )


def walk_to_mr_pokemons_house(emulator: Emulator) -> None:
    """Take Cherrygrove's north exit and follow Route 30."""
    # The tour finishes near the Guide Gent's house at (12, 26).
    walk_to_value(emulator, "wYCoord", 10, "up", "Cherrygrove north path")
    walk_to_value(emulator, "wXCoord", 22, "left", "Route 30 approach")
    walk_to_value(emulator, "wYCoord", 4, "up", "Cherrygrove north clearing")
    walk_to_value(emulator, "wXCoord", 17, "left", "Route 30 entrance")
    walk_to_map(emulator, ROUTE_30, "up", "Route 30")
    apply_debug_repel(emulator)

    # Take Route 30's eastern, pre-battle path to Mr. Pokémon's house.
    walk_to_value(emulator, "wYCoord", 48, "up", "south Route 30")
    walk_to_value(emulator, "wXCoord", 14, "right", "south clearing")
    walk_to_value(emulator, "wYCoord", 28, "up", "central Route 30")
    walk_to_value(emulator, "wXCoord", 16, "right", "central clearing")
    walk_to_value(emulator, "wYCoord", 20, "up", "north Route 30")
    walk_to_value(emulator, "wXCoord", 18, "right", "north passage")
    walk_to_value(emulator, "wYCoord", 18, "up", "north ledge")
    walk_to_value(emulator, "wXCoord", 20, "right", "Mr. Pokémon path")
    walk_to_value(emulator, "wYCoord", 14, "up", "Mr. Pokémon clearing")
    walk_to_value(emulator, "wXCoord", 19, "left", "Mr. Pokémon entrance")
    walk_to_value(emulator, "wYCoord", 6, "up", "Mr. Pokémon doorstep")
    walk_to_map(emulator, MR_POKEMONS_HOUSE, "up", "Mr. Pokémon's house")


def receive_mystery_egg_and_pokedex(emulator: Emulator) -> None:
    """Complete Mr. Pokémon and Oak's scripted introduction."""
    emulator.advance_until(
        lambda: emulator.read("wMrPokemonsHouseSceneID")
        == SCENE_MRPOKEMONSHOUSE_NOOP
        and emulator.read("wScriptRunning") == 0,
        button="a",
        max_presses=100,
        description="receiving the Mystery Egg and Pokédex",
    )
    emulator.tick(120)


def collect_mystery_egg(emulator: Emulator) -> None:
    """Play continuously from a new game through receiving the Mystery Egg."""
    reach_cherrygrove_city(emulator)
    complete_guide_gent_tour(emulator)
    walk_to_mr_pokemons_house(emulator)
    receive_mystery_egg_and_pokedex(emulator)
