class Solution(object):
    def search(self, nums, target):
        low, high = 0, len(nums) - 1
        while low <= high:
            mid = low + high >> 1
            if nums[mid] == target:
                return mid

            if (target < nums[0] and not target < nums[mid] < nums[0] or
                target >= nums[0] and nums[0] <= nums[mid] < target):
                low = mid + 1
            else:
                high = mid - 1

        return -1

s = Solution()
print s.search([1,3], 1)
