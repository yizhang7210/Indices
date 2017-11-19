class Solution(object):
    def removeDuplicates(self, nums):
        l, r = 0, 0
        for r in range(1,len(nums)):
            if nums[l] != nums[r]:
                l += 1
                nums[l] = nums[r]

        return l+1 if nums else 0

s = Solution()
a = [1,2,3,3,4,6,7,7,8]
print s.removeDuplicates(a)
print a
