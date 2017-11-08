

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    func printNode() {
        var str = "\(val)"
        var current = next
        while let n = current {
            str += " -> \(n.val)"
            current = n.next
        }
        print(str)
    }

}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head: ListNode? = ListNode(-1)
        var l1 = l1, l2 = l2, current = head
        while let l: ListNode = l1, let r: ListNode = l2, let cur = current {
            if l.val < r.val {
                cur.next = l
                l1 = l.next
            } else {
                cur.next = r
                l2 = r.next
            }
            current = cur.next
        }
        while let l: ListNode = l1, let cur = current {
            cur.next = l
            l1 = l.next
            current = cur.next
        }
        while let r: ListNode = l2, let cur = current {
            cur.next = r
            l2 = r.next
            current = cur.next
        }
        return head?.next
    }
}

let l = ListNode(-1)
l.next = ListNode(0)
l.next?.next = ListNode(4)
l.next?.next?.next = ListNode(6)
l.next?.next?.next?.next = ListNode(9)



let r = ListNode(-1)
r.next = ListNode(0)
r.next?.next = ListNode(4)
r.next?.next?.next = ListNode(6)
r.next?.next?.next?.next = ListNode(9)

l.printNode()
r.printNode()
Solution().mergeTwoLists(l, r)?.printNode()



