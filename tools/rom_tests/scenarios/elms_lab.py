"""Automation for receiving a starter and completing the first Lyra battle."""

from collections.abc import Callable

from tools.rom_tests.emulator import Emulator
from tools.rom_tests.scenarios.new_game import reach_bedroom_overworld


NEW_BARK_TOWN = (24, 4)
PLAYERS_HOUSE_1F = (24, 6)
ELMS_LAB = (24, 5)
CHERRYGROVE_CITY = (26, 4)
ROUTE_29 = (24, 3)

CYNDAQUIL = 155
SCENE_ELMSLAB_NOOP = 2


def walk_until(
    emulator: Emulator,
    predicate: Callable[[], bool],
    button: str,
    description: str,
    max_presses: int = 160,
) -> None:
    for _ in range(max_presses):
        if predicate():
            return
        if emulator.is_in_battle():
            emulator.advance_until(
                lambda: not emulator.is_in_battle(),
                button="a",
                max_presses=250,
                description=f"finishing battle before {description}",
            )
            continue
        emulator.press(button)

    emulator.save_screenshot(f"timeout-{description}.png")
    raise AssertionError(f"Timed out walking to {description}")


def walk_to_value(
    emulator: Emulator,
    symbol: str,
    value: int,
    button: str,
    description: str,
) -> None:
    walk_until(
        emulator,
        lambda: emulator.read(symbol) == value,
        button,
        description,
    )


def walk_to_map(
    emulator: Emulator,
    destination: tuple[int, int],
    button: str,
    description: str,
) -> None:
    walk_until(
        emulator,
        lambda: (emulator.read("wMapGroup"), emulator.read("wMapNumber"))
        == destination,
        button,
        description,
    )


def leave_home_and_enter_elms_lab(emulator: Emulator) -> None:
    """Talk to Mom, leave home, and follow Lyra into Elm's Lab."""
    walk_to_value(emulator, "wXCoord", 7, "right", "bedroom stairs")
    walk_to_map(emulator, PLAYERS_HOUSE_1F, "up", "first floor")

    # Walking down starts Mom's mandatory Pokégear and clock setup scene.
    walk_to_value(emulator, "wYCoord", 4, "down", "Mom's trigger")
    emulator.advance_until(
        lambda: emulator.read("wPlayersHouse1FSceneID") == 1,
        button="a",
        max_presses=30,
        description="Mom's introduction",
    )
    emulator.advance_until(
        lambda: emulator.read("wScriptRunning") == 0,
        button="a",
        max_presses=40,
        description="finishing Mom's introduction",
    )

    walk_to_value(emulator, "wYCoord", 7, "down", "house exit row")
    walk_to_value(emulator, "wXCoord", 9, "left", "house exit")
    walk_to_map(emulator, NEW_BARK_TOWN, "down", "New Bark Town")

    walk_to_value(emulator, "wXCoord", 6, "left", "Elm's Lab column")
    walk_to_value(emulator, "wYCoord", 4, "up", "Lyra lab introduction")
    emulator.advance_until(
        lambda: (emulator.read("wMapGroup"), emulator.read("wMapNumber"))
        == ELMS_LAB,
        button="a",
        max_presses=20,
        description="entering Elm's Lab",
    )


def receive_cyndaquil_and_leave_lab(emulator: Emulator) -> None:
    """Accept Elm's mission, choose Cyndaquil, battle Lyra, and exit."""
    emulator.advance_until(
        lambda: emulator.read("wElmsLabSceneID") == 1,
        button="a",
        max_presses=30,
        description="starter selection",
    )

    walk_to_value(emulator, "wXCoord", 6, "right", "Cyndaquil column")
    walk_to_value(emulator, "wYCoord", 4, "up", "Cyndaquil Poké Ball")
    emulator.press("up")
    emulator.press("a")
    emulator.advance_until(
        lambda: emulator.read("wPartyCount") == 1,
        button="a",
        max_presses=50,
        description="receiving Cyndaquil",
    )
    emulator.advance_until(
        lambda: emulator.read("wElmsLabSceneID") == 6
        and emulator.read("wScriptRunning") == 0,
        button="a",
        max_presses=80,
        description="finishing starter selection",
    )

    # Leaving triggers the mandatory, can-lose Lyra battle and the aide's gift.
    walk_to_value(emulator, "wXCoord", 4, "left", "lab exit aisle")
    walk_to_value(emulator, "wYCoord", 6, "down", "Lyra battle trigger")
    emulator.advance_until(
        lambda: emulator.read("wElmsLabSceneID") == 5
        and emulator.read("wScriptRunning") == 0,
        button="a",
        max_presses=350,
        description="first Lyra battle",
    )
    walk_to_value(emulator, "wYCoord", 8, "down", "lab aide")
    emulator.advance_until(
        lambda: emulator.read("wElmsLabSceneID") == SCENE_ELMSLAB_NOOP
        and emulator.read("wScriptRunning") == 0,
        button="a",
        max_presses=300,
        description="post-battle lab sequence",
    )
    walk_to_value(emulator, "wYCoord", 11, "down", "lab exit row")
    walk_to_map(emulator, NEW_BARK_TOWN, "down", "leaving Elm's Lab")
    emulator.tick(120)


def complete_elms_lab_intro(emulator: Emulator) -> None:
    """Start a game, receive Cyndaquil, battle Lyra, and leave the lab."""
    reach_bedroom_overworld(emulator)
    leave_home_and_enter_elms_lab(emulator)
    receive_cyndaquil_and_leave_lab(emulator)
