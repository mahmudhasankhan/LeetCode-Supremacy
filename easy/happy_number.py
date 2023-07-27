class Solution:
    def isHappy(self, n: int) -> bool:
        def replace_sum(num: int) -> int:
            num = str(num)
            target = 0
            for s in num:
                target += int(s)**2
            return target
        result = replace_sum(n)
        while result != 1 and result != 4:
            result = replace_sum(result)
            print(result)
        return True if result == 1 else False
