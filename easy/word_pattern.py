class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        splitted_s = list(s.split(" "))
        if not len(pattern) == len(splitted_s):
            return False
        hashmap, reverse_hashmap = {}, {}
        for pat, char in zip(pattern, splitted_s):
            if ((pat in hashmap and hashmap[pat] != char)
                    or (char in reverse_hashmap and reverse_hashmap[char] != pat)):
                return False
            hashmap[pat] = char
            reverse_hashmap[char] = pat
        return True
