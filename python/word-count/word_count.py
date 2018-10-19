import re
from typing import Dict, List, Match, Optional, Set


def word_count(phrase_orig: str) -> dict:
    phrase: str = re.sub(r'[,\n,_]', ' ', phrase_orig)
    phrase_list: List[str] =\
        [word for word in map(clean_word, phrase.split()) if word]
    words: Set[str] = set(phrase_list)

    freq: Dict[str, int] = dict()
    for word in words:
        freq[word] = phrase_list.count(word)

    return freq


def clean_word(word: str) -> str:
    match: Optional[Match] = re.match(r"\'?([0-9a-z\']+)\b\'?", word.lower())
    if not match:
        return ''

    return match.group(1)
