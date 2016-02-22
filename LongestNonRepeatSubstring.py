class Solution(object):
    def lengthOfLongestSubstring(self, s):
        start = 0
        end = 0
        hash_map = {}
        current_start = 0

        for i in range(len(s)):
            c = s[i]
            prev = hash_map.get(c)
            hash_map[c] = i

            if prev is None or prev < current_start:
                if i + 1 - current_start > end - start:
                    end = i + 1
                    start = current_start
            else:
                current_start = prev + 1

        return end - start


s = Solution()
print s.lengthOfLongestSubstring('wobgrovw')



