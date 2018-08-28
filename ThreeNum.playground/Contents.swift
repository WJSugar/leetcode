//: Playground - noun: a place where people can play

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var map = [Int: Int]();
    for i in 0..<nums.count {
        if map.values.contains(nums[i]) == true {
            nums.remove(at: i)
        } else {
            map.updateValue(nums[i], forKey: i)
        }
    }
    return map.keys.count
}

var nums = [0,0,1,1,1,2,2,3,3,4]
let result = removeDuplicates(&nums)

//func threeSum(_ nums: [Int]) -> [[Int]] {
//    var result = Array<Array<Int>>()
//    for i in 0..<nums.count {
//        let num1 = nums[i]
//        for j in 0..<nums.count {
//            let num2 = nums[j]
//            if i != j {
//                for k in 0..<nums.count {
//                    let num3 = nums[k]
//                    if  j != k {
//                        if num1 + num2 + num3 == 0 {
//                            result.append([num1, num2, num3])
//                        }
//                    }
//                }
//            }
//        }
//    }
//    return result
//}
//
//let num = [-1, 0, 1, 2, -1, -4]
//let r = threeSum(num)
//print(r)
