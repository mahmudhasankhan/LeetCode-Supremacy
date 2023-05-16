class Solution:
    def longestCommonPrefix(self, strs: list[str]) -> str:
        if len(strs) == 0:
            return ""
        result = ""
        strs = sorted(strs)
        first_string, last_string = strs[0], strs[-1]

        for i in range(min(len(first_string), len(last_string))):
            if first_string[i] == last_string[i]:
                result += first_string[i]
            else:
                break
        return result


x = Solution()
print(x.longestCommonPrefix(["flower", "flow", "flight"]))
