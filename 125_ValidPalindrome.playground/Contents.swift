import UIKit

/*
 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 
 说明：本题中，我们将空字符串定义为有效的回文串。
 
 示例 1:
 
 输入: "A man, a plan, a canal: Panama"
 输出: true
 示例 2:
 
 输入: "race a car"
 输出: false
 */

// my solution
func isPalindrome(_ s: String) -> Bool {
    if s.isEmpty == true {
        return true
    }
    var strValues = [Int]()
    for scalar in s.lowercased().unicodeScalars {
        strValues.append(Int(scalar.value))
    }
    
    var head = 0
    var tail = s.count - 1
    while head <= tail {
        let header = strValues[head]
        let tailer = strValues[tail]
        if isValidCharacter(header) && isValidCharacter(tailer) {
            if header == tailer {
                head += 1
                tail -= 1
            } else {
                return false
            }
        } else if isValidCharacter(header) {
            tail -= 1
        } else {
            head += 1
        }
    }
    return true
}

func isValidCharacter(_ c: Int) -> Bool {
    if    (48 <= c && c < 58)
        || (97 <= c && c < 123) {
        return true
    } else {
        return false
    }
}

//better solution
func isPalindrome_better(_ s: String) -> Bool {
    
    let lowerS = s.lowercased()
    var ints = [UInt32]()
    for scalars in lowerS.unicodeScalars {
        ints.append(scalars.value)
    }
    var i = 0
    var j = ints.count - 1
    
    while i < j {
        if !isCharOrNumber(ints[i]) {
            i += 1
        }else if !isCharOrNumber(ints[j]) {
            j -= 1
        }else if ints[i] != ints[j] {
            return false
        }else {
            i += 1
            j -= 1
        }
    }
    return true
    
}

func isCharOrNumber(_ character: UInt32) -> Bool {
    if character >= 97 && character <= 122 {
        return true
    }
    
    if character >= 48 && character <= 57 {
        return true
    }
    return false
}

