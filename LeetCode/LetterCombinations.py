class Solution(object):
    def letterCombinations(self, digits):
        if len(digits) == 0:
            return []

        letter_map = {'1':'', '2':'abc', '3':'def', '4':'ghi', \
            '5':'jkl', '6':'mno', '7':'pqrs', '8':'tuv', '9':'xwyz'}

        the_list = ['']
        for i in digits:
            the_list = [x + y for x in the_list for y in letter_map.get(str(i))]

        return the_list

s = Solution()
print s.letterCombinations('23')
