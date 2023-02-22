class Solution:
    def is_palindrome(self, input_string: str) -> bool:

        string = ""

        for char in input_string:
            if char.isalnum():
                string += char.lower()

        return string == string[::-1]
