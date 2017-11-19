class Solution(object):
    def maxArea(self, height):
        l, r, width, area = 0, len(height) - 1, len(height) - 1, 0
        for w in range(width, 0, -1):
            if height[l] < height[r]:
                area, l = max(area, height[l] * w), l + 1
            else:
                area, r = max(area, height[r] * w), r - 1

        return area

s = Solution()
print s.maxArea([1,2,3,4])
