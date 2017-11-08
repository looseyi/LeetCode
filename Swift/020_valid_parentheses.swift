

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [String]()
        let right = ["}", "]", ")"]
        let left = ["{", "[", "("]
        for c in s.characters {
            let char = String(c)
            if left.contains(char) {
                stack.append(char)
            } else if let index = right.index(of: char) {
                if stack.count == 0 || left[index] != stack.removeLast() {
                    return false
                }
            } else {
                return false
            }
        }
        return stack.count == 0
    }
}


print(Solution().isValid("()[]{}"))
print(Solution().isValid("()"))
print(Solution().isValid("([)]"))
