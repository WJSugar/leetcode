import UIKit

/*
 给定一个非负整数数组 A，返回一个由 A 的所有偶数元素组成的数组，后面跟 A 的所有奇数元素。
 
 你可以返回满足此条件的任何数组作为答案。
 */
//better solution
func better_sortArrayByParity(_ A: [Int]) -> [Int] {
    var A = A
    var left = 0
    var right = 0
    let count = A.count
    while right < count {
        if A[right] & 1 == 0 { // 偶数
            if left != right {
                A[left] ^= A[right]
                A[right] = A[left] ^ A[right]
                A[left] ^= A[right]
            }
            left += 1
        }
        right += 1
    }
    return A
}

//my solution
func sortArrayByParity(_ A: [Int]) -> [Int] {
    var array = A;
    var i = 0;
    var j = array.count - 1;
    
    while i < j {
        
        let head = array[i];
        let tail = array[j];
        
        let isHeadEven = isEven(head)
        let isTailEven = isEven(tail)
        
        if isHeadEven == false {
            if isTailEven { //交换
                let temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            } else { //
                j -= 1;
            }
        } else {
            i += 1;
        }
    }
    return array;
}

func isEven(_ num: Int) -> Bool {
    if num % 2 == 1 {
        return false
    } else {
        return true
    }
}
