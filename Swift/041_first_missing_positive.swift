class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        for i in 0..<nums.count {
            while nums[i] >= 1, nums[i] <= nums.count, nums[i] != i+1 {
                if nums[nums[i]-1] == nums[i] {
                    break
                }
                let swap = nums[nums[i]-1]
                nums[nums[i]-1] = nums[i]
                nums[i] = swap
            }
        }
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}


print(Solution().firstMissingPositive([1,1]))
print(Solution().firstMissingPositive([1,2,0]))
print(Solution().firstMissingPositive([3,4,-1,1]))
