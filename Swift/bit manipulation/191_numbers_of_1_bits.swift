/*
 * Write a function that takes an unsigned integer and returns the number of ’1' bits it has (also known as the Hamming weight).
 *
 * For example, the 32-bit integer ’11' has binary representation 00000000000000000000000000001011, so the function should return 3.
 *
 * Credits:
 * Special thanks to @ts for adding this problem and creating all test cases.
 *
 */

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var n = n ^ (n >> 1)
        n = n ^ (n >> 2)
        n = n ^ (n >> 4)
        n = n ^ (n >> 8)
        n = n ^ (n >> 16)
        return n
    }
}

print(Solution().hammingWeight(1314520))

