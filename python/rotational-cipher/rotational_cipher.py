import string
from typing import List


def rotate(text: str, key_orig: int) -> str:
    key: int = key_orig % 26
    alphas: List[str] = [string.ascii_lowercase, string.ascii_uppercase]
    shift: str = ''.join([alpha[key:] + alpha[:key] for alpha in alphas])
    return str.translate(text, str.maketrans(''.join(alphas), shift))
