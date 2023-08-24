from typing import List


class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        # 47/154 test cases passed, not great
        # reference_map = {}
        # for i in strs[0]:
        #     for s in i:
        #         if s in reference_map:
        #             reference_map[s] += 1
        #         else:
        #             reference_map[s] = 1
        # result = ""
        # for i in strs[1:]:
        #     for c in i:
        #         if c in reference_map:
        #             reference_map[c] += 1
        # for key in reference_map:
        #     if reference_map[key] == len(strs):
        #         result += key
        # return result

        # New Best! -> Thanks to Nich White! Learned something new :)
        prefix = strs[0]
        for s in strs[1:]:
            while s.find(prefix) != 0:
                prefix = prefix[:len(prefix) - 1]
        return prefix


def main():
    # works
    print(Solution().longestCommonPrefix(["flower", "flow", "flight"]))
    # doesnt work
    print(Solution().longestCommonPrefix(["dog", "racecar", "car"]))


if __name__ == "__main__":
    main()
