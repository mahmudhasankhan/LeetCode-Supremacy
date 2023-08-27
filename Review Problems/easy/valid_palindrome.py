class Solution:
    def isPalindrome(self, s: str) -> bool:
        st = ""

        for char in s:
            if char.isalnum():
                st += char.lower()
        return st == st[::-1]


def main():
    print(Solution().isPalindrome("A man, a plan, a canal: Panama"))
    print(Solution().isPalindrome("race a car"))
    print(Solution().isPalindrome(" "))


if __name__ == "__main__":
    main()
