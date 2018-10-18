import string


def is_pangram(sentence: str) -> bool:
    return all(letter in sentence.lower() for letter in string.ascii_lowercase)
