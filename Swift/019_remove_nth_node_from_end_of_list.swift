public class ListNode : CustomStringConvertible {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }

    public var description: String {
        return val.description
    }
}
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy
        var fast: ListNode? = dummy
        for _ in 1...n + 1 {
            fast = fast?.next
        }
        while fast != nil {
            (slow, fast) = (slow?.next, fast?.next)
        }
        slow?.next = slow?.next?.next
        return dummy.next
    }
}

let head = ListNode(1)
head.next = ListNode(2)

print(Solution().removeNthFromEnd(head, 1) ?? "")
