/*
 * https://leetcode.com/problems/next-permutation/description/
 *
 * Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 *
 * If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 *
 * The replacement must be in-place, do not allocate extra memory.
 *
 * Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 * 1,2,3 → 1,3,2
 * 3,2,1 → 1,2,3
 * 1,1,5 → 1,5,1
 *
 */

class Solution {

    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        guard nums.count > 0 else {
            return result
        }
        func backtrack(_ temp: inout [Int]) {
            if temp.count == nums.count {
                result.append(temp)
            } else {
                for i in 0..<nums.count where !temp.contains(nums[i]) {
                    temp.append(nums[i])
                    backtrack(&temp)
                    temp.removeLast()
                }
            }
        }
        var temp = [Int]()
        backtrack(&temp)
        return result
    }

    func permute2(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        guard nums.count > 0 else {
            return result
        }
        func backtrack(_ temp: inout [Int], _ rest: inout [Int]) {
            if temp.count == nums.count {
                result.append(temp)
            } else {
                var rest = rest.filter { !temp.contains($0) }
                for i in rest {
                    temp.append(i)
                    backtrack(&temp, &rest)
                    temp.removeLast()
                }
            }
        }
        var temp = [Int]()
        var rest = nums
        backtrack(&temp, &rest)
        return result
    }
}

//print(Solution().permute([1, 2, 3]))
//print(Solution().permute([0,-1,1]))
print(Solution().permute2([1, 2, 3]))
//print(Solution().permute([0,-1,1]))



