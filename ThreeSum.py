class Solution(object):
    def twoSum(self, nums, target):
        count = 0
        complement_values = set()
        index_map = {}
        results = []
        for num in nums:
            complement = target - num
            if num in complement_values:
                count2 = index_map[str(num)]
                results.append([nums[count], nums[count2]])
                count += 1
            else:
                complement_values.add(complement)
                index_map[str(complement)] = count
                count += 1

        return results

    def threeSum(self, nums):
        results = []
        for i in range(len(nums)):
            first_num = nums[i]
            rest = nums[(i+1):]

            two_sum = self.twoSum(rest, -first_num)
            for two_sol in two_sum:
                new = sorted(two_sol + [first_num])
                if new not in results:
                    results.append(new)

        return results


s = Solution()
print s.twoSum([0,1,1,2], 2)
print s.threeSum([-2, 0, 1, 1, 2])
