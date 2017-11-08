/*
 * https://leetcode.com/problems/combination-sum-ii/description/
 *
 * Given a collection of candidate numbers (C) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.
 *
 * Each number in C may only be used once in the combination.
 *
 * Note:
 * All numbers (including target) will be positive integers.
 * The solution set must not contain duplicate combinations.
 * For example, given candidate set [10, 1, 2, 7, 6, 1, 5] and target 8,
 * A solution set is:
 * [
 *   [1, 7],
 *   [1, 2, 5],
 *   [2, 6],
 *   [1, 1, 6]
 * ]
 */

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        guard candidates.count > 0, target > 0 else { return result }

        var candidates = candidates.sorted()

        var temp = [Int]()
        func backtrack(_ temp: inout [Int], _ start: Int, _ target: Int) {
            if target == 0 {
                result.append(temp)
                return
            } else if target > 0 {
                var i = start
                while i < candidates.count {
                    if target <= candidates[i] {
                        return
                    }
                    if i != start && candidates[i] == candidates[i-1] {
                        i += 1
                        continue
                    }
                    temp.append(candidates[i])
                    backtrack(&temp, i + 1, target - candidates[i])
                    temp.removeLast()
                    i += 1
                }
            }
        }
        backtrack(&temp, 0, target)
        return result
    }
}


let a = [10, 1, 2, 7, 6, 1, 5]
print(Solution().combinationSum2(a, 8))


