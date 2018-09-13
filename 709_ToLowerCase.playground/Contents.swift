//: Playground - noun: a place where people can play

import UIKit

/*
 实现函数 ToLowerCase()，该函数接收一个字符串参数 str，并将该字符串中的大写字母转换成小写字母，之后返回新的字符串。
 
 
 
 示例 1：
 
 输入: "Hello"
 输出: "hello"
 示例 2：
 
 输入: "here"
 输出: "here"
 示例 3：
 
 输入: "LOVELY"
 输出: "lovely"
 */

func toLowerCase(_ str: String) -> String {
    var result = ""
    for ch in str.unicodeScalars {
        let value = ch.value
        
        if value <= 90 && value >= 65{
            let char = Character(UnicodeScalar(value + 32)!)
            result.append(char)
        } else {
            let originalCh = Character(UnicodeScalar(ch.value)!)
            result.append(originalCh)
        }
    }
    return result
}
