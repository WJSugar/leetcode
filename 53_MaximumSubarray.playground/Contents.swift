//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 进阶:
 
 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
 */

// my solution
func maxSubArray(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    
    if nums.count == 1 {
        return nums[0]
    }
    
    var sum = nums[0]
    var maxNum = nums[0]
    
    for i in 1..<nums.count {
        let val = nums[i] + sum
        sum = max(nums[i], val)
        maxNum = maxNum > sum ? maxNum : sum
    }
    return maxNum
}

//better solution
func maxSubArray_better(_ nums: [Int]) -> Int {
    
    if nums.isEmpty {
        return 0
    }
    
    var maxSum = nums[0]
    var sum = 0
    for i in 0..<nums.count {
        sum += nums[i]
        
        maxSum = max(maxSum, sum)
        sum = max(sum, 0)
    }
    return maxSum;
}

