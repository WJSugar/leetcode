//: Playground - noun: a place where people can play

import UIKit

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums.count <= 0 {
        return 0
    }
    
    if nums.first! >= target {
        return 0
    }
    
    if nums.last! < target {
        return nums.count
    }
    
    if nums.last! == target {
        return nums.count - 1
    }
    
    var low = 0;
    var height = nums.count - 1
    var mid = (low + height) / 2
    
    while low <= height {
        let vaule = nums[mid]
        let after = nums[mid + 1]
        if mid - 1 < 0 {
            if vaule < target {
                if target < after {
                    return mid + 1
                }
            } else {
                return 0
            }
        }
        let before = nums[mid - 1]
        
        if vaule == target {
            if before < target {
                return mid
            } else if before == target {
                return mid - 2
            }
        }
        
        if vaule > target {
            if before < target {
                return mid
            } else if before == target {
                return mid - 1
            } else {
                height = mid - 1
            }
        }
        
        if vaule < target {
            if after > target {
                return mid + 1
            } else if after == target {
                return mid + 1
            } else {
                low = mid + 1
            }
        }
        mid = (low + height) / 2
    }
    return 0;
}


let testnums = [3,6,7,8,10]
let result = searchInsert(testnums, 5)

