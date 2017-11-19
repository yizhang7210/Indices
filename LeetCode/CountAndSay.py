class Solution(object):
    def countAndSay(self, n):
        if n == 1:
            return '1'

        s = self.countAndSay(n-1)
        new = ''
        count = 0
        prev = 0
        for i in s:
            if int(i) == prev:
                count += 1
            else:
                if count > 0:
                    new += str(count) + str(prev)
                prev = int(i)
                count = 1

        new += str(count) + str(prev)

        return new

s = Solution()
print s.countAndSay(5)
