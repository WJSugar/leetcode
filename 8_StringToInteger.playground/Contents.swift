import UIKit

/*
 实现 atoi，将字符串转为整数。
 
 该函数首先根据需要丢弃任意多的空格字符，直到找到第一个非空格字符为止。如果第一个非空字符是正号或负号，选取该符号，并将其与后面尽可能多的连续的数字组合起来，这部分字符即为整数的值。如果第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。
 
 字符串可以在形成整数的字符后面包括多余的字符，这些字符可以被忽略，它们对于函数没有影响。
 
 当字符串中的第一个非空字符序列不是个有效的整数；或字符串为空；或字符串仅包含空白字符时，则不进行转换。
 
 若函数不能执行有效的转换，返回 0。
 
 说明：
 
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。如果数值超过可表示的范围，则返回  INT_MAX (231 − 1) 或 INT_MIN (−231) 。
 
 示例 1:
 
 输入: "42"
 输出: 42
 示例 2:
 
 输入: "   -42"
 输出: -42
 解释: 第一个非空白字符为 '-', 它是一个负号。
 我们尽可能将负号与后面所有连续出现的数字组合起来，最后得到 -42 。
 示例 3:
 
 输入: "4193 with words"
 输出: 4193
 解释: 转换截止于数字 '3' ，因为它的下一个字符不为数字。
 示例 4:
 
 输入: "words and 987"
 输出: 0
 解释: 第一个非空字符是 'w', 但它不是数字或正、负号。
 因此无法执行有效的转换。
 示例 5:
 
 输入: "-91283472332"
 输出: -2147483648
 解释: 数字 "-91283472332" 超过 32 位有符号整数范围。
 因此返回 INT_MIN (−231) 。
 */

//my low solution
func myAtoi(_ str: String) -> Int {
    
    var strs = [Character]()
    var count = 0
    for scalars in str.unicodeScalars {
        if 48 <= scalars.value && scalars.value < 58 {
            let foo = UnicodeScalar(scalars.value)
            strs.append(Character(foo!))
        } else if scalars.value == 45 || scalars.value == 43 {
            if strs.count == 0 {
                let foo = UnicodeScalar(scalars.value)
                strs.append(Character(foo!))
            } else {
                break;
            }
        } else if scalars.value == 32 {
            if strs.count > 0 {
                break;
            }
        } else {
            if count == 0 {
                return 0
            }
            break;
        }
        count += 1
    }
    let temp = String(strs)
    let res = Double(temp) ?? 0
    
    if res < Double(Int32.min) {
        return Int(Int32.min)
    } else if res > Double(Int32.max) {
        return Int(Int32.max)
    } else {
        return Int(temp) ?? 0
    }
}


//better solution
func myAtoi_better(_ str: String) -> Int {
    if str.isEmpty {
        return 0
    }
    
    let ＋: Int8 = 43
    let －: Int8 = 45
    let ascii0: Int8 = 48
    let ascii9: Int8 = 57
    let space: Int8 = 32
    
    
    var sign: Int = 1
    
    var result: Int = 0
    
    let chars = str.utf8CString
    
    var i: Int = 0
    
    while chars[i] == space {
        i += 1
    }
    
    if chars[i] == ＋ || chars[i] == － {
        sign = chars[i] == － ? -1 : 1
        i += 1
    }
    
    while i < chars.count - 1, ascii0...ascii9 ~= chars[i] {
        
        if result > Int32.max / 10 || (result == Int32.max / 10 && Int(chars[i] - ascii0) > 7) {
            return sign == 1 ? Int(Int32.max) : Int(Int32.min)
        }
        
        result = result * 10 +  Int(chars[i] - ascii0)
        i += 1
    }
    
    return result * sign
}
