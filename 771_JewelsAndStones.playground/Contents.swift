//: Playground - noun: a place where people can play

import UIKit

/*
 
 给定字符串J 代表石头中宝石的类型，和字符串 S代表你拥有的石头。 S 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。
 
 J 中的字母不重复，J 和 S中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。
 
 示例 1:
 
 输入: J = "aA", S = "aAAbbbb"
 输出: 3
 示例 2:
 
 输入: J = "z", S = "ZZ"
 输出: 0
 注意:
 
 S 和 J 最多含有50个字母。
 J 中的字符不重复。
 */

//my solution
func numJewelsInStones(_ J: String, _ S: String) -> Int {
    let map = getCharacterMap(J)
    let chars = [Character](S)
    
    var count = 0
    for index in 0..<chars.count {
        let ch = chars[index]
        if map.keys.contains(ch) == true {
            count += 1
        }
    }
    return count
}

func getCharacterMap(_ str: String) -> [Character: Character] {
    var map = [Character: Character]()
    for ch in str {
        map.updateValue(ch, forKey:ch)
    }
    return map
}

//better solution
func numJewelsInStones_better (_ J: String, _ S: String) -> Int {
    var map = [Character: Int]()
    
    let chs = [Character](J)
    let chars = [Character](S)

    for ch in 0..<chs.count {
        let char = chs[ch]
        map[char] = 0
    }
    
    for index in 0..<chars.count {
        let char = chars[index]
        if let value = map[char] {
            map[char] = value + 1
        }
    }
    return map.values.reduce(0) {$0 + $1};
}
