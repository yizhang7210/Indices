from Queue import PriorityQueue
from Util import ListNode

class Solution(object):
    def mergeKLists(self, lists):
        dummy = ListNode(0)
        curr = dummy
        q = PriorityQueue()
        for node in lists:
            if node is not None:
                q.put((node.val, node))
        while q.qsize() > 0:
            curr.next = q.get()[1]
            curr = curr.next
            if curr.next is not None:
                q.put((curr.next.val, curr.next))

        return dummy.next

a = ListNode(1)
b = ListNode(3)
c = ListNode(7)
d = ListNode(13)

e = ListNode(2)
f = ListNode(5)
g = ListNode(8)
h = ListNode(32)
i = ListNode(56)

j = ListNode(5)
k = ListNode(54)
l = ListNode(55)

m = ListNode(11)

a.next = b
b.next = c
c.next = d

e.next = f
f.next = g
g.next = h
h.next = i

j.next = k
k.next = l

s = Solution()
ss = s.mergeKLists([a,e,j,m])
ss.show()
