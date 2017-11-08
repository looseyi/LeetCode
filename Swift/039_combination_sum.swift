/*
 *  https://leetcode.com/problems/combination-sum/description/
 * Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
 *
 * The same repeated number may be chosen from C unlimited number of times.
 *
 * Note:
 * All numbers (including target) will be positive integers.
 * The solution set must not contain duplicate combinations.
 * For example, given candidate set [2, 3, 6, 7] and target 7,
 * A solution set is:
 * [
 *   [7],
 *   [2, 2, 3]
 * ]
 */


class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var candidates = candidates.sorted()
        var result = [[Int]]()

        func combinationSumRecu(_ start: Int, _ intermediate: inout [Int], _ target: Int) {
            if target == 0 {
                result.append(intermediate)
            }
            var i = start
            while i < candidates.count && candidates[i] <= target {
                intermediate.append(candidates[i])
//                print(start, target, candidates[i], intermediate)
                combinationSumRecu(i, &intermediate, target - candidates[i])
                intermediate.removeLast()
                i += 1
            }
        }
        var temp = [Int]()
        combinationSumRecu(0, &temp, target)
        return result
    }

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var temp: [Int] = []
        backtrack(&result, &temp, candidates.sorted(), target, 0)
        return result
    }

    func backtrack(_ result: inout [[Int]], _ temp: inout [Int], _ nums: [Int], _ target: Int, _ start: Int) {
        if target > 0 {
            var i = start
            while i < nums.count && target >= nums[i] {
                temp.append(nums[i])
                backtrack(&result, &temp, nums, target - nums[i], i)
                temp.removeLast()

                i += 1
            }
        } else if target == 0 {
            result.append(temp)
        }
    }
}

print(Solution().combinationSum([2, 3, 6, 7], 7))

