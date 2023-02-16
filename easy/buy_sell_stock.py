class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        left_pointer, right_pointer = 0, 1  # left = buy. right = sell
        max_profit = 0

        while right_pointer < len(prices):
            # profitable ?
            if prices[left_pointer] < prices[right_pointer]:
                profit = prices[right_pointer] - prices[left_pointer]
                max_profit = max(max_profit, profit)
            else:
                left_pointer = right_pointer

            right_pointer += 1
        return max_profit


# Driver
if __name__ == "__main__":
    llist = [7, 1, 5, 3, 6, 4]
    l_obj = Solution()
    print(l_obj.maxProfit(llist))
