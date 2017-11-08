class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 { return false }
        var copy = x, reverse = 0
        while copy != 0 {
            reverse = reverse * 10 + copy % 10
            copy /= 10
        }
        return x == reverse
    }
}

print(Solution().isPalindrome(1211))
print(Solution().isPalindrome(1221))
