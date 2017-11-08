/*
 * Time:  O(n)
 * Space: O(1)
 *
 * Implement atoi to convert a string to an integer.
 *
 * Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below
 * and ask yourself what are the possible input cases.
 *
 * Notes: It is intended for this problem to be specified vaguely (ie, no given input specs).
 * You are responsible to gather all the input requirements up front.
 *
 * spoilers alert... click to show requirements for atoi.
 *
 * Requirements for atoi:
 * The function first discards as many whitespace characters as necessary
 * until the first non-whitespace character is found. Then, starting from this character,
 * takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 *
 * The string can contain additional characters after those that
 * form the integral number, which are ignored and have no effect on the behavior of this function.
 *
 * If the first sequence of non-whitespace characters in str is not a valid integral number,
 * or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 *
 * If no valid conversion could be performed, a zero value is returned.
 * If the correct value is out of the range of representable values, INT_MAX (2147483647) or INT_MIN (-2147483648) is returned.
 *
 */

class Solution {
    func myAtoi(_ str: String) -> Int {
        let characters = str.characters.map { String($0) }

        let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "-"]
        var result = 0
        var mutiler = 0
        var i = 0
        while i < characters.count {
            if let idx = numbers.index(of: characters[i]) {
                if idx >= numbers.count - 2 {
                    if mutiler == 0 {
                        mutiler = characters[i] == "-" ? -1 : 1
                    } else {
                        return 0
                    }
                } else {
                    if mutiler == 0 {
                        mutiler = 1
                    }
                    result = result * 10 + idx
                    /* print(result) */
                    if mutiler == 1 && result >= Int.max / 10 {
                        return 0
                    } else if mutiler == -1 && result >= Int.max / 10 {
                        return 0
                    }
                }
            } else if characters[i] == " " && mutiler == 0 {
                i += 1
                continue
            } else {
                break
            }
            i += 1
        }
        return result * mutiler
    }
}
print(Int.max)

/* print(Solution().myAtoi("123456")) */
/* print(Solution().myAtoi("-123456")) */
/* print(Solution().myAtoi("-234234123456")) */
/* print(Solution().myAtoi("-2147483648")) */
/* print(Solution().myAtoi("2147483648")) */
print(Solution().myAtoi("9223372036854775809"))
/* print(Solution().myAtoi("123")) */
/* print(Solution().myAtoi("-1")) */
/* print(Solution().myAtoi("+-2")) */
/* print(Solution().myAtoi("+")) */
/* print(Solution().myAtoi("    010")) */
/* print(Solution().myAtoi("    +10")) */
/* print(Solution().myAtoi("  -98a21")) */
/* print(Solution().myAtoi("  +0 123")) */
print(Int("2147483648"))
