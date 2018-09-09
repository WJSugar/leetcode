//: Playground - noun: a place where people can play

import UIKit

/*
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 
 说明：解集不能包含重复的子集。
 
 示例:
 
 输入: nums = [1,2,3]
 输出:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 */

//my recursive solution

func subsets(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    rec_subset([Int](), nums, &res)
    res.append([Int]())
    return res
}

func rec_subset(_ firstNums: [Int], _ restNum: [Int], _ res: inout [[Int]]) {
    if restNum.count == 0 {
        if firstNums.count != 0 {
            res.append(firstNums)
        }
        return
    }
    
    var tempRestNums = restNum;
    var tempFirstNums  = firstNums;
    let firstVal = tempRestNums.remove(at: 0)
    tempFirstNums.append(firstVal)
    rec_subset(tempFirstNums, tempRestNums, &res)
    
    var zeroFirstNums = firstNums;
    rec_subset(zeroFirstNums, tempRestNums, &res)
}

//better solution
func subsets_better(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]()]
    
    for num in nums {
        res = foo(res, num)
    }
    return res
}

func foo(_ array: [[Int]], _ curNum: Int) ->  [[Int]] {
    var res = array
    for arr in array {
        var temp = arr
        temp.append(curNum)
        res.append(temp)
    }
    return res
}

