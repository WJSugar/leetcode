//: Playground - noun: a place where people can play

import UIKit

/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 注意：给定 n 是一个正整数。
 
 示例 1：
 
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：
 
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 */

// my solution
func climbStairs(_ n: Int) -> Int {
    if n == 1 || n == 2 {
        return n
    }
    var stairs = Array.init(repeating: 0, count: n + 1)
    
    stairs[0] = 0
    stairs[1] = 1
    stairs[2] = 2
    
    for i in 3...n {
        stairs[i] = stairs[i - 1] + stairs[i - 2]
    }
    
    return stairs[n];
}

// better solution
func climbStairs(_ n: Int) -> Int {
    if n < 3 {
        return n
    }
    
    var a = 1
    var b = 2
    var res = 0
    
    for _ in 2..<n {
        res = a + b
        a = b
        b = res
    }
    
    return res
}


