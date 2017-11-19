from Util import ListNode
from Queue import PriorityQueue

class Solution(object):

    def __init__(self):
        self.heap = []
        self.hsize = 0

    def mergeKLists(self, lists):
        self.heap = [[i, lists[i].val] for i in range(len(lists)) if lists[i] is not None]
        self.hsize = len(self.heap)
        for i in range(self.hsize -1, -1, -1):
            self.adjustdown(i)

        nHead = ListNode(0)
        head = nHead
        while self.hsize > 0:
            ind, val = self.heap[0][0], self.heap[0][1]
            head.next = lists[ind]
            head = head.next
            lists[ind] = lists[ind].next
            if lists[ind] is None:
                self.heap[0] = self.heap[self.hsize - 1]
                self.hsize = self.hsize - 1
            else:
                self.heap[0] = [ind, lists[ind].val]
            self.adjustdown(0)
        return nHead.next

    def adjustdown(self, p):
        lc = lambda x : (x + 1)*2 - 1
        rc = lambda x : (x + 1)*2
        while True:
            np, pv = p, self.heap[p][1]
            if lc(p) < self.hsize and self.heap[lc(p)][1] < pv:
                np, pv = lc(p), self.heap[lc(p)][1]
            if rc(p) < self.hsize and self.heap[rc(p)][1] < pv:
                np = rc(p)

            if np == p:
                break
            else:
                self.heap[np], self.heap[p] = self.heap[p], self.heap[np]
                p = np


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
#s.mergeKLists([a,d,j,k,m]).show()
