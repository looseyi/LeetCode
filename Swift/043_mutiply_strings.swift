/*
 * https://leetcode.com/problems/multiply-strings/description/
 *
 * Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2.
 *
 * Note:
 *
 * The length of both num1 and num2 is < 110.
 * Both num1 and num2 contains only digits 0-9.
 * Both num1 and num2 does not contain any leading zero.
 * You must not use any built-in BigInteger library or convert the inputs to integer directly.
 *
 */
import Foundation


class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {

        let zero = Int("0".unicodeScalars.first?.value ?? 0)
        let numL = num1.characters.map { Int($0.unicodeScalars.first?.value ?? 0) - zero }
        let numR = num2.characters.map { Int($0.unicodeScalars.first?.value ?? 0) - zero }

        var res = Array(repeating: 0, count: numL.count + numR.count)
        var l = numL.count - 1, r = numR.count - 1
        while l >= 0 {
            r = numR.count - 1
            while r >= 0 {
                let mul = numL[l] * numR[r]
                let p1 = l + r, p2 = l + r + 1
                let sum = mul + res[p2]
                res[p1] += sum / 10
                res[p2] = sum % 10

                r -= 1
            }
            l -= 1
        }
        while res.first == 0 {
            res.removeFirst()
        }
        return res.count == 0 ? "0" : res.reduce("", { $0 + String($1) })
    }
}


print(Solution().multiply("123", "45"))
//print(Solution().multiply("498828660196", "840477629533"))
print(Solution().multiply("9", "9"))


