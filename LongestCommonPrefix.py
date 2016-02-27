class Solution(object):

    def commonPrefix(self, stra, strb):
        result = ''
        i = 0
        while i < min(len(stra), len(strb)):
            if stra[i] == strb[i]:
                result += stra[i]
                i += 1
            else:
                break
        return result
                

    def longestCommonPrefix(self, strs):
        if len(strs) == 0:
            return ""
        if len(strs) == 1:
            return strs[0]

        return self.commonPrefix(strs[0], self.longestCommonPrefix(strs[1:]))

s = Solution()
print s.longestCommonPrefix(['', 'abct', 'abcrrr'])
