from typing import List


class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        nums[:] = [v for v in nums if v != val]
        return len(nums)


def main():
    print(Solution().removeElement([0, 1, 2, 2, 3, 0, 4, 2], 2))


if __name__ == "__main__":
    main()
