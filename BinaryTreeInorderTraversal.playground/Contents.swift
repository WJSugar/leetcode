//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 
 给定一个二叉树，返回它的中序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [1,3,2]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 */
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let temp = root else {
            return []
        }
        
        var result = Array<Int>()
        recursive(temp, result: &result)
        return result;
    }
    
    
    func recursive(_ node: TreeNode?, result: inout [Int]) {
        guard let temp = node else {
            return
        }
        
        if temp.left != nil {
            recursive(temp.left!, result: &result)
        }
        
        result.append(temp.val)
        
        if temp.right != nil {
            recursive(temp.right!, result: &result)
        }
    }
}
