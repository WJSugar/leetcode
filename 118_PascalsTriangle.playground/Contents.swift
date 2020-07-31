//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
 
 在杨辉三角中，每个数是它左上方和右上方的数的和。
 
 示例:
 
 输入: 5
 输出:
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
 ]
 */

func generate(_ numRows: Int) -> [[Int]] {
    var result = [[Int]]()
    
    if numRows == 1 {
        return [[1]]
    }
    
    if numRows == 2 {
        return [[1], [1, 1]]
    }
    
    for i in 0..<numRows {
        var array = Array.init(repeating: 1, count: i + 1)
        if i > 1 {
            var temp = result[i - 1];
            for j in 0..<temp.count - 1{
                let val1 = temp[j];
                let val2 = temp[j + 1]
                
                array[j + 1] = val1 + val2;
            }
        }
        result.append(array)
    }
    return result;
}
