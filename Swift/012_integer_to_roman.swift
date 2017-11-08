/*
 * Time:  O(n)
 * Space: O(1)
 *
 * Given an integer, convert it to a roman numeral.
 *
 * Input is guaranteed to be within the range from 1 to 3999.
 */

class Solution {
    func intToRoman(_ num: Int) -> String {
        let numeral_map = [
            1: "I", 4: "IV", 5: "V", 9: "IX",
            10: "X", 40: "XL", 50: "L", 90: "XC",
            100: "C", 400: "CD", 500: "D", 900: "CM", 1000: "M"
        ]
        var num = num
        var result = [String]()
        let keyset = numeral_map.keys.sorted().reversed()
        while num > 0 {
            for key in keyset {
                while num / key > 0 {
                    num -= key
                    result.append(numeral_map[key]!)
                }
            }
        }
        return result.joined(separator: "")
    }
}

print(Solution().intToRoman(999))
print(Solution().intToRoman(3999))

