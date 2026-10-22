def word_count(text: str) -> int:
    if not isinstance(text, str):
        raise TypeError("text must be a string")
    return len(text.split())


def unique_word_count(text: str) -> int:
    if not isinstance(text, str):
        raise TypeError("text must be a string")
    return len({word.casefold() for word in text.split()})
