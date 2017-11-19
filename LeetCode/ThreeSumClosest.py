class Solution(object):
    def threeSumClosest(self, nums, target):
        tmp_min = float('inf')
        result = 0
        nums = sorted(nums)
        for i in range(len(nums)):
            j = i + 1
            k = len(nums) - 1
            while j < k:
                tmp_sum = nums[i] + nums[j] + nums[k]
                diff = abs(tmp_sum - target)

                if diff == 0:
                    return tmp_sum

                if diff < tmp_min:
                    tmp_min = diff
                    result = tmp_sum

                if tmp_sum <= target:
                    j += 1
                else:
                    k -= 1

        return result

s = Solution()
print s.threeSumClosest([-1,2,1,-4], 1)

