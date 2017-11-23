/*
 * Given an array of non-negative integers, you are initially positioned at the first index of the array.
 *
 * Each element in the array represents your maximum jump length at that position.
 *
 * Determine if you are able to reach the last index.
 *
 * For example:
 * A = [2,3,1,1,4], return true.
 *
 * A = [3,2,1,0,4], return false.
 *
 */

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 0 else { return true }
        var i = 0, reach = 0, n = nums.count
        while i < n, i <= reach {
            reach = max(i + nums[i], reach)
            if reach >= n - 1 {
                return true
            }
            i += 1
        }
        return i == n
    }
}

var a = [2,3,1,1,4]
//print(Solution().canJump(a))
a = [3,2,1,0,4]
print(Solution().canJump(a))


