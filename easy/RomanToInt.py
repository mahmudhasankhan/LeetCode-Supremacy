class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """  
        dict = {'I': 1,
                'V': 5,
                'X': 10,
                'L': 50,
                'C': 100,
                'D': 500,
                'M': 1000}
        res = 0
        for i in range(len(s)):
            if i+1 < len(s) and dict[s[i]] < dict[s[i+1]]:
                res -= dict[s[i]]
            else:
                res += dict[s[i]]
        return res


s = "MCMXCIV"
a = Solution()
res = a.romanToInt(s)
print(res)
