

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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var head = head, cur = head
        var count = 0
        // find the last k node of the link
        while let n = cur, count != k {
            cur = n.next
            count += 1
        }
        // if link last len larger then k, rever t
        if count == k {
            cur = reverseKGroup(cur, k)
            while count > 0 {
                let temp = head?.next
                head?.next = cur
                cur = head
                head = temp
                count -= 1
            }
            head = cur
        }
        return head
    }
}

let l1 = ListNode(-1)
l1.next = ListNode(0)
l1.next?.next = ListNode(4)
l1.next?.next?.next = ListNode(6)
l1.next?.next?.next?.next = ListNode(9)


//l1.printNode()
Solution().reverseKGroup(l1, 3)?.printNode()

