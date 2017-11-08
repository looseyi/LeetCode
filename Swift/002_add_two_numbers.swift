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

public class LinkList : CustomStringConvertible {

    public var header: ListNode?
    public var count: Int = 0

    public init(_ vals: [Int]) {
        var node: ListNode?
        for val in vals {
            if let _ = header {
                node?.next = ListNode(val)
                node = node?.next
            } else {
                node = ListNode(val)
                header = node
            }
        }
    }

    public var description: String {
        return header?.description ?? ""
    }

}

class Solution {
    /* like binary sort, counting seporator fist， then the rest part */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carry = 0
        var targetNode: ListNode? = nil
        var header: ListNode? = nil

        func appendTargetNode(_ val: Int) {
            carry = val / 10
            if let node = targetNode {
                node.next = ListNode(val % 10)
                targetNode = node.next!
            } else {
                targetNode = ListNode(val % 10)
                header = targetNode
            }
        }

        var p = l1
        var q = l2
        while let m = p, let n = q {
            appendTargetNode(m.val + n.val + carry)
            p = m.next
            q = n.next
        }
        while let m = p {
            appendTargetNode(m.val + carry)
            p = m.next
        }
        while let n = q {
            appendTargetNode(n.val + carry)
            q = n.next
        }
        if carry > 0 {
            appendTargetNode(carry)
        }
        return header
    }

    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1
        var q = l2
        var current = dummyHead
        var carry = 0
        while let m = p, let n = q {
            let x = m.val
            let y = n.val
            let sum = carry + x + y
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!

            p = m.next
            q = n.next
        }
        while let m = p {
            let x = m.val
            let sum = carry + x
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!

            p = m.next
        }
        while let n = q {
            let x = n.val
            let sum = carry + x
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!

            q = n.next
        }
        if carry > 0 {
            current.next = ListNode(carry)
        }
        return dummyHead.next
    }
}

func printNode(_ node: ListNode?) {
    var node = node
    var str = ""
    while let m = node {
        str += "-> \(m.val)"
        node = m.next
    }
    print(str)
}

let l1 = LinkList([2, 4, 3])
let l2 = LinkList([5, 6, 4])

let s = Solution()
let result = s.addTwoNumbers(l1.header, l2.header)
printNode(result)




