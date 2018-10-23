def is_armstrong(number: int) -> bool:
    n_str: str = str(number)
    total: int = sum(int(c) ** len(n_str) for c in n_str)
    return total == number
