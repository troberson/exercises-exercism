def is_leap_year(year: int) -> bool:
    """Whether or not a given year is a leap year.

    If year is divisible by:
    +------+-----------------+------+
    | 4    | 100 but not 400 | 400  |
    +======+=================+======+
    | True | False           | True |
    +------+-----------------+------+

    Args:
        year (int): The year in question

    Returns:
        bool: True if year is a leap year, false otherwise
    """
    def is_div(x: int) -> bool:
        return year % x == 0
    return is_div(4) and ((not is_div(100)) or is_div(400))
