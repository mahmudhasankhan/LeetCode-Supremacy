class Solution:
    def notSoGood_isAnagram(self, s: str, t: str) -> bool:
        # 60ms runtime, beats 36.79% and 17.29mb memory, beats 29.47%
        return True if sorted(s) == sorted(t) else False

    def isAnagram(self, s: str, t: str) -> bool:
        # 56ms runtime, beats 55% and 16.76mb memory usage and beats 85%
        s_map, t_map = {}, {}

        for c in s:
            s_map[c] = s_map.get(c, 0) + 1
        for c in t:
            t_map[c] = t_map.get(c, 0) + 1
        # this unnecessary check costs quite a bit or runtime and memory!
        # return True if s_map == t_map else False
        # instead we can do something like this that has
        # new run time of 36ms which beats 99.13% and 16.66mb of memory
        # that beats 98.50% of users
        return s_map == t_map


def main():
    print(Solution().isAnagram("anagram", "nagaram"))
    print(Solution().isAnagram("rat", "car"))
    print(Solution().isAnagram("aa", "a"))


if __name__ == "__main__":
    main()
