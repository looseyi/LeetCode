/*
 * In a given array nums of positive integers, find three non-overlapping subarrays with maximum sum.
 *
 * Each subarray will be of size k, and we want to maximize the sum of all 3*k entries.
 *
 * Return the result as a list of indices representing the starting position of each interval (0-indexed). If there are multiple answers, return the lexicographically smallest one.
 *
 * Example:
 * Input: [1,2,1,2,6,7,5,1], 2
 * Output: [0, 3, 5]
 * Explanation: Subarrays [1, 2], [2, 6], [7, 5] correspond to the starting indices [0, 3, 5].
 * We could have also taken [2, 1], but an answer of [1, 3, 5] would be lexicographically larger.
 * Note:
 * nums.length will be between 1 and 20000.
 * nums[i] will be between 1 and 65535.
 * k will be between 1 and floor(nums.length / 3).
 */


class Solution {
    func maxSumOfThreeSubarrays1(_ nums: [Int], _ k: Int) -> [Int] {
        //W is an array of sums of windows
//        int[] W = new int[nums.length - K + 1];
//        int sum = 0;
//        for (int i = 0; i < nums.length; i++) {
//            sum += nums[i];
//            if (i >= K) sum -= nums[i-K];
//            if (i >= K-1) W[i-K+1] = sum;
//        }
//
//        int[] left = new int[W.length];
//        int best = 0;
//        for (int i = 0; i < W.length; i++) {
//            if (W[i] > W[best]) best = i;
//            left[i] = best;
//        }
//
//        int[] right = new int[W.length];
//        best = W.length - 1;
//        for (int i = W.length - 1; i >= 0; i--) {
//            if (W[i] >= W[best]) best = i;
//            right[i] = best;
//        }
//
//        int[] ans = new int[]{-1, -1, -1};
//        for (int j = K; j < W.length - K; j++) {
//            int i = left[j - K], k = right[j + K];
//            if (ans[0] == -1 || W[i] + W[j] + W[k] >
//                W[ans[0]] + W[ans[1]] + W[ans[2]]) {
//
//                ans[0] = i;
//                ans[1] = j;
//                ans[2] = k;
//            }
//        }
//        return ans;
    }
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        var n = nums.count, maxsum = 0, i = 0
        var sum = Array(repeating: 0, count: n + 1)
        var posLeft = Array(repeating: 0, count: n)
        var posRight = Array(repeating: 0, count: n)
        var ans = Array(repeating: 0, count: 3)
        for i in 0..<n { sum[i + 1] = sum[i] + nums[i] }

        // DP for starting index of the left max sum interval
        i = k
        while i < n {
            let tot = sum[k] - sum[0]
            if sum[i + 1] - sum[i + 1 - k] > tot {
                posLeft[i] = i+1-k
            } else {
                posLeft[i] = posLeft[i-1];
            }
            i += 1
        }
//        print("post left", posLeft)
        // DP for starting index of the right max sum interval
        // caution: the condition is ">= tot" for right interval, and "> tot" for left interval
        posRight[n-k] = n-k
        i = n - k - 1
        while i >= 0 {
            let tot = sum[n] - sum[n - k]
            if (sum[i+k]-sum[i] >= tot) {
                posRight[i] = i
            } else {
                posRight[i] = posRight[i+1]
            }
            i -= 1
        }
//        print("post right", posRight)
        // test all possible middle interval
        i = k
        while i <= n - 2 * k {
            let l = posLeft[i - 1], r = posRight[i + k]
            let tot = (sum[i+k]-sum[i]) + (sum[l+k]-sum[l]) + (sum[r+k]-sum[r])
            if (tot > maxsum) {
                maxsum = tot
                ans[0] = l
                ans[1] = i
                ans[2] = r
            }
            i += 1
        }
        return ans
    }
}

var a = [1,2,1,2,6,7,5,1]
var k = 2
a = [4,5,10,6,11,17,4,11,1,3]
k = 1
print(Solution().maxSumOfThreeSubarrays(a, k))


