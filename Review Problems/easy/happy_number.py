class Solution:
    def isHappy(self, n: int) -> bool:
        def replace_sum(number: int) -> int:
            number = str(number)
            result = 0
            for s in number:
                result += int(s) ** 2
            return result
        num = replace_sum(n)
        print(num)
        # count = 0
        while num != 1 and num != 4:
            # if count == 50:
            #     break
            # count += 1
            num = replace_sum(num)
            print(num)
        return num == 1


def main():
    print(Solution().isHappy(19))
    print(Solution().isHappy(2))


if __name__ == "__main__":
    main()
