class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var result = 0
        while x != 0 {
            let tail = x % 10
            let newResult = result * 10 + tail
            /* print(newResult, tail) */
            if abs(newResult) > 1<<31 {
                return 0
            }
            result = newResult
            x = x / 10
        }
        return result
    }
}


print(Solution().reverse(321))
print(Solution().reverse(21))
print(Solution().reverse(-4121))
print(Solution().reverse(1534236469))
print(Solution().reverse(1))
print(Solution().reverse(-2147483648))
