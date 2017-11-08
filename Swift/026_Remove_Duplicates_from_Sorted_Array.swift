class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var n = nums.count
        while i < n {
            if nums[i] == val {
                nums[i] = nums[n - 1]
                // reduce array size by one
                n -= 1
            } else {
                i += 1
            }
        }
        return n
    }
}


var arr = [3,2,2,3]
print(Solution().removeElement(&arr, 3))
print(arr)
arr = [1]
print(Solution().removeElement(&arr, 1))
print(arr)
arr = [3, 3]
print(Solution().removeElement(&arr, 3))
print(arr)



