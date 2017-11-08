/*
 * https://leetcode.com/problems/next-permutation/description/
 *
 * Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 *
 * If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 *
 * The replacement must be in-place, do not allocate extra memory.
 *
 * Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 * 1,2,3 → 1,3,2
 * 3,2,1 → 1,2,3
 * 1,1,5 → 1,5,1
 *
 */

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        // get the index where the num is descend, which mean the next number has the permutation
        var k = -1, count = nums.count - 1
        guard count > 0 else { return }
        for i in 0..<count where nums[i] < nums[i + 1] {
            k = i
        }

        // if not found, which mean recursive to the end
        if k == -1 {
            nums.reverse()
            return
        }
        var l = 0
        for i in (k + 1)...count where nums[i] > nums[k] {
            l = i
        }
        (nums[k], nums[l]) = (nums[l], nums[k])
//        nums[k+1..<nums.count].reverse()
        k += 1
        while k < count {
            (nums[k], nums[count]) = (nums[count], nums[k])
            k += 1
            count -= 1
        }
    }
}

var a = [1, 2, 3]
Solution().nextPermutation(&a)  // 1,3,2
print(a)
a = [3, 2, 1]
Solution().nextPermutation(&a)  // 1,2,3
print(a)
a = [1, 1, 5]
Solution().nextPermutation(&a)  // 1,5,1
print(a)
a = [1, 3, 2]
Solution().nextPermutation(&a)  // 2, 1, 3
print(a)
a = [2, 3, 1]
Solution().nextPermutation(&a)  // 3, 1, 2
print(a)


