class Solution(object):
    def longestValidParentheses(self, s):
        return max(self.helper(s, '('), self.helper(s[::-1], ')'))

    def helper(self, s, left):
        ans = 0
        max_ending_here = 0
        count = 0
        for c in s:
            if c == left:
                count += 1
                max_ending_here += 1
            else:
                count -= 1
                if count < 0:
                    max_ending_here = 0
                    count = 0
                else:
                    max_ending_here += 1
                    if count == 0:
                        ans = max(ans, max_ending_here)

        return ans

s = Solution()
print s.longestValidParentheses('(())))(()())')


