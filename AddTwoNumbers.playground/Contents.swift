//: Playground - noun: a place where people can play

import UIKit

/*
 给定两个非空链表来表示两个非负整数。位数按照逆序方式存储，它们的每个节点只存储单个数字。将两数相加返回一个新的链表。
 
 你可以假设除了数字 0 之外，这两个数字都不会以零开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        var rlist = ListNode(0)
        var pre: ListNode?;
        
        var sum = 0
        
        while (list1 != nil) || (list2 != nil) {
            if list1 != nil {
                sum += list1!.val
                list1 = list1?.next
            }
            
            if list2 != nil {
                sum += list2!.val
                list2 = list2?.next
            }
            
            let node = ListNode(sum % 10)
            sum = sum < 10 ? 0 : 1;
            
            if pre == nil {
                pre = node
                rlist = pre!
            } else {
                pre?.next = node
                pre = pre?.next
            }
        }
        
        if sum == 1 {
            let node = ListNode(sum)
            if pre == nil {
                pre = node
                rlist = pre!
            } else {
                pre?.next = node
                pre = pre?.next
            }
        }
        return rlist
    }
}
