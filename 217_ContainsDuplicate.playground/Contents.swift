//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个整数数组，判断是否存在重复元素。
 
 如果任何值在数组中出现至少两次，函数返回 true。如果数组中每个元素都不相同，则返回 false。
 
 示例 1:
 
 输入: [1,2,3,1]
 输出: true
 示例 2:
 
 输入: [1,2,3,4]
 输出: false
 示例 3:
 
 输入: [1,1,1,3,3,4,3,2,4,2]
 输出: true
 */

// my solution
func containsDuplicate(_ nums: [Int]) -> Bool {
    var map = [Int: Int]()
    
    for i in 0..<nums.count {
        map.updateValue(i, forKey: nums[i])
    }
    
    if map.keys.count == nums.count {
        return false
    } else {
        return true
    }
}

//better solution
func containsDuplicate_better(_ nums: [Int]) -> Bool {
    return nums.count != Set.init(nums).count
}












