"""Automation for traveling from Elm's Lab to Cherrygrove City."""

from tools.rom_tests.emulator import Emulator
from tools.rom_tests.scenarios.elms_lab import (
    CHERRYGROVE_CITY,
    NEW_BARK_TOWN,
    ROUTE_29,
    complete_elms_lab_intro,
    walk_to_map,
    walk_to_value,
)
from tools.rom_tests.test_support import apply_debug_repel


def walk_from_elms_lab_to_cherrygrove(emulator: Emulator) -> None:
    """Cross New Bark Town and Route 29 to reach Cherrygrove City."""
    if (emulator.read("wMapGroup"), emulator.read("wMapNumber")) != NEW_BARK_TOWN:
        raise AssertionError("Cherrygrove route must start outside Elm's Lab")

    walk_to_value(emulator, "wXCoord", 3, "left", "west New Bark column")
    walk_to_value(emulator, "wYCoord", 8, "down", "west New Bark clearing")
    walk_to_value(emulator, "wXCoord", 1, "left", "west New Bark edge")
    walk_to_value(emulator, "wYCoord", 8, "down", "west New Bark path")
    walk_to_map(emulator, ROUTE_29, "left", "Route 29")
    apply_debug_repel(emulator)

    # Follow Route 29's alternating clearings and ledges westward.
    walk_to_value(emulator, "wYCoord", 9, "down", "east clearing")
    walk_to_value(emulator, "wXCoord", 53, "left", "east passage")
    walk_to_value(emulator, "wYCoord", 13, "down", "southeast clearing")
    walk_to_value(emulator, "wXCoord", 47, "left", "first ledge")
    walk_to_value(emulator, "wYCoord", 15, "down", "south path")
    walk_to_value(emulator, "wXCoord", 43, "left", "second ledge")
    walk_to_value(emulator, "wYCoord", 16, "down", "southwest path")
    walk_to_value(emulator, "wXCoord", 33, "left", "central passage")
    walk_to_value(emulator, "wYCoord", 14, "up", "central clearing")
    walk_to_value(emulator, "wXCoord", 31, "left", "central ledge")
    walk_to_value(emulator, "wYCoord", 10, "up", "central north path")
    walk_to_value(emulator, "wXCoord", 36, "right", "cut tree detour")
    walk_to_value(emulator, "wYCoord", 6, "up", "north path")
    walk_to_value(emulator, "wXCoord", 30, "left", "north grass")
    walk_to_value(emulator, "wYCoord", 5, "up", "northwest path")
    walk_to_value(emulator, "wXCoord", 22, "left", "northwest grass")
    walk_to_value(emulator, "wYCoord", 4, "up", "upper path")
    walk_to_value(emulator, "wXCoord", 19, "left", "upper clearing")
    walk_to_value(emulator, "wYCoord", 5, "down", "west clearing")
    walk_to_value(emulator, "wXCoord", 17, "left", "west passage")
    walk_to_value(emulator, "wYCoord", 7, "down", "west grass")
    walk_to_value(emulator, "wXCoord", 14, "left", "west ledge")
    walk_to_value(emulator, "wYCoord", 8, "down", "lower west path")
    walk_to_value(emulator, "wXCoord", 11, "left", "lower west clearing")
    walk_to_value(emulator, "wYCoord", 10, "down", "Cherrygrove path")
    walk_to_value(emulator, "wXCoord", 7, "left", "Cherrygrove approach")
    walk_to_value(emulator, "wYCoord", 7, "up", "Cherrygrove entrance row")
    walk_to_map(emulator, CHERRYGROVE_CITY, "left", "Cherrygrove City")
    emulator.tick(120)


def reach_cherrygrove_city(emulator: Emulator) -> None:
    """Play continuously from a new game through to Cherrygrove City."""
    complete_elms_lab_intro(emulator)
    walk_from_elms_lab_to_cherrygrove(emulator)
