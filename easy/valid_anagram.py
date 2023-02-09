from collections import Counter


class Solution:
    # The easiest way possible, almost felt like Counter class was designed for this problem lol.
    def isAnagram(self, s: str, t: str) -> bool:
        return Counter(s) == Counter(t)

    # Using two hashmaps
    def is_anagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        countS, countT = {}, {}

        for i in range(len(s)):
            countS[s[i]] = 1 + countS.get(s[i], 0)
            countS[t[i]] = 1 + countT.get(t[i], 0)
        for c in countS:
            if countS[c] != countT.get(c, 0):
                return False
        return True

    def is_anagram_sorted(self, s: str, t: str) -> bool:
        # this also works
        return sorted(s) == sorted(t)
