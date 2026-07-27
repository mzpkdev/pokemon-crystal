"""Automation for starting a new game and completing Elm's introduction."""

from tools.rom_tests.emulator import Emulator


def reach_bedroom_overworld(emulator: Emulator) -> None:
    """Choose default menu options and enter the player's bedroom."""
    emulator.tick(600)
    emulator.press("start")

    # Select New Game and advance through Elm's introduction. The debug ROM
    # omits the long explanatory portion but retains the real menus and setup.
    emulator.press("a")
    for _ in range(12):
        emulator.press("a")

    # Accept the default player name from the naming screen.
    emulator.press("start")
    emulator.advance_until(
        emulator.is_in_players_bedroom,
        max_presses=30,
        description="player bedroom overworld",
    )
    emulator.tick(120)
