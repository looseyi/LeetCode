/*
 * Given an array of non-negative integers, you are initially positioned at the first index of the array.
 *
 * Each element in the array represents your maximum jump length at that position.
 *
 * Your goal is to reach the last index in the minimum number of jumps.
 *
 * For example:
 * Given array A = [2,3,1,1,4]
 *
 * The minimum number of jumps to reach the last index is 2. (Jump 1 step from index 0 to 1, then 3 steps to the last index.)
 *
 * Note:
 * You can assume that you can always reach the last index.
 */


/* 看了半天才懂，题意是给定一个数组，每个元素的值代表最大可移动的次数，最终的目的是用最小的步数到达最后一位。 */
/* 上面的🌰中，第一个数字“2”可以跳两次，一跳到3，而’3‘刚刚好可以用3跳到达最后一位4. */
/* 故2是最优解 */




class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard nums.count >= 2 else { return 0 }
        var level = 0, currentMax = 0, i = 0, nextMax = 0
        while i <= currentMax {
            level += 1
            /* print("level", level, i) */
            while i <= currentMax {
                nextMax = max(nextMax, nums[i] + i)
                /* print("nextMax", nextMax, i) */
                if nextMax >= nums.count - 1 {
                    /* print("result", level, nextMax, currentMax) */
                    return level
                }
                i += 1
            }
            if currentMax == nextMax { return -1 }
            currentMax = nextMax
        }
        return -1
    }

    /// 要到最后一位，解的移动次数一定是与index下标相同，满足该条件的次数也就是解
    /// 满足一次条件后，起点也是下一次的移动次数
    func jump2(_ nums: [Int]) -> Int {
        var step_count = 0, last_jump_max = 0, current_jump_max = 0, i = 0
        while i < nums.count - 1 {
            current_jump_max = max(current_jump_max, i + nums[i])
            if i == last_jump_max {
                step_count += 1
                last_jump_max = current_jump_max
            }
            i += 1
        }
        return step_count
    }
}

print(Solution().jump([2, 3, 1, 1, 4]))
print(Solution().jump([3, 2, 1, 0, 4]))
