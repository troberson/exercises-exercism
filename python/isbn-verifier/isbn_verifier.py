import re


def verify(isbn_orig: str) -> bool:
    isbn: str = isbn_orig.replace('-', '')
    pattern: str = r'^[0-9]{10}$|^[0-9]{9}X$'
    valid: bool = re.match(pattern, isbn) is not None
    return valid and check_isbn(isbn)


def check_isbn(isbn: str) -> bool:
    digits: enumerate = enumerate(map(int, isbn[0:9]))
    digits_sum: int = sum([digit * (10 - pos) for pos, digit in digits])
    check: int = int(isbn[9].replace('X', '10'))
    return (digits_sum + check) % 11 == 0
