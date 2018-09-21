//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 
 说明：每次只能向下或者向右移动一步。
 
 示例:
 
 输入:
 [
 [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 输出: 7
 解释: 因为路径 1→3→1→1→1 的总和最小。
 */
// my solution
func minPathSum(_ grid: [[Int]]) -> Int {
    var rows = Array.init(repeating: 0, count: grid[0].count)
    var result = Array.init(repeating: rows, count: grid.count)
    
    result[0][0] = grid[0][0]
    
    for i in 1..<grid.count {
        result[i][0] = grid[i][0] + result[i - 1][0]
    }
    
    for i in 1..<grid[0].count {
        result[0][i] = grid[0][i] + result[0][i - 1]
    }
    
    for row in 1..<grid.count {
        for col in 1..<grid[row].count {
            let a = result[row - 1][col]
            let b = result[row][col - 1]
            
            result[row][col] = min(a, b) + grid[row][col]
        }
    }
    
    return result[grid.count - 1][grid[0].count - 1]
}

//recursive solution
func res(_ row:Int, _ col: Int, _ grid:[[Int]]) -> Int {
    if row == 0 && col == 0 {
        return grid[0][0]
    } else if row == 0 {
        return res(0, col - 1, grid) + grid[row][col]
    } else if col == 0{
        return res(row - 1, 0, grid) + grid[row][col]
    } else {
        let a = res(row - 1, col, grid);
        let b = res(row, col - 1, grid);
        return min(a, b) + grid[row][col]
    }
}

//better solution
func minPathSum_better(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else {
        return 0
    }
    var row = [Int].init(repeating: 0, count: grid[0].count+1)
    for i in 1..<row.count {
        row[i] = row[i-1] + grid[0][i-1]
    }
    
    for i in 1..<grid.count {
        row[1] = row[1] + grid[i][0]
        for j in 1..<grid[0].count {
            row[j+1] = row[j] > row[j+1] ? row[j+1] + grid[i][j] : row[j] + grid[i][j]
        }
    }
    let resultIndex = grid[0].count
    return row[resultIndex]
}

