/*
 * Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
 *
 * For example,
 * Given [100, 4, 200, 1, 3, 2],
 * The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
 *
 * Your algorithm should run in O(n) complexity.
 *
 */

class Solution {

    func longestConsecutive1(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var s = Set<Int>()
        nums.forEach { s.insert($0) }
        var maxValue = 1
        for n in nums {
            if let _ = s.remove(n) {
                var val = n
                var sum = 1
                while let _ = s.remove(val-1) {
                    val -= 1
                }
                sum += n - val

                val = n
                while let _ = s.remove(val+1) {
                    val += 1
                }
                sum += val - n
                maxValue = max(maxValue, sum)
            }
        }
        return maxValue
    }

    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        let nums = nums.sorted(by: <)
        var i = 1, sum = 1, result = 1
        while i < nums.count {
            if nums[i] == nums[i - 1] {
                i += 1
                continue
            } else if nums[i] - nums[i - 1] == 1 {
                sum += 1
            } else {
                sum = 1
            }
            result = max(result, sum)
            i += 1
        }
        return result
    }
}


var a = [100, 4, 200, 1, 3, 2]
a = [0, 0]
print(Solution().longestConsecutive(a))


