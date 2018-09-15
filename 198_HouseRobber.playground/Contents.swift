//: Playground - noun: a place where people can play

import UIKit

/*
 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
 
 给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。
 
 示例 1:
 
 输入: [1,2,3,1]
 输出: 4
 解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
 偷窃到的最高金额 = 1 + 3 = 4 。
 示例 2:
 
 输入: [2,7,9,3,1]
 输出: 12
 解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
 偷窃到的最高金额 = 2 + 9 + 1 = 12 。
 */

//my solution
func rob(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.count == 1 {
        return nums[0]
    }
    var profits = Array.init(repeating: 0, count: nums.count)
    profits[0] = nums[0]
    profits[1] = max(nums[0], nums[1])
    
    for i in 2..<nums.count {
        let val1 = profits[i - 2] + nums[i]
        let val2 = profits[i - 1]
        profits[i] = max(val1, val2)
    }
    return  profits[nums.count - 1]
}

//recursive solution
func recursive(_ nums: [Int], _ index: Int) -> Int {
    if index == 0 {
        return nums[0]
    } else if index == 1 {
        return max(nums[0], nums[1])
    } else {
        let val1 = recursive(nums, index - 2) + nums[index]
        let val2 = recursive(nums, index - 1)
        return max(val1, val2)
    }
}

// more efficient solution
func rob_better(_ nums: [Int]) -> Int {
    
    if nums.count <= 0 {
        return 0
    }
    
    if nums.count == 1 {
        return nums[0]
    }
    
    if nums.count == 2 {
        return nums[0] > nums[1] ? nums[0] : nums[1]
    }
    
    var f0 = nums[0]//可以加但没加的最大值
    var f1 = nums[1]//不可以加的最大值
    var f2 = nums[0]+nums[2]//可以加但是加了的最大值
    
    if nums.count > 3 {
        
        for i in 3 ..< nums.count {
            
            f0 = f1 > f0 ? f1 : f0
            f1 = f2 > f1 ? f2 : f1
            f2 = f0 + nums[i]
            
        }
    }
    
    return f2 > f1 ? f2 : f1
    
}
