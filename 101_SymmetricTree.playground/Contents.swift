import UIKit

/*
 给定一个二叉树，检查它是否是镜像对称的。
 
 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 
 1
 / \
 2   2
 / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
 
 1
 / \
 2   2
 \   \
 3    3
 说明:
 
 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。

 */
// my solution

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

func isSymmetric(_ root: TreeNode?) -> Bool {
    
    let positive = travel(root, true);
    print(positive)
    for i in 0..<positive.count {
        let arr = positive[i]
        
        if arr.count <= 1 {
            return true
        }
        
        var low = 0
        var high = arr.count - 1
        
        while low < high {
            if arr[low] == arr[high] {
                low += 1
                high -= 1
            } else {
                return false
            }
        }
    }
    return true
}

func travel(_ node: TreeNode?, _ isPositive: Bool) -> [[Int]] {
    guard let temp = node else {
        return [[Int]]()
    }
    
    var res = [[Int]]()
    var queue = [TreeNode]()
    queue.append(temp);
    res.append([temp.val])
    
    
    while queue.count != 0 {
        var tempArr = [Int]()
        for _ in 0..<queue.count {
            let node = queue.first!
            queue.remove(at: 0)
            
            if node.left != nil {
                tempArr.append(node.left!.val)
                queue.append(node.left!)
            } else {
                tempArr.append(-1)
            }
            
            if node.right != nil {
                tempArr.append(node.right!.val)
                queue.append(node.right!)
            } else {
                tempArr.append(-1)
            }
        }
        res.append(tempArr)
    }
    return res
}

// better solution
func isSymmetric_better(_ root: TreeNode?) -> Bool {
    guard let root = root else {
        return true
    }
    return _helper(root.left, root.right)
}

func _helper(_ p: TreeNode?, _ q:TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }
    if p == nil || q == nil || p!.val != q!.val {
        return false
    }
    return _helper(p!.left, q!.right) && _helper(p!.right, q!.left)
}
