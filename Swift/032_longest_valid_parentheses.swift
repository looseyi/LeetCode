class Solution {

    func longestValidParentheses(_ s: String) -> Int {
        let chars = Array(s.characters)
        let range = Array(0..<chars.count)
        func length(_ it: [Int], _ start: Int, _ c: Character) -> Int {
            var longest = 0, length = 0
            var start = start
            for i in it {
                if chars[i] == c {
                    length += 1
                } else {
                    length -= 1
                    if length < 0 {
                        length = 0
                        start = i
                    } else if length == 0 {
                        longest = max(longest, abs(i - start))
                    }
                }
            }
            return longest
        }
        return max(length(range, -1, Character("(")),
                   length(range.reversed(), chars.count, Character(")")))
    }
}


print(Solution().longestValidParentheses(")()())"))
print(Solution().longestValidParentheses("()(()"))
print(Solution().longestValidParentheses("()(())"))
