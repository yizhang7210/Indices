class Solution(object):
    def permute(self, nums):
        result = []
        self.permute2(nums, 0, result)
        return result

    def permute2(self, nums, start, result):
        if start >= len(nums):
            result.append(nums[:])

        for j in range(start, len(nums)):
            self.swap(nums, start, j)
            self.permute2(nums, start+1, result)
            self.swap(nums, start, j)

    def swap(self,a, i, j):
        tmp = a[i]
        a[i] = a[j]
        a[j] = tmp


s = Solution()
print s.permute([1,2,3])
