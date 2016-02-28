class Solution(object):
    def intToRoman(self, num):
        C = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        X = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        I = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        return (num/1000)*'M' + C[(num%1000)/100] + X[(num%100)/10] + I[num%10];

s = Solution()
print s.intToRoman(2568)
