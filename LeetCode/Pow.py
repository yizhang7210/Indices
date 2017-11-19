class Solution(object):
    def myPow(self, x, n):
        if n == 0:
            return 1
        if n == 1:
            return x
        if n == -1:
            return 1.0/x

        if n % 2 == 0:
            return self.myPow(x, n/2) ** 2
        else:
            return self.myPow(x, n - 1) * x

s = Solution()
print s.myPow(2, -2147483648)
