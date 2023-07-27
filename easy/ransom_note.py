class Solution:
    # Runtime: 148ms, Memory: 16.76mb
    # Beats 6.13%of users with Python3, Beats 10.48%of users with Python3
    # def canConstruct(self, ransomNote: str, magazine: str) -> bool:
    #     if len(magazine) == 0:
    #         return False
    #     # sort the strings first
    #     ransomNote = sorted(ransomNote)
    #     magazine = sorted(magazine)
    #     i, j = 0, 0
    #     while i < len(ransomNote) and j < len(magazine):
    #         if ransomNote[i] == magazine[j]:
    #             i += 1
    #         j += 1

    #     return True if i == len(ransomNote) else False

    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        hashmap = {}
        for c in magazine:
            if c in hashmap:
                hashmap[c] = hashmap[c] + 1
            else:
                hashmap[c] = 1

        for c in ransomNote:
            if c not in hashmap or hashmap[c] <= 0:
                return False
            hashmap[c] = hashmap[c] - 1

        return True
