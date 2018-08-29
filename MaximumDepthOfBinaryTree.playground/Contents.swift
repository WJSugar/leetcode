//: Playground - noun: a place where people can play

import Foundation



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
 }
 
class Solution {
    
    func test() {
        let node1 = TreeNode(3)
        let node2 = TreeNode(9)
        let node3 = TreeNode(20)
        let node4 = TreeNode(15)
        let node4 = TreeNode(7)
        node1.left = node2
        node2
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let temp = root else {
            return 0
        }
        var result = 0
        recursive(temp, 0, &result)
        return result + 1
    }
    
    func recursive(_ node: TreeNode?, _ level: Int, _ result: inout Int) {
        guard let temp = node else {
            return
        }
        
        if temp.left != nil {
            recursive(temp.left!, level + 1, &result);
        }
        
        if temp.right != nil {
            recursive(temp.right!, level + 1, &result);
        }
        
        if result < level {
            result = level;
        }
    }
}
