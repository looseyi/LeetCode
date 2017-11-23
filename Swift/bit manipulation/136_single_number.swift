/*
 * Given an array of integers, every element appears twice except for one. Find that single one.
 *
 * Note:
 * Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var rest = 0
        for num in nums {
            rest ^= num
        }
        return rest
    }
}

let a = [1, 2, 3, 4, 3, 2, 1]
print(Solution().singleNumber(a))

