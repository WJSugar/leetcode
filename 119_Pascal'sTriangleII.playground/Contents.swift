import UIKit

/*
 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
 
 
 
 在杨辉三角中，每个数是它左上方和右上方的数的和。
 
 示例:
 
 输入: 3
 输出: [1,3,3,1]
 进阶：
 
 你可以优化你的算法到 O(k) 空间复杂度吗？
 */

//my solution
func getRow(_ rowIndex: Int) -> [Int] {
    var result = [[Int]]()
    for i in 0..<rowIndex + 1 {
        var array = Array.init(repeating: 1, count: i + 1)
        if i > 1 {
            var temp = result[i - 1];
            for j in 0..<(temp.count) / 2 {
                let val1 = temp[j];
                let val2 = temp[j + 1]
                
                array[j + 1] = val1 + val2;
                array[temp.count - j - 1] = val1 + val2;
            }
        }
        result.append(array)
    }
    return result[rowIndex];
}

// recursive method
func getRow_rec(_ rowIndex: Int) -> [Int] {
    if rowIndex == 0 {
        return [1]
    }
    
    if rowIndex == 1 {
        return [1, 1]
    }
    
    var result = [1]
    var lastRow = getRow(rowIndex - 1)
    for i in 0..<lastRow.count - 1 {
        result.append(lastRow[i] + lastRow[i + 1])
    }
    result.append(1)
    return result
}
