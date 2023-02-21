class Solution:
    def contains_duplicate(self, nums: list[int]) -> bool:
        hashset = set()
        for num in nums:
            if num in hashset:
                return True
            hashset.add(num)
        return False

    def one_liner_contains_duplicat(self, nums: list[int]) -> bool:
        return len(set(nums)) != len(nums)
