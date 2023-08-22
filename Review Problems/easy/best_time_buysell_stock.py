from typing import List


class Solution:
    # Passed 154/212 test cases
    # def maxProfit(self, prices: List[int]) -> int:
    #     minimum = min(prices)
    #     maximum = max(prices[prices.index(minimum):])
    #     return maximum - minimum

    def maxProfit(self, prices: List[int]) -> int:
        # have to use two pointers
        l_ptr, r_ptr = 0, 1
        profit = 0
        while r_ptr < len(prices):
            if prices[l_ptr] > prices[r_ptr]:
                l_ptr = r_ptr
            profit = max(profit, prices[r_ptr] - prices[l_ptr])
            r_ptr += 1
        return profit


def main():
    print(Solution().maxProfit([7, 1, 5, 3, 6, 4]))
    print(Solution().maxProfit([7, 6, 4, 3, 1]))
    print(Solution().maxProfit([2, 4, 1]))


if __name__ == "__main__":
    main()
