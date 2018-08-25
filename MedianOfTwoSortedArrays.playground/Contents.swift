//: Playground - noun: a place where people can play

import UIKit

/*
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2 。
 
 请找出这两个有序数组的中位数。要求算法的时间复杂度为 O(log (m+n)) 。
 
 你可以假设 nums1 和 nums2 不同时为空。
 
 示例 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 中位数是 2.0
 示例 2:
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 中位数是 (2 + 3)/2 = 2.5
 */

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    guard nums1.count != 0 else {
        guard nums2.count != 0 else {
            return 0.0;
        }
        return result(nums2)
    }
    
    guard nums2.count != 0 else {
        return result(nums1)
    }
    
    var mutablenum1 = nums1
    var mutablenum2 = nums2
    if nums1.count > nums2.count {
        return foo(nums: &mutablenum2, largerNums: &mutablenum1)
    } else {
        return foo(nums: &mutablenum1, largerNums: &mutablenum2)
    }
}

func foo(nums: inout [Int], largerNums: inout [Int]) -> Double {
    var lastIndex = 0
    for i in largerNums {
        for j in (lastIndex)..<nums.count {
            if nums[j] >= i {
                nums.insert(i, at: j)
                lastIndex = j + 1
                largerNums.remove(at: largerNums.index(of: i)!)
                break;
            }
        }
    }
    
    if largerNums.count != 0 {
        nums.append(contentsOf: largerNums)
    }
    
    return result(nums)
}

func result(_ nums: [Int]) -> Double {
    var result = 0.0
    let index = nums.count / 2
    if nums.count % 2 == 0 {
        result = Double(nums[index - 1] + nums[index]) / 2.0
    } else {
        result = Double(nums[index]);
    }
    return result
}
