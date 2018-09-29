import UIKit

/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 
 有效字符串需满足：
 
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 示例 1:
 
 输入: "()"
 输出: true
 示例 2:
 
 输入: "()[]{}"
 输出: true
 示例 3:
 
 输入: "(]"
 输出: false
 示例 4:
 
 输入: "([)]"
 输出: false
 示例 5:
 
 输入: "{[]}"
 输出: true
 */

// my solution
func isValid(_ s: String) -> Bool {
    
    let strs = [Character](s)
    var stack = [Character]()
    var map = ["(" : ")", "[" : "]", "{" : "}"]
    
    for i in 0..<strs.count {
        let str = strs[i]
        if stack.count > 0 {
            let first = stack.last!
            let val = map[String(first)]
            if String(str) == val {
                stack.remove(at: stack.count - 1)
            } else {
                stack.append(str)
            }
        } else {
            if map.keys.contains(String(str)) == false {
                return false
            }
            stack.append(str)
        }
    }
    if stack.count == 0 {
        return true
    } else {
        return false
    }
}


// better solution

func isValid_better(_ s: String) -> Bool {
    var list = [Character]()
    for c in s {
        if c == "(" || c == "{" || c == "[" {
            list.append(c)
        } else {
            let last = list.popLast()
            if c == ")" && last != "(" {
                return false
            }
            if c == "}" && last != "{" {
                return false
            }
            if c == "]" && last != "[" {
                return false
            }
        }
    }
    return list.isEmpty
}

