class Solution(object):
    def generateParenthesis(self, n):
        result = []
        self.dfs(result, "", n, n)
        return result

    def dfs(self, result, s, left, right):
        if left > right:
            return

        if left == 0 and right == 0:
            result.append(s)
            return

        if left > 0:
            self.dfs(result, s+"(", left - 1, right)

        if right > 0:
            self.dfs(result, s+")", left, right - 1)


s = Solution()
print s.generateParenthesis(3)
