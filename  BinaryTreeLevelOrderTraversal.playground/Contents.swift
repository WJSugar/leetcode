//: Playground - noun: a place where people can play

import UIKit

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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
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
