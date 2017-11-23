/*
 * Given a positive integer n and you can do operations as follow:
 *
 * If n is even, replace n with n/2.
 * If n is odd, you can replace n with either n + 1 or n - 1.
 * What is the minimum number of replacements needed for n to become 1?
 *
 * Example 1:
 *
 * Input:
 * 8
 *
 * Output:
 * 3
 *
 * Explanation:
 * 8 -> 4 -> 2 -> 1
 * Example 2:
 *
 * Input:
 * 7
 *
 * Output:
 * 4
 *
 * Explanation:
 * 7 -> 8 -> 4 -> 2 -> 1
 * or
 * 7 -> 6 -> 3 -> 2 -> 1
 *
 *
 *
 * best explain by binary code
 * https://discuss.leetcode.com/topic/58334/a-couple-of-java-solutions-with-explanations
 * What is not so obvious is what to do with odd numbers. One may think that you just need to remove as many 1's as possible to increase the evenness of the number. Wrong! Look at this example:
 *
 * 111011 -> 111010 -> 11101 -> 11100 -> 1110 -> 111 -> 1000 -> 100 -> 10 -> 1
 * And yet, this is not the best way because
 *
 * 111011 -> 111100 -> 11110 -> 1111 -> 10000 -> 1000 -> 100 -> 10 -> 1
 *
 * 11 -> 10 -> 1 is better than 11 -> 100 -> 10 -> 1.
 *
 */

class Solution {
    func integerReplacement(_ n: Int) -> Int {
        var c = 0, n = n
        while n != 1 {
            if n & 1 == 0 {
                n >>= 1
            } else if n == 3 || ((n >> 1) & 1) == 0 {
                n -= 1
            } else {
                n += 1
            }
            c += 1
        }
        return c
    }
}

var n = 8
n = 7
n = 65535
//n = 10000
print(Solution().integerReplacement(n))



