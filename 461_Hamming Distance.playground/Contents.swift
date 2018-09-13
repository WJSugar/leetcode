//: Playground - noun: a place where people can play

import UIKit

/*
 两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。
 
 给出两个整数 x 和 y，计算它们之间的汉明距离。
 
 注意：
 0 ≤ x, y < 231.
 
 示例:
 
 输入: x = 1, y = 4
 
 输出: 2
 
 解释:
 1   (0 0 0 1)
 4   (0 1 0 0)
 ↑   ↑
 
 上面的箭头指出了对应二进制位不同的位置。

 */

//my solution

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    let xs = getBinaryArray(x)
    let ys = getBinaryArray(y)
    
    if xs.count > ys.count {
        return diffCount(ys, xs)
    } else {
        return diffCount(xs, ys)
    }
}

func diffCount(_ nums: [Int], _ largeNums: [Int]) -> Int {
    var count = 0
    for index in 0..<largeNums.count {
        var x = 0
        let y = largeNums[index]
        
        if index < nums.count {
            x = nums[index]
        }
        
        if x != y {
            count += 1
        }
    }
    return count
}

func getBinaryArray(_ num: Int) -> [Int] {
    var quotient = num
    var reminders = [Int]()
    while quotient != 0 {
        reminders.append(quotient & 1)
        quotient = quotient >> 1
    }
    reminders.append(quotient)
    return reminders
}

//better solution
func hammingDistance_better(_ x: Int, _ y: Int) -> Int {
    var tmp = x ^ y
    var count = 0
    while(tmp != 0) {
        if (tmp & 1) == 1 {
            count += 1
        }
        tmp = tmp >> 1
    }
    return count
}

