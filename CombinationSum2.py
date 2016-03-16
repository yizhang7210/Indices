class Solution(object):
    def combinationSum2(self, candidates, target):
        candidates.sort()
        dp = [[[]]] + [[] for i in range(target)]
        for i in range(1, target + 1):
            for number in candidates:
                if number > i:
                    break
                for L in dp[i - number]:
                    if not L or number >= L[-1]:
                        if L.count(number) + 1 <= candidates.count(number):
                            if L + [number] not in dp[i]:
                                dp[i] += L + [number],

        return dp[target]

s = Solution()
print s.combinationSum([10,1,2,7,6,1,5], 8)
