//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 
 示例:
 
 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:
 
 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 */
func moveZeroes(_ nums: inout [Int]) {
    if nums.count <= 1 {
        return;
    }
    var zeroIndexs = Array<Int>()
    var count = 0;
    for i in 0..<nums.count {
        let val = nums[i]
        
        if val == 0 {
            zeroIndexs.append(i)
        } else {
            if zeroIndexs.count > 0 {
                let zeroIndex = zeroIndexs[count]
                nums[zeroIndex] = nums[i]
                nums[i] = 0
                zeroIndexs.append(i);
                count += 1
            }
        }
    }
}
