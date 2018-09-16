//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。
 
 示例 1:
 
 输入: "Let's take LeetCode contest"
 输出: "s'teL ekat edoCteeL tsetnoc"
 注意：在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。

 */
//

// my solution
func reverseWords(_ s: String) -> String {
    var string = s.components(separatedBy: " ")
    var temp = [String]()
    for index in 0..<string.count {
        let str = string[index]
        let a = String(str.reversed())
        temp.append(a)
    }
    
    let result = temp.joined(separator: " ")
    return result;
}

//better solution
func reverseWords_better(_ s: String) -> String {
    var strs = ""
    for str in s.components(separatedBy: " ") {
        strs.append(String(str.reversed()))
        strs.append(" ")
    }
    strs.removeLast()
    return strs
}

