class Solution(object):
    def nextPermutation(self, nums):
        i = len(nums) - 1
        while i > 0 and nums[i - 1] >= nums[i]:
            i -= 1
        if i > 0:
            j, pre = len(nums) - 1, nums[i - 1]
            while j >= i and nums[j] <= pre:
                j -= 1
            nums[i-1], nums[j] = nums[j], nums[i-1]

        k = len(nums) - 1
        while i < k:
            nums[i], nums[k] = nums[k], nums[i]
            i, k = i + 1, k - 1

s = Solution()
a = [3,8,5,2]
s.nextPermutation(a)
print a
