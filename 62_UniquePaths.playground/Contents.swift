//: Playground - noun: a place where people can play

import UIKit

let img = UIImage(named: "robot_maze");
let imageView = UIImageView(image: img)
imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

/*
 一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
 
 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
 
 问总共有多少条不同的路径？
 
 
 
 例如，上图是一个7 x 3 的网格。有多少可能的路径？
 
 说明：m 和 n 的值均不超过 100。
 
 示例 1:
 
 输入: m = 3, n = 2
 输出: 3
 解释:
 从左上角开始，总共有 3 条路径可以到达右下角。
 1. 向右 -> 向右 -> 向下
 2. 向右 -> 向下 -> 向右
 3. 向下 -> 向右 -> 向右
 示例 2:
 
 输入: m = 7, n = 3
 输出: 28
 */

// my solution
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var rows = Array(repeating: 0, count: m)
    var res = Array(repeating: rows, count: n)
    
    for i in 0..<res[0].count {
        res[0][i] = 1;
    }
    
    for i in 0..<res.count {
        res[i][0] = 1
    }
    
    for row in 1..<n {
        for col in 1..<m {
            res[row][col] = res[row - 1][col] + res[row][col - 1]
        }
    }
    
    return res[n - 1][m - 1]
}

//better solution
func uniquePaths_better(_ m: Int, _ n: Int) -> Int {
    if m <= 0 || n <= 0 {
        return 0
    }
    var nums = [[Int]]()
    for _ in 1...m {
        var row = [Int]()
        for _ in 1...n {
            row.append(0)
        }
        nums.append(row)
    }
    
    for i in 0...m-1 {
        for j in 0...n-1{
            if i == 0 || j == 0{
                nums[i][j] = 1
            }else{
                nums[i][j] = nums[i-1][j] + nums[i][j-1]
            }
        }
    }
    return nums[m-1][n-1]
}
