//: Playground - noun: a place where people can play

import UIKit

/*
 翻转一棵二叉树。
 
 示例：
 
 输入：
 
 4
 /   \
 2     7
 / \   / \
 1   3 6   9
 输出：
 
 4
 /   \
 7     2
 / \   / \
 9   6 3   1
 备注:
 这个问题是受到 Max Howell 的 原问题 启发的 ：
 
 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。
 */
// mys solution

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


func invertTree(_ root: TreeNode?) -> TreeNode? {
    rescursive(root)
    return root
}

func rescursive(_ node: TreeNode?) {
    guard let temp = node else {
        return
    }
    let node = temp.left
    temp.left = temp.right
    temp.right = node
    
    rescursive(temp.left)
    rescursive(temp.right)
}


// better solution
func invertTree_better(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
        return root
    }
    
    var temp: TreeNode?
    
    
    if root?.left?.left != nil || root?.left?.right != nil {
        temp = invertTree(root?.left)
    }else {
        temp = root?.left
    }
    if (root?.right?.left != nil || root?.right?.right != nil ){
        root?.left = invertTree(root?.right)
    }else {
        root?.left = root?.right
    }
    root?.right = temp
    
    return root
    
    
}
