/*
 * https://leetcode.com/problems/palindrome-partitioning/description/
 * Given a string s, partition s such that every substring of the partition is a palindrome.
 *
 * Return all possible palindrome partitioning of s.
 *
 * For example, given s = "aab",
 * Return
 *
 * [
 *   ["aa","b"],
 *   ["a","a","b"]
 * ]
 * 把🐘放进冰箱分为几个步骤，要解决两个问题，1.找出所有string的可能组合。2.filter条件的分析，过滤出最终结果
 */

class Solution {
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var arr = Array(s)
        func isPalindrome(_ str: String, _ l: Int, _ r: Int) -> Bool {
            var l = l, r = r
            while l < r {
                if str[str.index(str.startIndex, offsetBy: l)] != str[str.index(str.startIndex, offsetBy: r)] {
                    return false
                }
                l += 1
                r -= 1
            }
            return true
        }

        func backtrack(_ intermediate: inout [String], _ start: Int) {
            if start == arr.count {
                result.append(intermediate)
            }
            var i = start
            while i < arr.count {
                if isPalindrome(s, start, i) {
                    let startIdx = s.index(s.startIndex, offsetBy: start)
                    let endIdx = s.index(s.startIndex, offsetBy: i)
                    intermediate.append(String(s[startIdx...endIdx]))
                    backtrack(&intermediate, i + 1)
                    intermediate.removeLast()
                }
                i += 1
            }
        }
        var intermediate = [String]()
        backtrack(&intermediate, 0)
        return result
    }
}

print(Solution().partition("aab"))

