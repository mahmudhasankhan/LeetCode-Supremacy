from typing import List


class Solution:
    def too_slow_containsNearbyDuplicate(self,
                                         nums: List[int],
                                         k: int) -> bool:
        for i in range(len(nums)):
            j = i + 1
            while j < len(nums):
                if nums[i] == nums[j] and abs(i-j) <= k:
                    return True
                j += 1
        return False

    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        pass


def main():
    print(Solution().containsNearbyDuplicate([1, 2, 3, 1], 3))
    print(Solution().containsNearbyDuplicate([1, 0, 1, 1], 1))
    print(Solution().containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2))


if __name__ == "__main__":
    main()
