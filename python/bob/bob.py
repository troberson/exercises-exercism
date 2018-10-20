def hey(phrase_orig: str) -> str:
    phrase: str = ''.join(phrase_orig.split())
    is_question: bool = phrase.endswith('?')
    is_yelling: bool = phrase.isupper()

    response: str
    if is_yelling and is_question:
        response = "Calm down, I know what I'm doing!"
    elif is_question:
        response = "Sure."
    elif is_yelling:
        response = "Whoa, chill out!"
    elif not phrase:
        response = "Fine. Be that way!"
    else:
        response = "Whatever."

    return response
