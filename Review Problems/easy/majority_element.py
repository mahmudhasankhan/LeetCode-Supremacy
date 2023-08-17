from typing import List


class Solution:
    # mine works better than neet's and its super easy to understand!
    def majorityElement(self, nums: List[int]) -> int:
        # i need to implement a counter
        hashmap = {}
        for element in nums:
            if element in hashmap:
                hashmap[element] += 1
            else:
                hashmap[element] = 1
        max_num = max(hashmap.values())
        for element in hashmap:
            if hashmap[element] == max_num:
                return element


class NeetcodeSolution:
    def majorityElement(self, nums: List[int]) -> int:
        # hashmap Solution
        count = {}
        res, max_count = 0, 0
        for n in nums:
            count[n] = 1 + count.get(n, 0)
            res = n if count[n] > max_count else res
            max_count = max(count[n], max_count)

        return res

    # implemented by myself
    def boyer_moore_algorithm(self, nums:
                              List[int]) -> int:
        res = nums[0]
        count, ptr = 1, 1
        while ptr < len(nums):
            count += (1 if nums[ptr] == res else -1)
            ptr += 1
            res = nums[ptr] if count == 0 else res
        return res


def main():
    print(Solution().majorityElement([4, 4, 4, 4, 2, 2, 1, 1, 1, 3, 3]))
    print(NeetcodeSolution().majorityElement(
        [4, 2, 2, 1, 1, 1, 3, 3, 3, 3, 3]))
    print(NeetcodeSolution().boyer_moore_algorithm(
        [4, 2, 2, 1, 1, 1, 3, 3, 3, 3, 3]))


if __name__ == "__main__":
    main()
