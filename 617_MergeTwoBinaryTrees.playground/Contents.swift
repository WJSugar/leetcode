import UIKit

/*
 给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。
 
 你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。
 
 示例 1:
 
 输入:
 Tree 1                     Tree 2
 1                         2
 / \                       / \
 3   2                     1   3
 /                           \   \
 5                             4   7
 输出:
 合并后的树:
 3
 / \
 4   5
 / \   \
 5   4   7
 注意: 合并必须从两个树的根节点开始。
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

// my solution
func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    var root = t1
    recursive(&root, t2)
    return root
}

func recursive(_ node1: inout TreeNode?, _ node2: TreeNode?) {
    if node1 != nil && node2 != nil {
        node1!.val = node1!.val + node2!.val
        recursive(&node1!.left, node2!.left)
        recursive(&node1!.right, node2!.right)
    } else if node1 != nil {
        return
    } else if node2 != nil {
        node1 = node2
        return
    } else {
        return
    }
}
// better solution
func mergeTrees_better(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    var result:TreeNode? = TreeNode(0)
    if t1 == nil && t2 == nil {
        result = nil
    } else if t1 != nil && t2 == nil {
        result = t1
    } else if t1 == nil && t2 != nil {
        result = t2
    } else {
        result!.val = t1!.val + t2!.val
        result!.left = mergeTrees(t1!.left, t2!.left)
        result!.right = mergeTrees(t1!.right, t2!.right)
    }
    return result
}
