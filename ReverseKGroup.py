from Util import ListNode

class Solution(object):
    def reverseKGroup(self, head, k):
        if head is None:
            return None

        stack = []
        curr = head
        for i in range(k):
            if curr is None:
                return head
            else:
                stack.append(curr)
                curr = curr.next
        next_head = curr

        new_head = stack.pop()
        curr = new_head
        while True:
            if not stack:
                break
            new = stack.pop()
            if new is None:
                break
            else:
                curr.next = new
                curr = new

        curr.next = self.reverseKGroup(next_head, k)

        return new_head

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
s.reverseKGroup(a,3).show()
