//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
 
 你可以假设数组是非空的，并且给定的数组总是存在众数。
 
 示例 1:
 
 输入: [3,2,3]
 输出: 3
 示例 2:
 
 输入: [2,2,1,1,1,2,2]
 输出: 2
 */
// better solution

func majorityElement(_ nums: [Int]) -> Int {
    var curNum = nums[0]
    var majority = 0;
    var count = 0
    while count < nums.count {
        let val = nums[count]
        if curNum != val {
            majority -= 1
            if majority < 1 {
                curNum = val
                majority = 1
            }
        } else {
            majority += 1
        }
        count += 1
    }
    return curNum
}


// my solution two method
func mymajorityElement01(_ nums: [Int]) -> Int {
    let sortNum = nums.sorted();
    let mid = sortNum[sortNum.count / 2];
    return mid
}

func mymajorityElement02(_ nums: [Int]) -> Int {
    var curNum = nums[0]
    var majority = 0;
    for num in nums {
        if curNum != num {
            majority -= 1
            if majority < 1 {
                curNum = num
                majority = 1
            }
        } else {
            majority += 1
        }
    }
    return curNum;
}

