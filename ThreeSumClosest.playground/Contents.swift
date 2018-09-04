//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
 
 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
 */
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.count == 3 {
        return nums[0] + nums[1] + nums[2];
    }
    
    let newnums = nums.sorted()
    
    
    var minSum: Int?
    var result = 0;
    
    for i in 0..<newnums.count {
        let val = newnums[i]
        var low = i + 1;
        var high = newnums.count - 1
        
        while low < high {
            let lowVal = newnums[low]
            if i + 1 != low {
                if low > 1 {
                    if newnums[low - 1] == lowVal {
                        low += 1
                        continue
                    }
                }
            }
            
            let highVal = newnums[high]
            let res = val + lowVal + highVal
            
            if res == target {
                result = res;
                minSum = 0;
                break;
            } else if res < target {
                low += 1
                if minSum != nil {
                    if minSum! > (target - res) {
                        minSum = target - res
                        result = res
                    }
                } else {
                    minSum = target - res
                    result = res
                }
            } else {
                high -= 1
                if minSum != nil {
                    if minSum! > (res - target) {
                        minSum = res - target
                        result = res
                    }
                } else {
                    minSum = res - target
                    result = res
                }
            }
        }
    }
    return result;
}
