class Solution {
    /* https://discuss.leetcode.com/topic/3538/concise-o-log-n-binary-search-solution/2 */
    /*
     * Let's say nums looks like this: [12, 13, 14, 15, 16, 17, 18, 19, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
     *
     * Because it's not fully sorted, we can't do normal binary search. But here comes the trick:
     *
     * If target is let's say 14, then we adjust nums to this, where "inf" means infinity:
     * [12, 13, 14, 15, 16, 17, 18, 19, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf]
     *
     * If target is let's say 7, then we adjust nums to this:
     * [-inf, -inf, -inf, -inf, -inf, -inf, -inf, -inf, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
     *
     * And then we can simply do ordinary binary search.
     *
     * Of course we don't actually adjust the whole array but instead adjust only on the fly only the elements we look at. And the adjustment is done by comparing both the target and the actual element against nums[0].
     */
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        } else if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }

        var low = 0, hight = nums.count

        while low < hight {
            let mid = (low + hight) / 2

            var num = Int.max
            // this case confirm target and num[mid] are same side, when we can down half the range
            if (nums[mid] < nums[0]) == (target < nums[0]) {
                num = nums[mid]
                // if target is in left or right
            } else if target < nums[0] {
                num = Int.min
            }

            if num < target {
                low = mid + 1
            } else if num > target {
                hight = mid
            } else {
                return mid
            }
        }
        return -1
    }

    func search1(_ nums: [Int], _ target: Int) -> Int {
        var low = 0, hight = nums.count - 1
        while low < hight {
            let mid = (low + hight) / 2
            if nums[mid] > nums[hight] {
                low = mid + 1
            } else {
                hight = mid
            }
        }
        let privot = low
        low = 0
        hight = nums.count - 1
        while low <= hight {
            let mid = (low + hight) / 2
            let readMid = (mid + privot) % nums.count
            if nums[readMid] == target {
                return readMid
            } else if nums[readMid] < target {
                low = mid + 1
            } else {
                hight = mid - 1
            }
        }
        return -1
    }
    func search2(_ nums: [Int], _ target: Int) -> Int {
        var low = 0, hi = nums.count - 1
        while low < hi {
            let mid = (low + hi) / 2
            if nums[mid] == target { return mid }
            if nums[low] <= nums[mid] {
                if target >= nums[low] && target < nums[mid] {
                    hi = mid - 1
                } else {
                    low = mid + 1
                }
            } else {
                if target > nums[low] && target <= nums[mid] {
                    low = mid + 1
                } else {
                    hi = mid - 1
                }
            }
        }
        return nums[low] == target ? low : -1
    }
}

//print(Solution().search([4, 5, 6, 7, 0, 1, 2], 1))
//print(Solution().search([1], 1))
//print(Solution().search([1, 3], 2))
print(Solution().search([1, 3], 3))
