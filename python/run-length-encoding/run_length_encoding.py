from itertools import groupby
from re import findall


def decode_char(length: int, char: str) -> str:
    return length * char


def decode(string: str) -> str:
    return ''.join([decode_char(int(length or 1), char)
                    for length, char in findall(r'(\d*)(\D)', string)])


def encode_char(length: int, char: str) -> str:
    return f"{length if length > 1 else ''}{char}"


def encode(string: str) -> str:
    return ''.join([encode_char(len(list(group)), char)
                    for char, group in groupby(string)])
