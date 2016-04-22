class Solution(object):
    def groupAnagrams(self, strs):
        d = {}
        for w in sorted(strs):
            key = tuple(sorted(w))
            d[key] = d.get(key, []) + [w]
        return d.values()

s = Solution()
print s.groupAnagrams(['eat', 'tea', 'tan', 'ate', 'nat', 'bat'])
