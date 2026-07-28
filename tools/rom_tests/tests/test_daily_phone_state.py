"""ROM coverage for the daily swarm, phone, and rematch reset."""

from tools.rom_tests.emulator import Emulator
from tools.rom_tests.scenarios.new_game import reach_bedroom_overworld


def test_daily_reset_clears_swarm_phone_and_rematch_state(
    emulator: Emulator,
) -> None:
    reach_bedroom_overworld(emulator)

    daily_arrays = (
        ("wDailyRematchFlags", 6),
        ("wDailyPhoneItemFlags", 4),
        ("wDailyPhoneTimeOfDayFlags", 6),
    )
    for symbol, length in daily_arrays:
        for offset in range(length):
            emulator.write_at(symbol, offset, 0xff)
    emulator.write("wActiveSwarm", 3)

    # Expire the one-day timer and let the normal overworld time-event path
    # perform the reset. This exercises ROM code rather than mirroring it here.
    emulator.write("wDailyResetTimer", 0)
    emulator.advance_until(
        lambda: (
            emulator.read("wActiveSwarm") == 0
            and all(
                emulator.read_at(symbol, offset) == 0
                for symbol, length in daily_arrays
                for offset in range(length)
            )
        ),
        button="b",
        max_presses=5,
        description="daily phone and swarm reset",
    )
