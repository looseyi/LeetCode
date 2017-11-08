/*
 * Rotate an array of n elements to the right by k steps.
 *
 * For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated to [5,6,7,1,2,3,4].
 *
 * Note:
 * Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
 */


class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }

    fileprivate func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var i = start, j = end
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}

var arr = [1,2,3,4,5,6,7]
//arr = [1, 2]
//arr = [1,2,3,4,5,6]
Solution().rotate(&arr, 3)
print(arr)



