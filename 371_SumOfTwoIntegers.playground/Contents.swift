//: Playground - noun: a place where people can play

import UIKit

/*
 不使用运算符 + 和 - ​​​​​​​，计算两整数 ​​​​​​​a 、b ​​​​​​​之和。
 
 示例 1:
 
 输入: a = 1, b = 2
 输出: 3
 示例 2:
 
 输入: a = -2, b = 3
 输出: 1
 */
// my solution

func getSum(_ a: Int, _ b: Int) -> Int {
    
    if b == 0 {
        return a
    } else {
        return getSum(a ^ b, (a & b) << 1)
    }
}

// better solution
func getSum_better(_ a: Int, _ b: Int) -> Int {
    var num1 = a
    var num2 = b
    
    var sum = 0
    var carry = 0
    repeat {
        sum = num1 ^ num2
        carry = (num1 & num2) << 1
        
        num1 = sum
        num2 = carry
        
    } while(carry != 0)
    
    return sum
}

