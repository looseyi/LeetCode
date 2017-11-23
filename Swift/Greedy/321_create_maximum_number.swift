/*
 * Given two arrays of length m and n with digits 0-9 representing two numbers. Create the maximum number of length k <= m + n from digits of the two. The relative order of the digits from the same array must be preserved. Return an array of the k digits. You should try to optimize your time and space complexity.
 *
 * Example 1:
 * nums1 = [3, 4, 6, 5]
 * nums2 = [9, 1, 2, 5, 8, 3]
 * k = 5
 * return [9, 8, 6, 5, 3]
 *
 * Example 2:
 * nums1 = [6, 7]
 * nums2 = [6, 0, 4]
 * k = 5
 * return [6, 7, 6, 0, 4]
 *
 * Example 3:
 * nums1 = [3, 9]
 * nums2 = [8, 9]
 * k = 3
 * return [9, 8, 9]
 *
 * Credits:
 * Special thanks to @dietpepsi for adding this problem and creating all test cases.
 */


/*
 * Given two arrays of length m and n with digits 0-9 representing two numbers. Create the maximum number of length k <= m + n from digits of the two. The relative order of the digits from the same array must be preserved. Return an array of the k digits. You should try to optimize your time and space complexity.
 *
 * Example 1:
 * nums1 = [3, 4, 6, 5]
 * nums2 = [9, 1, 2, 5, 8, 3]
 * k = 5
 * return [9, 8, 6, 5, 3]
 *
 * Example 2:
 * nums1 = [6, 7]
 * nums2 = [6, 0, 4]
 * k = 5
 * return [6, 7, 6, 0, 4]
 *
 * Example 3:
 * nums1 = [3, 9]
 * nums2 = [8, 9]
 * k = 3
 * return [9, 8, 9]
 *
 * Credits:
 * Special thanks to @dietpepsi for adding this problem and creating all test cases.
 */


class Solution {
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        var ans = Array(repeating: 0, count: k)
        var res = Array(repeating: 0, count: k)
        var res1 = res
        var res2 = res
        for i in max(k - nums2.count, 0)...min(nums1.count, k) {
            res.removeAll()

            get_max_sub_array(nums1, i, &res1)
            get_max_sub_array(nums2, k - i, &res2)
            var pos1 = 0, pos2 = 0
            while (pos1 < res1.count || pos2 < res2.count) {
                if greater(res1, pos1, res2, pos2)  {
                    res.append(res1[pos1])
                    pos1 += 1
                } else {
                    res.append(res2[pos2])
                    pos2 += 1
                }
            }
            if (!greater(ans, 0, res, 0)) { ans = res }
        }
        return ans
    }

    func greater(_ nums1: [Int], _ start1: Int, _ nums2: [Int], _ start2: Int) -> Bool {
        var i = start1, j = start2
        while i < nums1.count, j < nums2.count {
            if nums1[i] > nums2[j] { return true }
            if nums1[i] < nums2[j] { return false }
            i += 1
            j += 1
        }
        return i != nums1.count
    }


    func get_max_sub_array(_ nums: [Int], _ k: Int, _ res: inout [Int]) {
        res.removeAll()
        var len = 0
        for i in 0..<nums.count {
            while (len > 0 && len + nums.count - i > k && res[len - 1] < nums[i]) {
                len -= 1
            }
            if len < k {
                if res.count > len {
                    res[len] = nums[i]
                } else {
                    res.append(nums[i])
                }
                len += 1
            }
        }
    }
}



var nums1 = [3, 4, 6, 5]
var nums2 = [9, 1, 2, 5, 8, 3]
var k = 5

/* nums1 = [6, 7] */
/* nums2 = [6, 0, 4] */
/* k = 5 */

/* nums1 = [3, 9] */
/* nums2 = [8, 9] */
/* k = 3 */

//nums1 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
//nums2 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
//k = 100

//nums1 = [6,7]
//nums2 = [6,0,4]
//k = 5

print(Solution().maxNumber(nums1, nums2, k))
