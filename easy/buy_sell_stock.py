class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        # using the two pointers technique to solve this problem.
        left_pointer, right_pointer = 0, 1
        max_profit = 0

        while right_pointer < len(prices):
            if prices[left_pointer] < prices[right_pointer]:
                max_profit = max(
                    max_profit, prices[right_pointer] - prices[left_pointer]
                )
            else:
                left_pointer = right_pointer

            right_pointer += 1

        return max_profit


# Driver
if __name__ == "__main__":
    llist = [7, 1, 5, 3, 6, 4]
    l_obj = Solution()
    print(l_obj.maxProfit(llist))
