class Solution(object):
    def convert(self, s, numRows):

        if numRows == 1:
            return s

        rows = [''] * numRows
        r = 0
        inc = 1
        for i in range(len(s)):
            rows[r] += s[i]
            if r == 0:
                inc = 1
            elif r == numRows - 1:
                inc = -1
            r += inc

        return ''.join(rows)

s = Solution()
print s.convert('abcdefg', 2)
