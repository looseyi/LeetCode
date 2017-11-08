class Solution {

/*
 *     In fact, we could solve it in O(n^2) time using only constant space.
 *
 *     We observe that a palindrome mirrors around its center.
 *     Therefore, a palindrome can be expanded from its center, and there are only 2n - 12n−1 such centers.
 *
 *     You might be asking why there are 2n - 12n−1 but not nn centers?
 *     The reason is the center of a palindrome can be in between two letters.
 *     Such palindromes have even number of letters (such as \textrm{''abba''}”abba”)
 *     and its center are between the two \textrm{'b'}’b’s.
 *     在目标字符的一次便利中，同时查找出满足回文的中心字符。这里的的中心字符可以是奇数也可能是偶数
 */
    func longestPalindrome(_ s: String) -> String {
        let characters = s.characters.map { String($0) }
        func expandAroundCenter(left: Int, right: Int) -> Int {
            var l = left, r = right
            while l >= 0 && r < characters.count && characters[l] == characters[r] {
                l -= 1
                r += 1
            }
            return r - l - 1
        }
        var start = 0, end = 0
        for i in 0..<characters.count {
            let oddLen = expandAroundCenter(left: i, right: i)
            let evenLen = expandAroundCenter(left: i, right: i + 1)
            let len = max(oddLen, evenLen)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        let startIdx = s.index(s.startIndex, offsetBy: start)
        let endIdx = s.index(s.endIndex, offsetBy: end * -1)
        return s.substring(with: startIdx..<endIdx)
    }
}


print(Solution().longestPalindrome("babad"))
print(Solution().longestPalindrome("cbbd"))
