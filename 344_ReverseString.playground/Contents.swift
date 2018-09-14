//: Playground - noun: a place where people can play

import UIKit

/*
 编写一个函数，其作用是将输入的字符串反转过来。
 
 示例 1:
 
 输入: "hello"
 输出: "olleh"
 示例 2:
 
 输入: "A man, a plan, a canal: Panama"
 输出: "amanaP :lanac a ,nalp a ,nam A"
 */
//my solution
func reverseString(_ s: String) -> String {
    var temp = [Character](s)
    temp.reverse()
    return String(temp)
}


//better solution
func reverseString_better(_ s: String) -> String{
    var startIndex = 0
    var endIndex = s.count-1
    var array = s.cString(using:.utf8)!
    while startIndex<endIndex {
        let char = array[startIndex]
        array[startIndex] = array[endIndex]
        array[endIndex] = char
        startIndex+=1
        endIndex-=1
    }
    return String.init(utf8String: array)!
}

