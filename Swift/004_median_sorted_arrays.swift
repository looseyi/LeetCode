class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var A = nums1, B = nums2
        var m = A.count, n = B.count
        if m > n {
            (A, B, m, n) = (B, A, n, m)
        }
        if n == 0 {
            return 0
        }
        var imin = 0, imax = m, half_len = (m + n + 1) / 2
        // like binary search
        while imin <= imax {
            let i = (imin + imax) / 2
            let j = half_len - i
            if i < m && B[j - 1] > A[i] {
                imin = i + 1
            } else if i > 0 && A[i - 1] > B[j] {
                imax = i - 1
            } else {
                // i is perfect
                var maxOfLeft = 0.0
                if i == 0 {
                    maxOfLeft = Double(B[j - 1])
                } else if j == 0 {
                    maxOfLeft = Double(A[i - 1])
                } else {
                    maxOfLeft = Double(max(B[j - 1], A[i - 1]))
                }

                if (m + n) % 2 == 1 {
                    return maxOfLeft
                }

                var minOfRight = 0.0
                if i == m {
                    minOfRight = Double(B[j])
                } else if j == n {
                    minOfRight = Double(A[i])
                } else {
                    minOfRight = Double(min(A[i], B[j]))
                }
                print(maxOfLeft, minOfRight)
                return (maxOfLeft + minOfRight) / 2.0
            }
        }
        return 0
    }
}

print(Solution().findMedianSortedArrays([1, 3], [2]))
print(Solution().findMedianSortedArrays([1, 2], [3, 4]))

