class Solution(object):
    def addBoundaries(self, cs):
        if cs is None or len(cs) == 0:
            return ['|', '|']

        cs2 = ['0']*(len(cs)*2 + 1)
        for i in range(len(cs2) - 1):
            if i % 2 == 0:
                cs2[i] = '|'
            else:
                cs2[i] = cs[(i-1)/2]

        cs2[len(cs2) -1 ] = '|'
        return cs2

    def removeBoundaries(self, cs):
        if cs is None or len(cs) < 3:
            return []

        cs2 = ['0']*((len(cs) - 1)/2)
        for i in range(len(cs2)):
            cs2[i] = cs[i*2+1]

        return cs2

    def longestPalindrome(self, s):
        if s is None or len(s) == 0:
            return ""

        s2 = self.addBoundaries(s)
        p = ['0']*len(s2)
        c,r,m,n = 0,0,0,0
        for i in range(len(s2)):
            if i > r:
                p[i] = 0
                m = i - 1
                n = i + 1
            else:
                i2 = c*2 - i
                if p[i2] < (r - i):
                    p[i] = p[i2]
                    m = -1
                else:
                    p[i] = r - i
                    n = r + 1
                    m = i*2 - n

            while m >=0 and n < len(s2) and s2[m] == s2[n]:
                p[i] += 1
                m -= 1
                n += 1
            if i + p[i] > r:
                c = i
                r = i + p[i]

        length, c = 0, 0
        for i in range(len(s2)):
            if length < p[i]:
                length = p[i]
                c = i
        ss = s2[(c-length):(c+length+1)]
        return ''.join(self.removeBoundaries(ss))

s = Solution()
print s.longestPalindrome('69123215')

















