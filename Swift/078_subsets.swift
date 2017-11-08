/*
 * https://leetcode.com/problems/subsets/description/
 * Given a set of distinct integers, nums, return all possible subsets.
 *
 * Note: The solution set must not contain duplicate subsets.
 *
 * For example,
 * If nums = [1,2,3], a solution is:
 *
 * [
 *   [3],
 *   [1],
 *   [2],
 *   [1,2,3],
 *   [1,3],
 *   [2,3],
 *   [1,2],
 *   []
 * ]
 *
 */
class Solution {

    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 { return [[]] }
        var result = [[Int]]()
        var subset = [Int]()

        func backtrack(of index: Int, _ subset: inout [Int]) {
            result.append(subset)
            for i in index..<nums.count {
                var s = subset + [nums[i]]
                backtrack(of: i + 1, &s)
            }
        }
        backtrack(of: 0, &subset)
        return result
    }

    func subsets1(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = [[]]
        for i in nums {
            for r in result {
                var temp = r
                temp.append(i)
                result.append(temp)
            }
        }
        return result
    }
}


print(Solution().subsets([1, 2, 3]))

