import UIKit
/*
 给定一个非负整数 num，反复将各个位上的数字相加，直到结果为一位数。
 */
// my solution
func addDigits(_ num: Int) -> Int {
    if num / 10 == 0 {
        return num
    }
    return 1 + ((num - 1) % 9)
}

// better
func better_addDigits(_ num: Int) -> Int {
    if num/10 == 0 {
        return num
    }
    var result = 0
    var n = num
    while n != 0 {
        result += n%10
        n /= 10
    }
    return better_addDigits(result)
}
