# Optimized hashmap solution
class Solution(object):
    def twoSum(self, nums: list, target: int) -> list:
        hashmap = {}  # val : index
        for i, num in enumerate(nums):
            diff = target - num
            if diff in hashmap:
                return [hashmap[diff], i]
            hashmap[num] = i


#  Brute Force
class Brute_Force(object):
    def twoSumBrute(self, nums: list, target: int) -> list:

        res = []
        for i in range(len(nums)):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    res.append(i)
                    res.append(j)
        return res


a = Brute_Force()
lst = [3, 3]
print(a.twoSumBrute(lst, 6))
