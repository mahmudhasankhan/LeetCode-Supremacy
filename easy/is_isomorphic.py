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

        def get_key(val: str) -> str:
            for key, value in hashmap.items():
                if val == value:
                    return key
            return "None"
        hashmap = {k: v for (k, v) in zip(s, t)}
        print(hashmap)
        test_str = ""
        for c in t:
            test_str += get_key(c)
        print(test_str)
        return True if test_str == s else False
