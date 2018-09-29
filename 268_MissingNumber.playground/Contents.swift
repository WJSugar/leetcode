import UIKit


/*
 给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。
 
 示例 1:
 
 输入: [3,0,1]
 输出: 2
 示例 2:
 
 输入: [9,6,4,2,3,5,7,0,1]
 输出: 8
 
 说明:
 你的算法应具有线性时间复杂度。你能否仅使用额外常数空间来实现?
 */

// my solution
func missingNumber_one(_ nums: [Int]) -> Int {
    var arr = Array(repeating: 0, count: nums.count + 1);
    for i in 0..<nums.count {
        let val = nums[i]
        arr[val] = 1
    }
    
    for j in 0..<arr.count {
        if arr[j] == 0{
            return j
        }
    }
    return 0
}

func missingNumber_two(_ nums: [Int]) -> Int {
    let count = nums.count
    var sum = count + (count * (count - 1)) / 2
    
    for i in 0..<count {
        sum -= nums[i]
    }
    return sum
}

//better solution
func missingNumber_better(_ nums: [Int]) -> Int {
    var h = (nums.count+1)*nums.count/2
    for i in 0..<nums.count {
        h -= nums[i]
    }
    return h
}


