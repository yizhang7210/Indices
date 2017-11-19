class Solution(object):
    def jump(self, nums):
        if nums is None or len(nums) == 0:
            return 0

        last_reach = 0
        reach = 0
        step = 0

        for i in range(len(nums)):
            if i > reach:
                break

            if i > last_reach:
                step += 1
                last_reach = reach

            reach = max(reach, nums[i] + i)

        if reach < len(nums) - 1:
            return 0

        return step

s = Solution()
print s.jump([2,3,1,1,4])
