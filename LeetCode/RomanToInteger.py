class Solution(object):
    def romanToInt(self, s):
        ints = {'M':1000, 'D':500, 'C':100, 'L':50, 'X':10, 'V':5, 'I':1}

        s = list(s)
        nums = [ints.get(x) for x in s]

        i = 0;
        while i  < len(nums) - 1:
            if nums[i] < nums[i+1]:
                nums[i] = nums[i+1] - nums[i]
                nums[i+1] = 0;
                i += 2
            else:
                i += 1
                
        total = sum(nums)
        
        return(total)

s = Solution()
print s.romanToInt('MMMXI')
