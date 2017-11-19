class Solution(object):
    def findMedianSortedArrays(self, A, B):
        def kthSmall(A, B, i1, i2, k):
            lenA, lenB = len(A), len(B)
            if i1 >= lenA: return B[k - 1]
            if i2 >= lenB: return A[k - 1]
            if k == 1: return min(A[i1], B[i2])
            if lenA - i1 > lenB - i2: return kthSmall(B, A, i2, i1, k)
            pa = min(lenA - i1, k / 2)
            pb = k - pa
            return kthSmall(A, B, i1 + pa, i2, pb) if A[i1 + pa - 1] < B[i2 + pb - 1] else kthSmall(A, B, i1, i2 + pb, pa)

        lenAB = len(A) + len(B)
        return kthSmall(A, B, 0, 0, lenAB / 2 + 1) if lenAB % 2 else 0.5 * (kthSmall(A, B, 0, 0, lenAB / 2) + kthSmall(A, B, 0, 0, lenAB / 2 + 1))
