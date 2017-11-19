from Util import ListNode

class Solution(object):
    def removeNthFromEnd(self, head, n):

        if head.next is None:
            if n == 0:
                return head
            if n == 1:
                return None

        start = head
        end = head
        for i in range(n - 1):
            end = end.next

        if end.next is None:
            return head.next
        else:
            end = end.next

        while end.next is not None:
            start = start.next
            end = end.next

        start.next = start.next.next

        return head

a = ListNode(1)
b = ListNode(2)
c = ListNode(3)
d = ListNode(4)
e = ListNode(5)

a.next = b
b.next = c
c.next = d
d.next = e

s = Solution()
s.removeNthFromEnd(a, 5).show()
