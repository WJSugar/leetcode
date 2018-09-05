//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个矩阵 A， 返回 A 的转置矩阵。
 
 矩阵的转置是指将矩阵的主对角线翻转，交换矩阵的行索引与列索引。
 
 
 
 示例 1：
 
 输入：[[1,2,3],[4,5,6],[7,8,9]]
 输出：[[1,4,7],[2,5,8],[3,6,9]]
 示例 2：
 
 输入：[[1,2,3],[4,5,6]]
 输出：[[1,4],[2,5],[3,6]]
 */
func transpose(_ A: [[Int]]) -> [[Int]] {
    var temp = [Int].init(repeating: 0, count: A.count)
    var result = [[Int]].init(repeating: temp, count: A[0].count);
    
    for i in 0..<A.count {
        for j in 0..<A[i].count {
            result[j][i] = A[i][j]
        }
    }
    return result
}
