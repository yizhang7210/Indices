from Util import ListNode

class Solution(object):
    def addTwoNumbers(self, l1, l2):
        head = None
        carry = 0

        while l1 is not None or l2 is not None:

            if l1 is None:
                tmp = l2.val + carry
                l2 = l2.next
            elif l2 is None:
                tmp = l1.val + carry
                l1 = l1.next
            else:
                tmp = l1.val + l2.val + carry
                l1 = l1.next
                l2 = l2.next

            if tmp >= 10:
                tmp -= 10
                carry = 1
            else:
                carry = 0

            if head is None:
                head = ListNode(tmp)
                current = head
            else:
                new = ListNode(tmp)
                current.next = new
                current = new

        if carry == 1:
            new = ListNode(1)
            current.next = new

        return head

a = ListNode(1)
#a.next = ListNode(8)
#a.next.next = ListNode(3)

b = ListNode(9)
b.next = ListNode(9)
#b.next.next = ListNode(4)

s = Solution()
n = s.addTwoNumbers(a,b)
n.show()


