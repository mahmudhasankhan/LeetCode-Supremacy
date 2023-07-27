from typing import List


class Solution:
    def summaryRanges(self, nums: List[int]) -> List[str]:
        if len(nums) == 0:
            return []
        ptr1, ptr2 = 0, 1
        target = []
        initial_index = 0
        while ptr2 < len(nums):
            if nums[ptr2] - nums[ptr1] == 1:
                ptr1 += 1
            else:
                target.append(f"{nums[initial_index]}") if nums[ptr1] == nums[initial_index] else target.append(
                    f"{nums[initial_index]}->{nums[ptr1]}")
                ptr1 = ptr2
                initial_index = ptr1
            ptr2 += 1

        target.append(f"{nums[initial_index]}") if nums[ptr1] == nums[initial_index] else target.append(
            f"{nums[initial_index]}->{nums[ptr2-1]}")
        return target
