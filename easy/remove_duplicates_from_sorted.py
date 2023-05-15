class Solution:
    def removeDuplicates(self, nums: list[int]) -> int:
        left_pointer, right_pointer = 1, 1

        while right_pointer < len(nums):
            if nums[right_pointer] == nums[right_pointer - 1]:
                right_pointer += 1
            else:
                nums[left_pointer] = nums[right_pointer]
                left_pointer += 1
                right_pointer += 1

        return left_pointer
