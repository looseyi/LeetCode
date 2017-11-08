class Solution {
    func trap(_ height: [Int]) -> Int {
        // with this count judging, speed up to 50%
        guard height.count > 2 else { return 0 }

        var left = 0, right = height.count - 1
        var left_max = 0, right_max = 0, ans = 0
        while left < right {
            if height[left] < height[right] {
                if height[left] >= left_max {
                    left_max = height[left]
                } else {
                    ans += left_max - height[left]
                }
                left += 1
            } else {
                if height[right] >= right_max {
                    right_max = height[right]
                } else {
                    ans += right_max - height[right]
                }
                right -= 1
            }
        }
        return ans
    }
}

let a = [0,1,0,2,1,0,1,3,2,1,2,1]
print(Solution().trap(a))
