import UIKit

/*
 给定两个数组，编写一个函数来计算它们的交集。
 
 示例 1:
 
 输入: nums1 = [1,2,2,1], nums2 = [2,2]
 输出: [2,2]
 示例 2:
 
 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 输出: [4,9]
 说明：
 
 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
 我们可以不考虑输出结果的顺序。
 进阶:
 
 如果给定的数组已经排好序呢？你将如何优化你的算法？
 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
 如果 nums2 的元素存储在磁盘上，磁盘内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
 */

// my solution
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    if nums1.count > nums2.count {
        return sub_intersect(nums2, nums1);
    } else {
        return sub_intersect(nums1, nums2);
    }
}

func sub_intersect(_ nums: [Int], _ largerNums: [Int]) -> [Int] {
    var res = [Int]()
    var map = [Int: Int]()
    
    for i in 0..<nums.count {
        let val = nums[i];
        
        if map.keys.contains(val) == false {
            map.updateValue(1, forKey: val)
        }
        
        if largerNums.contains(val) {
            if map.keys.contains(val) {
                var count = map[val]
                var tempCount = 0;
                for j in 0..<largerNums.count {
                    if val == largerNums[j] {
                        tempCount += 1
                        if tempCount == count {
                            res.append(val)
                            map[val] = (map[val] ?? 0 ) + 1
                            break;
                        }
                    }
                }
            }
        }
    }
    return res
}

// better solution
func intersect_better(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var dic = [Int:Int]()
    for value in nums1 {
        dic[value] = (dic[value] ?? 0 ) + 1
    }
    var result = [Int]()
    for value in nums2 {
        let value1 = dic[value]
        if(value1 == nil){ continue }
        let count = value1! - 1
        if(count >= 0){
            dic[value] = count
            result.append(value)
        }
    }
    return result
}
