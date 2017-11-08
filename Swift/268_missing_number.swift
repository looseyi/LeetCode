/*
 * Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
 *
 * For example,
 * Given nums = [0, 1, 3] return 2.
 *
 * Note:
 * Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
 *
 *
 The basic idea is to use XOR operation. We all know that a^b^b =a, which means two xor operations with the same number will eliminate the number and reveal the original number.
 In this solution, I apply XOR operation to both the index and value of the array. In a complete array with no missing numbers, the index and value should be perfectly corresponding( nums[index] = index), so in a missing array, what left finally is the missing number.


 */


class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var xor = 0, i = 0
        while i < nums.count {
            xor = xor ^ i ^ nums[i]
            i += 1
        }
        return xor ^ i
    }

    func missingNumberSum(_ nums: [Int]) -> Int {
        var len = nums.count, i = 0
        var sum = (0 + len) * (len + 1) / 2
        while i < len {
            sum -= nums[i]
            i += 1
        }
        return sum
    }

    func missingNumberBinarySearch(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var left = 0, right = nums.count, mid = (left + right) / 2
        while left < right {
            mid = (left + right) / 2
            if nums[mid] > mid {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}

var n = [0, 1, 3]
n = [0, 1, 2]
n = [0, 1]
print(Solution().missingNumberBinarySearch(n))

