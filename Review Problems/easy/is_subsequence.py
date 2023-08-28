class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        # 16/19 testcases :)
        # comp_str = ""
        # for c in t:
        #     if c in s:
        #         comp_str += c
        # print(comp_str)
        # return comp_str == s
        """Have to do two pointer: there's no other way"""
        if s == "":
            return True
        s_ptr, t_ptr = 0, 0
        comp_str = ""
        while s_ptr < len(s) and t_ptr < len(t):
            print(comp_str)
            if s[s_ptr] == t[t_ptr]:
                comp_str += t[t_ptr]
                s_ptr += 1
            t_ptr += 1
        return comp_str == s


def main():
    print(Solution().isSubsequence("abc", "ahbgdc"))
    print(Solution().isSubsequence("ab", "baab"))
    print(Solution().isSubsequence("", "baab"))
    print(Solution().isSubsequence("b", "abc"))
    print(Solution().isSubsequence("axb", "ahbgdc"))


if __name__ == "__main__":
    main()
