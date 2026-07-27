"""Integration coverage for the complete opening Elm's Lab sequence."""

from pathlib import Path

from tools.rom_tests.emulator import Emulator
from tools.rom_tests.scenarios.elms_lab import (
    CYNDAQUIL,
    ELMS_LAB,
    NEW_BARK_TOWN,
    SCENE_ELMSLAB_NOOP,
    complete_elms_lab_intro,
)


SNAPSHOTS = Path(__file__).resolve().parents[1] / "snapshots"


def test_receive_cyndaquil_battle_lyra_and_leave_lab(
    emulator: Emulator,
) -> None:
    complete_elms_lab_intro(emulator)

    assert emulator.read("wPartyCount") == 1
    assert emulator.read("wPartyMon1Species") == CYNDAQUIL
    assert emulator.read("wElmsLabSceneID") == SCENE_ELMSLAB_NOOP
    assert not emulator.is_in_battle()
    assert (emulator.read("wMapGroup"), emulator.read("wMapNumber")) == (
        NEW_BARK_TOWN
    )
    assert (emulator.read("wMapGroup"), emulator.read("wMapNumber")) != ELMS_LAB
    emulator.assert_screen_matches(
        SNAPSHOTS / "elms-lab-exit.png",
        name="elms-lab-exit",
        crop=(0, 0, 160, 80),
    )
