class Solution(object):
    def reverse(self, x):
        if x < 0:
            m = -1
        else:
            m = 1
        x = abs(x)

        s = str(x)
        y = 0
        for i in range(len(s)):
            y += int(s[i]) * (10**i)

        if y <= 2 ** 31 - 1:
            return m*y
        else:
            return 0

s = Solution()
print s.reverse(90100)
