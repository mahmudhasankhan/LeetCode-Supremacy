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

        for element in hashmap:
            if hashmap[element] == max(hashmap.values()):
                return element


def main():
    print(Solution().majorityElement([4, 2, 2, 1, 1, 1, 3, 3]))


if __name__ == "__main__":
    main()
