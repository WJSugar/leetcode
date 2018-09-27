import UIKit

/*
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 
 说明:
 
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 示例:
 
 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 输出: [1,2,2,3,5,6]
 */
// my low solution
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    if m == 0 {
        nums1.insert(contentsOf: nums2, at: 0)
        return
    }
    if n == 0 {
        return
    }
    let num1MaxValue = nums1[m - 1]
    let num2MinValue = nums2.first!
    
    //s1
    if num1MaxValue < num2MinValue {
        nums1.insert(contentsOf: nums2, at: m)
        return
    }
    //s2
    let num1MinValue = nums1.first!
    let num2MaxValue = nums2[n - 1]
    if num2MaxValue < num1MinValue {
        nums1.insert(contentsOf: nums2, at: 0)
        return
    }
    
    var map = [Int: Int]()
    var mm = m;
    var count = 0;
    
    for i in 0..<nums2.count {
        if count == nums2.count {
            return;
        }
        let val = nums2[i]
        foo(&nums1, &mm, nums2, &count, val, &map)
    }
    
}

func foo(_ nums1: inout [Int], _ m: inout Int, _ nums2: [Int], _ count: inout Int, _ target: Int, _ map:inout [Int: Int]) {
    var index = -1
    if map.keys.contains(target) == true {
        index = map[target]!
    } else {
        let tempArr = Array(nums1[0..<m])
        if tempArr.contains(target) {
            index = binarySearchIndexOf(target, tempArr)
        } else {
            let num1MaxValue = nums1[m - 1]
            if target >= num1MaxValue {
                let subArray = nums2[count...nums2.count - 1];
                nums1.insert(contentsOf: subArray, at: m)
                count = nums2.count
                return
            } else {
                index = indexOf(target, nums1)
            }
        }
    }
    if index > -1 {
        insertInto(&nums1, index, target)
        map.updateValue(index + 1, forKey:target)
        m += 1
        count += 1
    }
}

func binarySearchIndexOf(_ target: Int, _ nums: [Int]) -> Int {
    var low = 0
    var high = nums.count - 1
    var mid = (low + high) / 2
    while low <= high {
        let val = nums[mid]
        
        if val == target {
            for i in 0..<nums.count - mid {
                let temp = nums[mid + i]
                if mid + i == nums.count - 1 {
                    return mid;
                }
                if temp != val {
                    return mid + i
                }
            }
        } else if val < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
        
        mid = (low + high) / 2
    }
    return mid;
}

func indexOf(_ target: Int, _ nums: [Int]) -> Int {
    var index = 0
    for i in 0..<nums.count {
        let val = nums[i]
        index = i
        if val > target {
            break;
        }
    }
    return index
}

func insertInto(_ nums: inout [Int], _ index: Int, _ num: Int) {
    nums.insert(num, at: index)
}

//better solution
func merge_better(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var i = m - 1
    var j = n - 1
    
    for index in (0..<m + n).reversed() {
        if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
            nums1[index] = nums1[i]
            i -= 1
        } else {
            nums1[index] = nums2[j]
            j -= 1
        }
    }
}
