/*
 * Given an array of integers, every element appears twice except for one. Find that single one.
 *
 * Note:
 * Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */

// 00, 01, 10
// 核心利用位运算 (a ^ a) & ~a = 0
// 用两个变量与当前数位运算

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ones = 0, twos = 0
        for num in nums {
            ones = (ones ^ num) & ~twos
            twos = (twos ^ num) & ~ones
            print(num, ones, twos)
        }
        return ones
    }
}

let a = [1, 2, 3, 4, 3, 2, 1, 2, 3, 1]
print(Solution().singleNumber(a))

