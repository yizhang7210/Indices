class Solution(object):
    def isMatch(self, s, p):
        i, j = 0, 0
        starIndex, iIndex = -1, -1
        while i < len(s):
            if j < len(p) and (p[j] == '?' or p[j] == s[i]):
                i += 1
                j += 1
            elif j < len(p) and p[j] == '*':
                starIndex = j
                iIndex = i
                j += 1
            elif starIndex != -1:
                j = starIndex + 1
                i = iIndex + 1
                iIndex += 1
            else:
                return False

        while j < len(p) and p[j] == '*':
            j += 1

        return j == len(p)

s = Solution()
print s.isMatch("aab", "?ab")
