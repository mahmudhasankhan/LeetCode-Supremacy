# Optimized hashmap solution
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        map = {}  # val : index     
        for i, n in enumerate(nums):
            diff = target - n
            if diff in map:
                return [map[diff], i]
            map[n] = i
            

#  Brute Force           
class Brute_Force(object):
    
    def twoSumBrute(self, nums, target):
        
        res = []
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                if nums[i] + nums[j] == target:
                    res.append(i)
                    res.append(j) 
        return res


a = Brute_Force()
lst = [3, 3]
target = 6
print(a.twoSumBrute(lst, target))