import UIKit

/*
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 
 示例 1:
 
 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 示例 2:
 
 输入: [-1,-100,3,99] 和 k = 2
 输出: [3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]
 说明:
 
 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 要求使用空间复杂度为 O(1) 的原地算法。
 */

func rotate(_ nums: inout [Int], _ k: Int) {
    // (当前位置 + k) % 数组长度 = 移动后的位置
    var res = Array(repeating: 0, count: nums.count)
    for i in 0..<nums.count {
        let index = (i + k) % nums.count
        res[index] = nums[i]
    }
    nums = res
}

//better solution
func rotate_better(_ nums: inout [Int], _ k: Int) {
    let index = nums.count - 1 - (k % nums.count)
    nums += nums[0...index]
    nums.removeSubrange((0...index))
}
