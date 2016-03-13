class Solution(object):
    def searchInsert(self, nums, target):
        l, r = 0, len(nums) - 1
        while l <= r:
            mid = (l + r)/2
            if nums[mid] == target:
                return mid
            elif target < nums[mid]:
                if mid > 0 and target > nums[mid - 1]:
                    return mid
                elif mid == 0:
                    return 0
                else:
                    r = mid - 1
            else:
                if mid < len(nums) - 1 and target < nums[mid + 1]:
                    return mid + 1
                elif mid == len(nums) - 1:
                    return len(nums)
                else:
                    l = mid + 1

s = Solution()
print s.searchInsert([1,3,5,6], 0)
