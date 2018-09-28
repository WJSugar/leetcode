import UIKit

/*
 反转一个单链表。
 
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
// my solution
func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    var root = head
    
    var stack = [ListNode]()
    while root != nil {
        stack.append(root!)
        root = root!.next
    }
    
    root = stack.last!
    var next = root
    for i in stride(from: stack.count - 2, to: -1, by: -1) {
        let node = stack[i]
        node.next = nil
        next?.next = node
        next = node;
    }
    return root
}

// better solution
func reverseList_better(_ head: ListNode?) -> ListNode? {
    var temp : ListNode?
    var p : ListNode?
    var next : ListNode?
    
    temp = head
    
    while temp != nil{
        p = temp!.next
        temp!.next = next
        next = temp
        temp = p
    }
    
    return next
}
