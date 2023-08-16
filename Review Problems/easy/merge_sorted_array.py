from typing import List


class Solution:
    def merge(self,
              nums1: List[int],
              m: int,
              nums2: List[int],
              n: int) -> None:

        if not nums2:
            return
        i = 0
        while m < len(nums1):
            nums1[m] = nums2[i]
            m += 1
            i += 1
        nums1.sort()
        print(nums1)


def main():
    m, n = 3, 3
    l1 = [1, 2, 3, 0, 0, 0]
    l2 = [2, 5, 6]
    Solution().merge(l1, m, l2, n)


if __name__ == "__main__":
    main()
