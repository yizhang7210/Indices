class Solution(object):
    def permuteUnique(self, nums):
        result = []
        self.permute2(nums, 0, result)
        return result

    def permute2(self, nums, start, result):
        if start >= len(nums):
            result.append(nums[:])

        for j in range(start, len(nums)):
            if self.duplicate(nums, start, j):
                self.swap(nums, start, j)
                self.permute2(nums, start+1, result)
                self.swap(nums, start, j)

    def swap(self,a, i, j):
        tmp = a[i]
        a[i] = a[j]
        a[j] = tmp

    def duplicate(self, arr, start, end):
        for i in range(start, end):
            if arr[i] == arr[end]:
                return False

        return True

s = Solution()
print s.permuteUnique([1,2,1])
