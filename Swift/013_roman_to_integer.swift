/*
 * Time:  O(n)
 * Space: O(1)
 *
 * Given an integer, convert it to a roman numeral.
 *
 * Input is guaranteed to be within the range from 1 to 3999.
 */

class Solution {
    func romanToInt(_ s: String) -> Int {
        let numeral_map = [ "I": 1, "V": 5, "X": 10, "L": 50, "C":100, "D": 500, "M": 1000 ]
        let characters = s.characters.map { String($0) }
        var nums = [Int]()
        for c in characters {
            nums.append(numeral_map[c]!)
        }
        var i = 0, len = nums.count, sum = 0
        while i < len - 1 {
            if nums[i] < nums[i + 1] {
                sum -= nums[i]
            } else {
                sum += nums[i]
            }
            i += 1
        }
        return sum + nums[len - 1]
    }
}

print(Solution().romanToInt("CMXCIX"))
print(Solution().romanToInt("MMMCMXCIX"))


