class Solution {

    func threeSum(_ nums: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        let n = nums.count
        if n < 3 {
            return answer
        }
        var nums = nums.sorted()
        for i in 0 ..< n - 2 {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            var L = i + 1
            var R = n - 1
            while L < R {
                let temp = nums[i] + nums[L] + nums[R]
                if temp == 0 {
                    answer.append([nums[i], nums[L], nums[R]])
                    L += 1
                    R -= 1
                    // 去重
                    while L < R && nums[L] == nums[L - 1] {
                        L += 1
                    }
                    while L < R && nums[R] == nums[R + 1] {
                        R -= 1
                    }
                } else if temp > 0 {
                    R -= 1
                } else {
                    L += 1
                }
            }
        }
        return answer
    }
}
