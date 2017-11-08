class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        var answer = 0x7fffffff
        var answer_diff = 0x7fffffff
        guard n >= 3 else { return answer }

        var nums = nums.sorted()

        for i in 0 ..< n - 2 {
            var L = i + 1
            var R = n - 1
            while L < R {
                let temp = nums[i] + nums[L] + nums[R]
                if temp == target {
                    return target
                } else if temp > target {
                    R -= 1
                } else {
                    L += 1
                }
                let diff = abs(temp - target)
                if diff < answer_diff {
                    (answer, answer_diff) = (temp, diff)
                }
            }
        }
        return answer
    }
}

print(Solution().threeSumClosest([-1, 2, 1, -4], 1))
