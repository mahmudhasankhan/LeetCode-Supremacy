nums = [0, 1, 2, 2, 3, 0, 4, 2]
val = 2
# Doing list comprehension
# nums[:] = [x for x in nums if x != val]

# doing simple while loop
while val in nums:
    nums.remove(val)
print(nums)


class Solution:
    def removeElement(self, nums: list[int], val: int):
        nums[:] = [x for x in nums if x != val]
