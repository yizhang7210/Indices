class Solution(object):
    def removeElement(self, nums, val):
        count = 0
        i = 0
        while i < len(nums) - count:
            if nums[i] == val:

                start = len(nums) - count - 1
                while nums[start] == val and start > i:
                    start -= 1
                    count += 1

                tmp = nums[start]
                nums[i] = tmp
                nums[start] = val
                count += 1

            i += 1

        return len(nums) - count


s = Solution()
a = [4,5]
print a
print s.removeElement(a, 5)
print a

