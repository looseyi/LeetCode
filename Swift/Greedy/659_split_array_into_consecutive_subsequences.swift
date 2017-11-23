/*
 * You are given an integer array sorted in ascending order (may contain duplicates), you need to split them into several subsequences, where each subsequences consist of at least 3 consecutive integers. Return whether you can make such a split.
 *
 * Example 1:
 * Input: [1,2,3,3,4,5]
 * Output: True
 * Explanation:
 * You can split them into two consecutive subsequences :
 * 1, 2, 3
 * 3, 4, 5
 * Example 2:
 * Input: [1,2,3,3,4,4,5,5]
 * Output: True
 * Explanation:
 * You can split them into two consecutive subsequences :
 * 1, 2, 3, 4, 5
 * 3, 4, 5
 * Example 3:
 * Input: [1,2,3,4,4,5]
 * Output: False
 * Note:
 * The length of the input is in range of [1, 10000]
 */


class Solution {
    func isPossible(_ nums: [Int]) -> Bool {

        var pre = Int.min, cur = 0
        var cnt1 = 0, cnt2 = 0, cnt3 = 0, i = 0

        while i < nums.count {
            var cnt = 0
            cur = nums[i]
            while i < nums.count && cur == nums[i] {
                cnt += 1
                i += 1
            }

            if cur != pre + 1 {
                if cnt1 != 0 || cnt2 != 0 {
                    return false
                }
                cnt1 = cnt
                cnt2 = 0
                cnt3 = 0
            } else {
                if cnt < cnt1 + cnt2 {
                    return false
                }
                cnt1 = max(0, cnt - (cnt1 + cnt2 + cnt3))
                cnt2 = cnt1
                cnt3 = cnt2 + min(cnt3, cnt - (cnt1 + cnt2))
            }
            pre = cur
        }
        return cnt1 == 0 && cnt2 == 0
    }
}

var nums = [1,2,3,4,4,5]
nums = [1,2,3,3,4,5]
print(Solution().isPossible(nums))

