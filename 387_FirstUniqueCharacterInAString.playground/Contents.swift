import UIKit

/*
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
 
 案例:
 
 s = "leetcode"
 返回 0.
 
 s = "loveleetcode",
 返回 2.
 
 
 注意事项：您可以假定该字符串只包含小写字母。
 */

//my solution
func firstUniqChar(_ s: String) -> Int {
    if s.count < 1 {
        return -1
    }
    let strs = [Character](s)
    var map = [Character: Int]()
    var indexMap = [Character: Int]()
    for i in 0..<strs.count {
        let str = strs[i]
        if map.keys.contains(str) == false {
            map.updateValue(1, forKey: str)
            indexMap.updateValue(i, forKey: str)
        } else {
            map[str]! += 1
        }
    }
    if map.values.contains(1) == false {
        return -1
    }
    
    var m = strs.count - 1
    for (key, value) in map {
        if value == 1 {
            m = min(m, indexMap[key]!)
        }
    }
    return m
}


//better solution
func firstUniqChar_better(_ str: String) -> Int {
    
    guard !str.isEmpty else {
        
        return -1
    }
    
    var values = Array(repeating: -1, count: 26)
    
    let a = 97
    
    var i = 0
    
    for j in str.unicodeScalars {
        
        let diff = Int(Int(j.value) - a)
        
        if values[diff] == -2 {
            
            i += 1
            
            continue
        }
        
        if values[diff] == -1 {
            
            values[diff] = i
        }
        else {
            
            values[diff] = -2
        }
        
        i += 1
    }
    
    var minIndex = Int.max
    
    for value in values {
        
        if value == -2 || value == -1 {
            
            continue
        }
        
        minIndex = min(minIndex, value)
    }
    
    if minIndex == Int.max {
        
        return -1
    }
    
    return minIndex
}

