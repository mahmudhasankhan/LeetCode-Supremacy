from typing import List


class Solution:
    def bruteForce_twoSum(self, nums: List[int], target: int) -> List[int]:
        # Brute Force
        # Runtime: 2507ms Beats 25.05% & Memory: 16.94mb Beats 99.11%
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]

    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # hashmap way
        # Runtime: 45ms Beats 99.91% & Memory: 17.60mb Beats 50.06%
        hashmap = {}  # val: index

        for i, n in enumerate(nums):
            diff = target - n
            if diff in hashmap:
                return [hashmap[diff], i]
            hashmap[n] = i

        # Runtime: 68ms Beats 61.66% & Memory: 17.61mb Beats 32.61%
        # for i in range(len(nums)):
        #     diff = target - nums[i]
        #     if diff in hashmap:
        #         return [hashmap[diff], i]
        #     hashmap[nums[i]] = i


def main():
    print(Solution().twoSum([2, 7, 11, 15], 9))
    print(Solution().twoSum([3, 2, 4], 6))
    print(Solution().twoSum([3, 3], 6))


if __name__ == "__main__":
    main()
