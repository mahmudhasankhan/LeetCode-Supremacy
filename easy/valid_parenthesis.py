class Solution:

    def isValid(self, s: str) -> bool:
        stack = []
        pop_hashmap = {"}": "{", "]": "[", ")": "("}

        for c in s:
            if c in pop_hashmap:
                if stack and stack[-1] == pop_hashmap[c]:
                    stack.pop()
                else:
                    return False
            else:
                stack.append(c)
        return True if not stack else False

    # 85/93 test cases solved :')

    def my_version_isValid(self, s: str) -> bool:
        if s.startswith(')') or s.startswith('}') or s.startswith(']'):
            return False
        l_str = list(s)
        stack = []
        push_list = ['(', '[', '{']
        pop_hashmap = {"}": "{", "]": "[", ")": "("}
        for i, c in enumerate(l_str):
            if c in push_list:
                stack.append(c)
            if stack:
                if (c in pop_hashmap) and (stack[-1] == pop_hashmap[c]):
                    stack.pop()
            print(stack)

        return True if len(stack) == 0 else False


def main():
    print(Solution().isValid("(])"))


if __name__ == "__main__":
    main()
