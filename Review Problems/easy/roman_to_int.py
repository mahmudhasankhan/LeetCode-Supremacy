# class Solution:
#     def romanToInt(self, s: str) -> int:
#         hashmap = {
#             "I": 1,
#             "V": 5,
#             "X": 10,
#             "L": 50,
#             "C": 100,
#             "D": 500,
#             "M": 1000
#         }
#         lptr, rptr = 0, 1
#         result = 0
#         while rptr < len(s):
#             if hashmap[s[lptr]] < hashmap[s[rptr]]:
#                 result -= hashmap[s[lptr]]
#             else:
#                 result += hashmap[s[lptr]]
#             lptr += 1
#             rptr += 1
#         result += hashmap[s[lptr]]
#         return result
class Solution:
    def romanToInt(self, s: str) -> int:

        hashmap = {
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        }
        result = 0
        for i in range(len(s)):
            if i+1 < len(s) and hashmap[s[i]] < hashmap[s[i+1]]:
                result -= hashmap[s[i]]
            else:
                result += hashmap[s[i]]
        return result


def main():
    print(Solution().romanToInt("MCMXCIV"))
    print(Solution().romanToInt("LVIII"))


if __name__ == "__main__":
    main()
