from Util import ListNode

class Solution(object):
    def swapPairs(self, head):
        if head is None or head.next is None:
            return head

        second = head.next
        head.next = self.swapPairs(second.next)
        second.next = head

        return second


a = ListNode(1)
b = ListNode(3)
c = ListNode(7)
d = ListNode(2)
e = ListNode(5)

a.next = b
b.next = c
c.next = d
d.next = e

s = Solution()
s.swapPairs(a).show()

