import re
from typing import List, Match, Optional, Set


def word_count(phrase_orig: str) -> dict:
    phrase: str = re.sub(r'[,_]', ' ', phrase_orig)
    phrase_list: List[str] = list(map(clean_word, phrase.split()))
    words: Set[str] = set(phrase_list)
    return dict([(word, phrase_list.count(word)) for word in words if word])


def clean_word(word: str) -> str:
    match: Optional[Match] = re.match(r"'?([0-9a-z']+)\b'?", word.lower())
    return match.group(1) if match else ''
