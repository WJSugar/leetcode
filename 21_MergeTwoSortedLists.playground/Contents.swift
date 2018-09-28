import UIKit

/*
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */
class ListNode {
    public var val: Int;
    public var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


//my solution
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    if l1 == nil {
        return l2
    }
    
    if l2 == nil {
        return l1
    }
    
    var h1 = l1
    var h2 = l2
    var head: ListNode?
    if l1!.val <= l2!.val {
        head = h1
        h1 = l1?.next
    } else {
        head = h2
        h2 = l2?.next
    }
    var last = head
    
    while h1 != nil || h2 != nil{
        if h1 != nil && h2 != nil {
            if h1!.val <= h2!.val {
                last?.next = h1
                h1 = h1?.next
            } else {
                last?.next = h2
                h2 = h2?.next
            }
        } else if h1 != nil {
            last?.next = h1
            break;
        } else {
            last?.next = h2
            break;
        }
        
        last = last?.next
    }
    return head;
}


func mergeTwoLists_better(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil || l2 == nil {
        return l1 ?? l2
    } else {
        
        let p = ListNode(0)
        
        var sentry: ListNode? = p
        
        var p1 = l1
        var p2 = l2
        
        while let x1 = p1, let x2 = p2 {
            if x1.val < x2.val {
                sentry?.next = p1
                p1 = p1?.next
            } else {
                sentry?.next = p2
                p2 = p2?.next
            }
            sentry = sentry?.next
        }
        
        sentry?.next = p1 ?? p2
        
        return p.next
    }
}
