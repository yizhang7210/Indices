class Solution(object):
    def myAtoi(self, str):
        s = str.strip()
        if not s:
            return 0

        if s[0] == '-':
            m = -1
            i = 1
        elif s[0] == '+':
            m = 1
            i = 1
        else:
            m = 1
            i = 0

        x = ''
        while i < len(s) and s[i] in '0123456789':
            x += s[i]
            i += 1
        if not x:
            y = 0
        else:
            y = int(x)

	y = y*m

        if y > 2 ** 31 - 1:
            y = 2 ** 31 - 1
        if y < -2 ** 31:
            y = -2 ** 31

        return y

s = Solution()
print s.myAtoi('  ')

