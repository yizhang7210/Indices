class Solution(object):
    def isValid(self, s):

        ind_map = {'(':1, ')':1, '[':2, ']':2, '{':3, '}':3}

        stack = []
        for i in s:
            if i in ['(', '[', '{']:
                stack.append(ind_map.get(i))
            else:
                if len(stack) > 0 and stack[-1] == ind_map.get(i):
                    stack.pop()
                else:
                    return False

        return len(stack) == 0


s = Solution()
print s.isValid('([][][[])]{}')
