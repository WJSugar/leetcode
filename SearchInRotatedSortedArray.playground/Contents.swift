//: Playground - noun: a place where people can play

import UIKit
/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。
 
 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。
 
 搜索一个给定的目标值，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。
 
 你可以假设数组中不存在重复的元素。
 
 你的算法时间复杂度必须是 O(log n) 级别。
 
 示例 1:
 
 输入: nums = [4,5,6,7,0,1,2], target = 0
 输出: 4
 示例 2:
 
 输入: nums = [4,5,6,7,0,1,2], target = 3
 输出: -1
 */
func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count <= 0 {
        return -1
    }
    
    if nums.first! == target {
        return 0
    }
    
    if nums.last! == target {
        return nums.count - 1
    }
    
    var low = 0
    var high = nums.count - 1
    var mid = (low + high) / 2
    while low <= high {
        let vallow = nums[low]
        let valhigh = nums[high]
        let valmid = nums[mid]
        
        if vallow == target {
            return low
        }
        if valhigh == target {
            return high
        }
        if valmid == target {
            return mid;
        }
        
        if target > valhigh {
            if target > vallow {
                if target > valmid {
                    low += 1
                    high -= 1
                } else {
                    high = mid - 1
                    low += 1
                }
            }
        } else {
            if target > vallow {
                if target > valmid {
                    low = mid + 1;
                } else {
                    high = mid - 1
                }
            } else {
                low += 1
                high -= 1
            }
        }
        mid = (low + high) / 2
        if target > valhigh && target < vallow {
            return -1
        }
    }
    return -1
}
