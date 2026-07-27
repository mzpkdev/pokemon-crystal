"""Integration coverage for Mr. Pokémon's Mystery Egg sequence."""

from pathlib import Path

from tools.rom_tests.emulator import Emulator
from tools.rom_tests.scenarios.mystery_egg import (
    MR_POKEMONS_HOUSE,
    MYSTERY_EGG,
    SCENE_MRPOKEMONSHOUSE_NOOP,
    collect_mystery_egg,
)


SNAPSHOTS = Path(__file__).resolve().parents[1] / "snapshots"


def test_receive_mystery_egg_and_pokedex(emulator: Emulator) -> None:
    collect_mystery_egg(emulator)

    assert emulator.key_items_contain(MYSTERY_EGG)
    assert emulator.read("wMrPokemonsHouseSceneID") == SCENE_MRPOKEMONSHOUSE_NOOP
    assert (emulator.read("wMapGroup"), emulator.read("wMapNumber")) == (
        MR_POKEMONS_HOUSE
    )
    emulator.assert_screen_matches(
        SNAPSHOTS / "mystery-egg-received.png",
        name="mystery-egg-received",
    )
