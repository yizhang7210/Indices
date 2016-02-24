class Solution(object):
    def isPalindrome(self, x):
        s = str(x)
        if not s:
            return True

        l = 0
        r = len(s) - 1
        while l <= r:
            if s[l] != s[r]:
                return False
            l += 1
            r -= 1

        return True

s = Solution()
print s.isPalindrome(11221)
