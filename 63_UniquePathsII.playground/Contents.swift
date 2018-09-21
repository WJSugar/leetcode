//: Playground - noun: a place where people can play

import UIKit

/*
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 
 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 
 现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
 
 
 
 网格中的障碍物和空位置分别用 1 和 0 来表示。
 
 说明：m 和 n 的值均不超过 100。
 
 示例 1:
 
 输入:
 [
 [0,0,0],
 [0,1,0],
 [0,0,0]
 ]
 输出: 2
 解释:
 3x3 网格的正中间有一个障碍物。
 从左上角到右下角一共有 2 条不同的路径：
 1. 向右 -> 向右 -> 向下 -> 向下
 2. 向下 -> 向下 -> 向右 -> 向右
 */
//my solution
func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
    if obstacleGrid[0].count == 1 && obstacleGrid[0][0] == 0 && obstacleGrid.count == 1 {
        return 1
    }
    
    var rows = Array(repeating: 0, count: obstacleGrid[0].count)
    var res = Array(repeating: rows, count: obstacleGrid.count)
    
    //填充首行
    var hasChange = false
    for i in 0..<res[0].count {
        let val = obstacleGrid[0][i];
        if val == 1 {
            hasChange = true
        }
        
        if hasChange == true {
            res[0][i] = 0
        } else {
            res[0][i] = 1;
        }
    }
    
    //填充首列
    hasChange = false
    for i in 0..<res.count {
        let val = obstacleGrid[i][0];
        if val == 1 {
            hasChange = true
        }
        
        if hasChange == true {
            res[i][0] = 0
        } else {
            res[i][0] = 1;
        }
    }
    
    for row in 1..<obstacleGrid.count {
        for col in 1..<obstacleGrid[row].count {
            let val = obstacleGrid[row][col]
            res[row][col] = res[row - 1][col] + res[row][col - 1]
            
            if val == 1 {
                res[row][col] = 0
            }
        }
    }
    return res[obstacleGrid.count - 1][obstacleGrid[0].count - 1]
}


//better solution
func uniquePathsWithObstacles_better(_ obstacleGrid: [[Int]]) -> Int {
    let m = obstacleGrid.count
    let n = obstacleGrid[0].count
    
    guard obstacleGrid[m-1][n-1] == 0 else {
        return 0
    }
    
    var res = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
    
    for i in stride(from: m-1, to: -1, by: -1) {
        for k in stride(from: n-1, to: -1, by: -1) {
            
            if i == m-1 && k == n-1 {
                res[i][k] = 1
                continue
            }
            
            if obstacleGrid[i][k] == 0 {
                if i == m-1 {
                    res[i][k] = res[i][k+1]
                }
                else if k == n-1 {
                    res[i][k] = res[i+1][k]
                }
                else {
                    res[i][k] = res[i+1][k] + res[i][k+1]
                }
            }
        }
    }
    
    return res[0][0]
}

