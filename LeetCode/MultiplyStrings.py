class Solution(object):
    def multiply(self, nums1, nums2):
        if nums1 == '0' or nums2=='0':
            return '0'

        result = [0] * (len(nums1)+len(nums2))

        for i in range(len(nums2)-1,-1,-1):
            for j in range(len(nums1)-1,-1,-1):
                temp = int(nums2[i]) * int(nums1[j])
                result[i+j+1] += temp

        carry = 0
        for i in range(len(result)-1,-1,-1):
            temp = result[i] + carry
            if temp > 9:
                carry = temp//10
                result[i] = temp%10
            else:
                result[i] = temp
                carry = 0

        result_str = ''
        for item in result:
            result_str += str(item)
        return result_str.lstrip('0')

s = Solution()
print s.multiply('1234', '34')
