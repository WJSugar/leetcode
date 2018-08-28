//: Playground - noun: a place where people can play

import UIKit
/*
 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
 
 例如:
 给定二叉树: [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 返回其层次遍历结果：
 
 [
 [3],
 [9,20],
 [15,7]
 ]
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

//my solution
func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let temp = root else {
        return []
    }
    var result = Array<Array<Int>>()
    recursive(temp, 0, &result)
    return result
}
func recursive(_ node: TreeNode?, _ level: Int, _ result: inout Array<Array<Int>>) {
    guard let temp = node else {
        return
    }
    if result.count - 1 < level {
        let curLevels = Array<Int>()
        result.append(curLevels)
    }
    result[level].append(temp.val)
    
    if temp.left != nil {
        recursive(temp.left!, level + 1, &result)
    }
    
    if temp.right != nil {
        recursive(temp.right, level + 1, &result)
    }
}

func levelOrder1(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var queue = Array<TreeNode>()
    var result = Array<[Int]>()
    queue.append(root!)
    
    while queue.isEmpty != true {
        var curLevels = Array<Int>()
        for _ in 0..<queue.count {
            let node = queue.remove(at: 0)
            curLevels.append(node.val)
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
        }
        result.append(curLevels)
    }
    
    return result
}
