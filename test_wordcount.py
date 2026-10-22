import unittest

import wordcount


class WordCountTest(unittest.TestCase):
    def test_empty_string_has_no_words(self):
        self.assertEqual(wordcount.word_count(""), 0)

    def test_splits_on_whitespace(self):
        self.assertEqual(wordcount.word_count("a b  c"), 3)

    def test_rejects_non_string(self):
        with self.assertRaises(TypeError):
            wordcount.word_count(None)


if __name__ == "__main__":
    unittest.main()
