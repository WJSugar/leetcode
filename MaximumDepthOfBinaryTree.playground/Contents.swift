//: Playground - noun: a place where people can play

import Foundation

/*
 给定一个二叉树，找出其最大深度。
 
 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
 3
 / \
 9  20
 /  \
 15   7
 返回它的最大深度 3 。
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
        if result < level {
            result = level;
        }
        
        if temp.left != nil {
            recursive(temp.left!, level + 1, &result);
        }
        
        if temp.right != nil {
            recursive(temp.right!, level + 1, &result);
        }
    }
}
