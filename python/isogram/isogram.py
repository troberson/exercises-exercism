from typing import List


def is_isogram(string: str) -> bool:
    clean: List[str] = list(filter(str.isalnum, string.lower()))
    return len(clean) == len(set(clean))
