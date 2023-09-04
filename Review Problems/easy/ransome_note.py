class Solution:
    # I am ashamed :)
    def my_vers_canConstruct(self, ransomNote: str, magazine: str) -> bool:
        if len(ransomNote) == 0:
            return False
        ransomNote = "".join(sorted(ransomNote))
        magazine = "".join(sorted(magazine))
        i, j = 0, 0
        while i < len(ransomNote) and j < len(magazine):
            if ransomNote[i] == magazine[j]:
                i += 1
            j += 1
        return True if i == len(ransomNote) else False

    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        # thanks kevin jr
        hashmap = {}
        for c in magazine:
            hashmap[c] = 1 + hashmap.get(c, 0)
        print(hashmap)
        for c in ransomNote:
            if c in hashmap and hashmap[c] > 0:
                hashmap[c] -= 1
            else:
                return False
        return True


def main():
    print(Solution().canConstruct("aa", "aab"))
    print(Solution().canConstruct("a", "b"))
    print(Solution().canConstruct("aa", "ab"))


if __name__ == "__main__":
    main()
