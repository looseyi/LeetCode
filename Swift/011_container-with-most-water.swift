class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var l = 0, r = height.count - 1, maxArea = 0
        while l < r {
            maxArea = max(maxArea, (r - l) * min(height[r], height[l]))
            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        return maxArea
    }
}

print(Solution().maxArea([1, 2, 3, 4, 3, 2, 1, 5]))

