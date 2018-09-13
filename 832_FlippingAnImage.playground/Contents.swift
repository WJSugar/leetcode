//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个二进制矩阵 A，我们想先水平翻转图像，然后反转图像并返回结果。
 
 水平翻转图片就是将图片的每一行都进行翻转，即逆序。例如，水平翻转 [1, 1, 0] 的结果是 [0, 1, 1]。
 
 反转图片的意思是图片中的 0 全部被 1 替换， 1 全部被 0 替换。例如，反转 [0, 1, 1] 的结果是 [1, 0, 0]。
 
 示例 1:
 
 输入: [[1,1,0],[1,0,1],[0,0,0]]
 输出: [[1,0,0],[0,1,0],[1,1,1]]
 解释: 首先翻转每一行: [[0,1,1],[1,0,1],[0,0,0]]；
 然后反转图片: [[1,0,0],[0,1,0],[1,1,1]]
 示例 2:
 
 输入: [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]
 输出: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 解释: 首先翻转每一行: [[0,0,1,1],[1,0,0,1],[1,1,1,0],[0,1,0,1]]；
 然后反转图片: [[1,1,0,0],[0,1,1,0],[0,0,0,1],[1,0,1,0]]
 说明:
 
 1 <= A.length = A[0].length <= 20
 0 <= A[i][j] <= 1

 */

// my solution
func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var nums = A
    for i in 0..<nums.count {
        for j in 0..<nums[i].count {
            let count = nums[j].count - 1
            if j <= count - j {
                let temp = nums[i][j]
                let temp1 = nums[i][count - j]
                
                if temp == 1 {
                    nums[i][count - j] = temp - 1
                } else {
                    nums[i][count - j] = temp + 1
                }
                
                if temp1 == 1 {
                    nums[i][j] = temp1 - 1
                } else {
                    nums[i][j] = temp1 + 1
                }
            }
        }
    }
    return nums
}

//better solution

func flipAndInvertImage_better(_ A: [[Int]]) -> [[Int]] {
    var newA = A
    
    let r = A.count
    let c = A[0].count
    for i in 0..<r {
        for j in 0..<(c/2) {
            let tmp = (newA[i][j] + 1) % 2
            newA[i][j] = (newA[i][c - j - 1] + 1) % 2
            newA[i][c - j - 1] = tmp
        }
        if c & 1 == 1 {
            newA[i][c/2] = (newA[i][c/2] + 1) % 2
        }
    }
    
    return newA
}
}
