from typing import List


class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        # two pointer approach is needed here
        l_ptr, r_ptr = 1, 1
        while r_ptr < len(nums):
            if nums[r_ptr - 1] != nums[r_ptr]:
                nums[l_ptr] = nums[r_ptr]
                l_ptr += 1
            r_ptr += 1
        return l_ptr


def main():
    print(Solution().removeDuplicates([0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 3, 3, 4]))


if __name__ == "__main__":
    main()
