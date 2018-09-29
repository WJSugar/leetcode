import UIKit

/*
 请判断一个链表是否为回文链表。
 
 示例 1:
 
 输入: 1->2
 输出: false
 示例 2:
 
 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
 */

class ListNode {
    public var val: Int;
    public var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}



// my solution
func isPalindrome(_ head: ListNode?) -> Bool {
    var root = head
    var stack = [ListNode]()
    while root != nil {
        stack.append(root!)
        root = root?.next
    }
    
    var low = 0
    var high = stack.count - 1
    
    while low < high {
        let lownode = stack[low]
        let highnode = stack[high]
        
        if lownode.val == highnode.val {
            low += 1
            high -= 1
        } else {
            return false
        }
    }
    return true
}
