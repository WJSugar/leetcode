//: Playground - noun: a place where people can play

import UIKit
/*
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
 
 你的算法时间复杂度必须是 O(log n) 级别。
 
 如果数组中不存在目标值，返回 [-1, -1]。
 
 示例 1:
 
 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 示例 2:
 
 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]
 */
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    var index:Int?
    if nums.count <= 0 {
        return [-1, -1]
    }
    if nums.first == target && nums.last == target {
        return [0, nums.count - 1]
    }
    if nums.first! == target{
        index = 0
    }
    
    if nums.last! == target {
        index = nums.count - 1
    }
    
    if index == nil {
        var low = 0
        var high = nums.count - 1
        var mid = (low + high) / 2
        while low <= high {
            let value = nums[mid]
            
            if value == target {
                index = mid
                break
            }
            
            if value > target {
                high = mid - 1
            }
            
            if value < target {
                low = mid + 1
            }
            
            mid = (low + high) / 2
        }
    }
    
    if index != nil {
        var i = index!;
        var j = index! + 1;
        
        while i >= 0 || j < nums.count - 1 {
            
            if i >= 0 && j < nums.count - 1 {
                if nums[i] != target && nums[j] != target {
                    break;
                }
            }
            
            if i >= 0 {
                if nums[i] == target {
                    i -= 1
                }
            } else {
                if j < nums.count - 1 {
                    if nums[j] != target {
                        break;
                    }
                }
            }
            
            if j < nums.count - 1 {
                if nums[j] == target {
                    j += 1
                }
            } else {
                if i >= 0  {
                    if nums[i] != target {
                        break;
                    }
                }
            }
        }
        return [i + 1, j - 1]
    } else {
        return [-1, -1]
    }
}
