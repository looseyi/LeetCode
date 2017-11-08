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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let count = lists.count
        if count <= 1 {
            return lists.first ?? nil
        }
        let mid = count / 2
        let left = mergeKLists(Array(lists[0..<mid]))
        let right = mergeKLists(Array(lists[mid..<count]))
        return mergeTwoLists(left, right)
    }

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

let l1 = ListNode(-1)
l1.next = ListNode(0)
l1.next?.next = ListNode(4)
l1.next?.next?.next = ListNode(6)
l1.next?.next?.next?.next = ListNode(9)



let l2 = ListNode(10)
l2.next = ListNode(12)
l2.next?.next = ListNode(30)
l2.next?.next?.next = ListNode(86)
l2.next?.next?.next?.next = ListNode(91)


let l3 = ListNode(-1)
l3.next = ListNode(0)
l3.next?.next = ListNode(4)
l3.next?.next?.next = ListNode(6)
l3.next?.next?.next?.next = ListNode(9)

l1.printNode()
l2.printNode()
l3.printNode()
Solution().mergeKLists([])?.printNode()
/* Solution().mergeKLists([l1, l2, l3])?.printNode() */
