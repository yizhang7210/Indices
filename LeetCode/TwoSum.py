class Solution(object):
    def twoSum(self, nums, target):

        # Initialize the index count.
        # Initialize the hashset for storing the taget values,
        # and a map for maping each entry to its index.
        count = 1
        complement_values = set()
        index_map = {}

        # Go through the list once.
        # If the 'complement' number is not in the stored values, stick it in
        # Otherwise, found the value so report the results.
        for num in nums:
            complement = target - num
            if num in complement_values:
                result = [index_map[str(num)], count]
                return result
            else:
                complement_values.add(complement)
                index_map[str(complement)] = count
                count += 1

s = Solution()
print s.twoSum([2, 7, 11, 15], 18)
