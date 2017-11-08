
class Solution {
    func generateParenthesis2(_ n: Int) -> [String] {

        var arr = [String]()
        func backtrack(_ arr: [String], _ str: String, _ open: Int, _ close: Int, _ max: Int) {
            var arr = arr
            if arr.count == max * 2 {
                arr.append(str)
                return
            }
            if open < max {
                backtrack(arr, str + "(", open + 1, close, n)
            } else if close < open {
                backtrack(arr, str + ")", open, close + 1, n)
            }

        }
        backtrack(arr, "", 0, 0, n)
        return arr
    }
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        func generate(_ p: String, _ left: Int, _ right: Int) {
            if left > 0 {
                generate(p + "(", left - 1, right)
            }
            if right > left {
                generate(p + ")", left, right - 1)
            }
            if right <= 0 {
                result.append(p)
            }
        }
        generate("", n, n)
        return result
    }
}


print(Solution().generateParenthesis(3))


