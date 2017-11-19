class Solution(object):
    def trap(self, height):
        if len(height) < 3:
            return 0

        copy = list(height)

        s = height.index(max(height))
        copy.remove(max(height))
        m = max(copy)
        t = copy.index(m)

        if s <= t:
            t += 1

        start = min(s,t)
        end = max(s,t)

        this_trap = m*(end - start - 1) - sum(height[(start+1):end])
        return this_trap + self.trap(height[0:(start + 1)]) + self.trap(height[end:len(height)])


s = Solution()
print s.trap([0,1,0,2,1,0,1,3,2,1,2,1])
