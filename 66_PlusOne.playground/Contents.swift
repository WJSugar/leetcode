import UIKit

/*
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 
 最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
 
 你可以假设除了整数 0 之外，这个整数不会以零开头。
 
 示例 1:
 
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 示例 2:
 
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
 */
// my solution
func plusOne(_ digits: [Int]) -> [Int] {
    var res = digits;
    var last = digits.count - 1
    var sum = digits[last] + 1
    
    if sum <= 9 {
        res[last] = sum
    }
    
    while sum > 9 {
        res[last] = sum - 10
        if last - 1 >= 0 {
            last -= 1
            sum -= 10;
            sum = digits[last] + 1
            if sum < 10 {
                res[last] = sum
            }
        } else {
            res.insert(1, at: 0)
            sum = 1
        }
    }
    return res
}

//better solution
func plusOne_better(_ digits: [Int]) -> [Int] {
    var arr = digits
    var carry = 1
    var temp = 0
    let count = digits.count
    for (i, item) in digits.reversed().enumerated() {
        if carry == 0 {
            return arr
        }
        temp = item + carry
        carry = temp / 10
        arr[count - i - 1] = temp % 10
    }
    
    if carry != 0 {
        arr.insert(1, at: 0)
        return arr
    }
    return arr
}
