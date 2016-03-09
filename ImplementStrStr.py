class Solution(object):
    def strStr(self, haystack, needle):
        haystackPtr, haystackLen, needleLen = 0, len(haystack), len(needle)
        while True:
            needlePtr = 0
            while True:
                if needlePtr == needleLen:
                    return haystackPtr
                if haystackPtr + needlePtr == haystackLen:
                    return -1
                if needle[needlePtr] != haystack[haystackPtr + needlePtr]:
                    break
                needlePtr += 1
            haystackPtr += 1

s = Solution()
print s.strStr('tgbwawabgqq', 'wab')
