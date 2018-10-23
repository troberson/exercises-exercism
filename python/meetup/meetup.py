import calendar
from datetime import date
from typing import Callable, List


class MeetupDayException(ValueError):
    pass


def which_date(day_list: List[int], which: str,
               failure_invalid: Callable,
               failure_does_not_exist: Callable) -> int:
    day_safe: List[int]

    which_n: List[str] = ["1st", "2nd", "3rd", "4th", "5th"]
    if which in which_n:
        n: int = which_n.index(which)
        day_safe = day_list[n:n+1]

    elif which == "last":
        day_safe = day_list[-1:]

    elif which == "teenth":
        day_safe = list(filter(lambda x: 12 < x < 20, day_list))

    else:
        failure_invalid()

    return day_safe[0] if day_safe else failure_does_not_exist()


def meetup_day(year: int, month: int,
               day_of_the_week: str, which: str) -> date:
    def error_invalid_which():
        raise MeetupDayException(
            f"'Which' must be one of: 1st, 2nd, 3rd, last, teenth ({which})")

    def error_invalid_day_of_the_week():
        raise MeetupDayException(
            f"Invalid Day of the Week: {day_of_the_week}")

    def error_day_does_not_exist():
        raise MeetupDayException(
            f"There is no {which} {day_of_the_week} in {year}-{month}.")

    weekdays: List[str] = list(calendar.day_name)

    if day_of_the_week not in weekdays:
        error_invalid_day_of_the_week()

    weekday: int = weekdays.index(day_of_the_week)

    day_list: List[int] = [week[weekday]
                           for week in calendar.monthcalendar(year, month)
                           if week[weekday]]

    day: int = which_date(day_list, which,
                          failure_invalid=error_invalid_which,
                          failure_does_not_exist=error_day_does_not_exist)

    return date(year, month, day)
