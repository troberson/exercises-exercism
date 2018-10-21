from collections import Counter
from functools import partial
from typing import Any, Callable, List


def YACHT(dice: List[int]) -> int:
    return 50 if find_combos(dice) == [5] else 0


def score_multiple(number: int, dice: List[int]) -> int:
    return number * dice.count(number)


(ONES, TWOS, THREES, FOURS, FIVES, SIXES) = \
    (partial(score_multiple, x) for x in range(1, 7))


def FULL_HOUSE(dice: List[int]) -> int:
    return sum(dice) if find_combos(dice) == [2, 3] else 0


def FOUR_OF_A_KIND(dice: List[int]) -> int:
    value: int
    count: int
    [(value, count)] = Counter(dice).most_common(1)
    return 4 * value if count in [4, 5] else 0


def LITTLE_STRAIGHT(dice: List[int]) -> int:
    return 30 if sorted(dice) == [1, 2, 3, 4, 5] else 0


def BIG_STRAIGHT(dice: List[int]) -> int:
    return 30 if sorted(dice) == [2, 3, 4, 5, 6] else 0


def CHOICE(dice: List[int]) -> int:
    return sum(dice)


def score(dice: List[int], category: Callable[[List[int]], int]) -> int:
    return category(dice)


def find_combos(items: List[Any]) -> List[Any]:
    return sorted(Counter(items).values())
