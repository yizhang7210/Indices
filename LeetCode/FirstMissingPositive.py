class Solution(object):
    def firstMissingPositive(self, nums):
        n = len(nums)
        for i in range(n):
            while nums[i] != i + 1:
                if nums[i] <=0 or nums[i] >= n:
                    break
                if nums[i] == nums[nums[i] - 1]:
                    break

                tmp = nums[i]
                nums[i] = nums[tmp - 1]
                nums[tmp - 1] = tmp

        for i in range(n):
            if nums[i] != i + 1:
                return i + 1

        return n + 1

s = Solution()
print s.firstMissingPositive([1])
