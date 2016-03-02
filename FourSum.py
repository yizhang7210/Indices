class Solution(object):
    def fourSum(self, nums, target):
        flat_list = []
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                flat_list.append((nums[i] + nums[j], i, j))

        index_map = {}
        targets = set()
        results = []

        #print flat_list
        for value, ind1, ind2 in flat_list:
            new_target = target - value
            if new_target in targets:
                index_map.get(new_target).append((ind1, ind2))
            else:
                targets.add(new_target)
                index_map[new_target] = [(ind1, ind2)]

            if value in targets:
                # Found a target.
                index_list = index_map.get(value)
                for old_ind1, old_ind2 in index_list:
                    if len(set([ind1, ind2]) - set([old_ind1, old_ind2])) == 2:
                        # There is no repeated element.
                        new_result = sorted([nums[i] for i in [ind1, ind2, old_ind1, old_ind2]])
                        if new_result not in results:
                            results.append(new_result)

        return results


s = Solution()
print s.fourSum([2, -4, -5, -2, -3, -5, 0, 4, -2], -14)
