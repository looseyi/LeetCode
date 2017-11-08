class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if divisor == 0 || dividend == Int.min && divisor == -1 {
            return Int.max
        }
        let sign = ((dividend < 0) ^ (divisor < 0)) ? -1 : 1
        var dvd: UInt64 = labs(dividend)
        var dvs: UInt64 = labs(divisor)
        var res = 0
        while dvd >= dvs {
            var temp: UInt64 = dvs
            var multiple: UInt64 = 1
            while dvd >= (temp << 1) {
                temp <<= 1
                multiple <<= 1
            }
            dvd -= temp
            res += multiple
        }
        return sign == 1 ? res : -res
    }
}

print(Solution().divide(15, 3))
