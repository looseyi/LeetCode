/*
 * Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 *
 * Note:
 * You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2. The number of elements initialized in nums1 and nums2 are m and n respectively.
 */



class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1, k = m + n - 1

        while i >= 0, j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
        while j >= 0 {
            nums1[k] = nums2[j]
            k -= 1
            j -= 1
        }
    }


    func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1, k = m + n - 1

        while j >= 0 {
            if i >= 0, j >= 0 {
                if nums1[i] > nums2[j] {
                    nums1[k] = nums1[i]
                    i -= 1
                } else {
                    nums1[k] = nums2[j]
                    j -= 1
                }
            } else if i >= 0 {
                nums1[k] = nums1[i]
                i -= 1
            } else {
                nums1[k] = nums2[j]
                j -= 1
            }
            k -= 1
        }
    }
}

var num1 = [1], num2 = [Int](), m = 1, n = 0

//num1 = [1, 0]
//num2 = [2]
//m = 1
//n = 1
//num1 = [1,2,4,5,6,0]
//m = 5
//num2 = [3]
//n = 1
//num1 = [-1,-1,0,0,0,0]
//m = 4
//num2 = [-1, 0]
//n = 2
num1 = [4,0,0,0,0,0]
m = 1
num2 = [1,2,3,5,6]
n = 5
Solution().merge(&num1, m, num2, n)


print(num1)


