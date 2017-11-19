class Solution(object):
    def divide(self, dividend, divisor):
        if divident == 0:
            return 0

        val = int(math.exp(math.log(abs(dividend)) - math.log(abs(divisor))));

        if (dividend >= 0) != (divisor > 0):
            return max(-val, -2*31)
        else:
            return min(val, 2^31 - 1)

s = Solution()
print s.divide(0, 5)
