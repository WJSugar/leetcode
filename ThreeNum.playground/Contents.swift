//: Playground - noun: a place where people can play

import Foundation

/*
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */
func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    let nums = nums.sorted()
    var result = [[Int]]();
    var allZero = true;
    for i in nums {
        if i != 0 {
            allZero = false
            break;
        }
    }
    if allZero == true {
        return [[0, 0, 0]]
    }
    
    var lastNum: Int?
    
    for i in 0..<nums.count {
        let val = nums[i]
        if val > 0 {
            break;
        }
        if lastNum != nil {
            if lastNum! == val {
                continue;
            } else {
                lastNum = val
            }
        } else {
            lastNum = val;
        }
        
        let delta = 0 - val
        var low = i + 1;
        var high = nums.count - 1;
        
        
        while low < high {
            let lowVal = nums[low]
            if i + 1 != low {
                if low > 1 {
                    if nums[low - 1] == lowVal {
                        low += 1
                        continue
                    }
                }
            }
            
            let highVal = nums[high]
            if delta == (lowVal + highVal) {
                result.append([val, lowVal, highVal])
                low += 1
                high -= 1
            } else if delta < (lowVal + highVal) {
                if delta < lowVal + nums[low + 1] {
                    break;
                }
                high -= 1
            } else {
                if nums[high - 1] + nums[high] < delta {
                    break;
                }
                low += 1
            }
        }
    }
    return result;
}

let num = [-1, 0, 1, 2, -1, -4]
let r = threeSum(num)
print(r)
