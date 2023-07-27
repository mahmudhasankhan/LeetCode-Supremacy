# class Solution:
#     # bruteforce/without DP
#     def isSubsequence(self, s: str, t: str) -> bool:
#         if s == "":
#             return True
#         flag = False
#         j = 0
#         for i in range(len(s)):
#             for j in range(j, len(t)):
#                 if s[i] == t[j]:
#                     flag = True
#                     break
#                 else:
#                     flag = False
#             j += 1
#         return True if flag == True else False

class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        if s == "":
            return True
        # init two pointers
        i, j = 0, 0
        while i < len(s) and j < len(t):
            # print(i, j)
            if s[i] == t[j]:
                i += 1
            j += 1
        return True if i == len(s) else False
