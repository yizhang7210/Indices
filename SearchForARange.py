class Solution(object):
    def searchRange(self, nums, target):
        def search(A, x, isLeft):
            l, r = 0, len(A) - 1
            while l <= r:
                mid = (l + r) /2
                if (isLeft and x > A[mid]) or (not isLeft and x >= A[mid]):
                    l = mid + 1
                else:
                    r = mid - 1
            return l if isLeft else r

        l, r = search(nums, target, True), search(nums, target, False)
        return [l, r] if l <= r else [-1, -1]

s = Solution()
print s.searchRange([1,2,3,3,3,8], 3)

