class Solution(object):
    def isMatch(self, s, p):
        lenS, lenP = len(s), len(p)
        dp = [[False] * (lenP + 1) for i in range(lenS + 1)]

        dp[0][0] = True
        for j in range(2, lenP + 1):
            dp[0][j] = dp[0][j-2] and p[j-1] == '*'

        for i in range(1, lenS + 1):
            for j in range(1, lenP + 1):
                if p[j-1] == '*':
                    dp[i][j] = dp[i][j-2] or (p[j-2] in (s[i-1], '.') and dp[i-1][j])
                else:
                    dp[i][j] = dp[i-1][j-1] and p[j-1] in (s[i-1], '.')

        return dp[lenS][lenP]

s = Solution()
print s.isMatch('aab', 'c*a*b')
