class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var low = 0, hi = nums.count
        var start = -1, end = -1
        while low < hi {
            let mid = (low + hi) / 2
            if nums[mid] > target {
                hi = mid
            } else if nums[mid] < target {
                low = mid + 1
            } else {
                start = mid
                end = mid
                break
            }
        }
        if start == -1 {
            return [start, end]
        }
        while start > 0 && nums[start - 1] == target {
            start -= 1
        }
        while end < nums.count - 1 && nums[end + 1] == target {
            end += 1
        }
        return [start, end]
    }
}


print(Solution().searchRange([5, 7, 7, 8, 8, 10], 8))
print(Solution().searchRange([5, 7, 7, 8, 8, 10], 0))
print(Solution().searchRange([5, 7, 7, 8, 8, 10], 10))
print(Solution().searchRange([2, 2], 2))
print(Solution().searchRange([3, 3, 3], 3))


