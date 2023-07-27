class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        # 37/44 test cases I could solve with this code
        #
        # index = 0
        # hashmap = {}
        # while index < len(s):
        #     hashmap[s[index]] = t[index]
        #     index += 1
        # print(hashmap)
        # test_str = ""
        # for c in s:
        #     test_str += hashmap[c]
        # print(test_str)

        # return True if test_str == t else False
        #
        # 35/44 test cases solved with this code
        # return True if len(set(s)) == len(set(t)) else Fals
        #
        #
        # Runtime: 174ms Beats 5.00% of users with py3, Memory: 16.63mb beats 47.99%
        # def get_key(val: str) -> str:
        #     for key, value in hashmap.items():
        #         if val == value:
        #             return key
        #     return "None"
        # hashmap = {k: v for (k, v) in zip(s, t)}
        # test_str = ""
        # for c in t:
        #     test_str += get_key(c)
        # return True if test_str == s else False

        mapST, mapTS = {}, {}
        for c1, c2 in zip(s, t):
            if ((c1 in mapST and mapST[c1] != c2) or
                    (c2 in mapTS and mapTS[c2] != c1)):
                return False
            mapST[c1] = c2
            mapTS[c2] = c1
        return True
