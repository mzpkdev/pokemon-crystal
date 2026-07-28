"""Integration coverage for reaching the first city."""

from pathlib import Path

from tools.rom_tests.emulator import Emulator
from tools.rom_tests.scenarios.cherrygrove_city import reach_cherrygrove_city
from tools.rom_tests.scenarios.elms_lab import CHERRYGROVE_CITY


SNAPSHOTS = Path(__file__).resolve().parents[1] / "snapshots"


def test_new_game_reaches_cherrygrove_city(emulator: Emulator) -> None:
    reach_cherrygrove_city(emulator)

    assert not emulator.is_in_battle()
    assert (emulator.read("wMapGroup"), emulator.read("wMapNumber")) == (
        CHERRYGROVE_CITY
    )
    emulator.assert_screen_matches(
        SNAPSHOTS / "cherrygrove-city-entry.png",
        name="cherrygrove-city-entry",
        # Ignore animated edge sprites, the treetop strip, and the player's
        # idle-animation pixels; map/coordinate assertions verify the position.
        crop=(16, 11, 160, 144),
        ignore_boxes=((64, 48, 88, 80),),
    )
