from Util import ListNode

class Solution():
    def mergeTwoLists(self, l1, l2):
        if l1 is None:
            return l2

        if l2 is None:
            return l1

        if l1.val < l2.val:
            head = l1
            l1 = l1.next
        else:
            head = l2
            l2 = l2.next

        curr = head

        while l1 is not None and l2 is not None:
            if l1.val <= l2.val:
                curr.next = l1
                l1 = l1.next
            else:
                curr.next = l2
                l2 = l2.next

            curr = curr.next

        if l1 is None:
            curr.next = l2

        if l2 is None:
            curr.next = l1

        return head


a = ListNode(1)
b = ListNode(3)
c = ListNode(7)
d = ListNode(2)
e = ListNode(5)

a.next = b
b.next = c

d.next = e


s = Solution()
s.mergeTwoLists(a,d).show()
