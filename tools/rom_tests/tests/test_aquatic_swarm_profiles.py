"""ROM-level validation of combined fishing and Surf swarm profiles."""

from tools.rom_tests.emulator import Emulator


SWARM_ENTRY_LENGTH = 9
SWARM_ENTRY_METHOD = 4
SWARM_ENTRY_PROFILE = 6
SWARM_METHOD_SURF = 1
SWARM_METHOD_WATER = 3

AQUATIC_SWARMS = {
    3: "QwilfishSwarmWaterWildMons",
    6: "ChinchouSwarmWaterWildMons",
    7: "RemoraidSwarmWaterWildMons",
    20: "HorseaSwarmWaterWildMons",
    24: "DratiniSwarmWaterWildMons",
    32: "CorsolaSwarmWaterWildMons",
    46: "MantineSwarmWaterWildMons",
    70: "StaryuSwarmWaterWildMons",
    89: "ShellderSwarmWaterWildMons",
}
POLIWAG_SWARM_ID = 60


def _word(data: list[int]) -> int:
    return data[0] | data[1] << 8


def test_aquatic_swarms_dispatch_to_fishing_and_surf_profiles(
    emulator: Emulator,
) -> None:
    for swarm_id, water_profile in AQUATIC_SWARMS.items():
        profile = swarm_id - 1
        entry_offset = profile * SWARM_ENTRY_LENGTH

        assert emulator.read_rom_at(
            "SwarmData", entry_offset + SWARM_ENTRY_METHOD, 1
        ) == [SWARM_METHOD_WATER]
        assert emulator.read_rom_at(
            "SwarmData", entry_offset + SWARM_ENTRY_PROFILE, 1
        ) == [profile]

        fish_profile = emulator.read_rom_at(
            "FishSwarmProfiles", profile * 2, 2
        )
        assert fish_profile[0] != 0xff
        assert fish_profile[1] != 0xff

        surf_pointer = _word(
            emulator.read_rom_at("SurfSwarmProfilePointers", profile * 2, 2)
        )
        assert surf_pointer == emulator.symbols[water_profile][1]


def test_poliwag_remains_surf_only(emulator: Emulator) -> None:
    profile = POLIWAG_SWARM_ID - 1
    entry_offset = profile * SWARM_ENTRY_LENGTH

    assert emulator.read_rom_at(
        "SwarmData", entry_offset + SWARM_ENTRY_METHOD, 1
    ) == [SWARM_METHOD_SURF]
    assert emulator.read_rom_at("FishSwarmProfiles", profile * 2, 2) == [
        0xff,
        0xff,
    ]
    surf_pointer = _word(
        emulator.read_rom_at("SurfSwarmProfilePointers", profile * 2, 2)
    )
    assert surf_pointer == emulator.symbols["PoliwagSwarmWaterWildMons"][1]
