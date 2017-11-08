/*
 * https://leetcode.com/problems/permutations-ii/description/
 *
 * Given a collection of numbers that might contain duplicates, return all possible unique permutations.
 *
 * For example,
 * [1,1,2] have the following unique permutations:
 * [
 *   [1,1,2],
 *   [1,2,1],
 *   [2,1,1]
 * ]
 */

class Solution {

    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nums = nums.sorted()
        permuteUnique(nums, 0, &result)
        return result
    }

    private func permuteUnique(_ nums: [Int], _ index: Int, _ result: inout [[Int]]) {
        if index == nums.count {
            result.append(nums)
            return
        } else {
            var nums = nums
            for j in index..<nums.count {
                if index != j && nums[index] == nums[j] { continue }
                (nums[index], nums[j]) = (nums[j], nums[index])
                print(nums)
                permuteUnique(nums, index+1, &result)
            }
        }
    }


    /*
     * solutions = [[]]
     *
     * for num in nums:
     *     next = []
     *     for solution in solutions:
     *         for i in xrange(len(solution) + 1):
     *             candidate = solution[:i] + [num] + solution[i:]
     *             if candidate not in next:
     *                 next.append(candidate)
     *
     *     solutions = next
     *
     * return solutions
     */
    func permuteUnique2(_ nums: [Int]) -> [[Int]] {
        var solutions = [[Int]]()

        func loopSolutions(_ solution: inout [Int], next: inout [[Int]], num: Int) {
            for i in 0...solution.count {
                let candicate = Array(solution[0..<i]) + Array([num]) + Array(solution[i..<solution.endIndex])
                if !next.contains(where: { $0 == candicate }) {
                    next.append(candicate)
                }
            }
        }

        for num in nums {
            var next = [[Int]]()
            if solutions.count == 0 {
                var solution: [Int] = []
                loopSolutions(&solution, next: &next, num: num)
            } else {
                for var solution in solutions {
                    loopSolutions(&solution, next: &next, num: num)
                }
            }
            solutions = next
        }
        return solutions
    }
}

//print(Solution().permuteUnique([-1,2,-1,2,1,-1,2,1]))
//print(Solution().permuteUnique([1, 1, 2]))
print(Solution().permuteUnique([1, 2, 3]))
