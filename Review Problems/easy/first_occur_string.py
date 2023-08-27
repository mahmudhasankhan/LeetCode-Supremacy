class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        # Easy solution down here:
        # return haystack.find(needle)

        lptr, rptr = 0, len(needle)
        while lptr < len(haystack) or rptr < len(haystack):
            if needle == haystack[lptr:rptr]:
                return lptr
            elif needle == haystack[lptr]:
                return lptr
            lptr += 1
            rptr += 1
        return -1


###############################
"""NEW BEST, 34ms, 16.4mb"""


def main():
    print(Solution().strStr("sadbutsad", "sad"))
    print(Solution().strStr("leetcode", "leeto"))
    print(Solution().strStr("a", "a"))
    print(Solution().strStr("abc", "c"))


if __name__ == "__main__":
    main()
