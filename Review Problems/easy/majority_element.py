from typing import List


class Solution:
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


def main():
    print(Solution().majorityElement([4, 4, 4, 4, 2, 2, 1, 1, 1, 3, 3]))
    print(NeetcodeSolution().majorityElement(
        [4, 2, 2, 1, 1, 1, 3, 3, 3, 3, 3]))


if __name__ == "__main__":
    main()
