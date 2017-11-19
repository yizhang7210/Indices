class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

    def show(self):
        print "Node ", self.val
        if self.next is not None:
            self.next.show()
