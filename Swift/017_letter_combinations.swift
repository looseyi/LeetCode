class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty { return [] }
        let lookup = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        var result = [String]()

        func letterCombinationsRecu(_ cur: String, _ n: Int) {
            if n == digits.characters.count {
                result.append(cur)
            } else {
                let index = Int(digits[])
                for choice in lookup[digits[n]].characters {
                    letterCombinationsRecu(cur + String(choice), n + 1)
                }
            }
        }

        letterCombinationsRecu("", 0)
        return result
    }
}
