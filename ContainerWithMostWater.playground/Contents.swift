//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
/*
 给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 
 说明：你不能倾斜容器，且 n 的值至少为 2。
 
 
 
 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 示例:
 
 输入: [1,8,6,2,5,4,8,3,7]
 输出: 49
 */
let image = UIImage(named: "question_11.jpg")
let imageView = UIImageView(image: image)
imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

// my solution
func maxArea(_ height: [Int]) -> Int {
    if height.count < 2 {
        return 0;
    }
    var area = 0;
    var lastIndex = 0;
    for i in 0..<height.count {
        for j in (lastIndex)..<height.count {
            let maxs = (height.count - 1 - j) - i;
            if maxs < 0 {
                break;
            }
            let left = height[i]
            let right = height[height.count - 1 - j]
            let mins = left < right ? left : right;
            let temp = mins * maxs
            if temp > area {
                area = temp
            }
            if left > right {
                lastIndex = j
                continue;
            } else {
                break;
            }
        }
    }
    return area
}
let data = [1,8,6,2,5,4,8,3,7]
let test = maxArea(data);


func maxArea1(_ height: [Int]) -> Int {
    var result = 0
    
    var left = 0;
    var right = height.count - 1;
    
    while left < right {
        var valleft = height[left]
        var valright = height[right]
        let area = (valleft > valright ? valright : valleft) * (right - left)
        
        if area > result {
            result = area
        }
        
        if valleft > valright {
            right -= 1
        } else {
            left += 1
        }
    }
    return result
}

let testa = maxArea1(data);

