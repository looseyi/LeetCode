class Solution {

    func lengthOfLongestSubstring(_ s: String) -> Int {
        let characters = s.characters.map { String($0) }
        let n = characters.count
        var ans = 0, i = 0, j = 0
        var map = [String : Int]()
        while j < n {
            if let index = map[characters[j]] {
                i = max(i, index)
            }
            ans = max(ans, j - i + 1)
            map[characters[j]] = j + 1
            j += 1
        }
        print(i, j)
        return ans
    }

    func lengthOfLongestSubstring3(_ s: String) -> Int {
        let characters = s.characters.map { String($0) }
        let n = characters.count
        var ans = 0, i = 0, j = 0
        var set: Set = Set<String>()

        while j < n && i < n {
            if !set.contains(characters[j]) {
                set.insert(characters[j])
                j += 1
                ans = max(ans, j - i)
            } else {
                set.remove(characters[i])
                i += 1
            }
            print(set, i, j )
        }
        return ans
    }

    // set subscript index as the search value, the subscript value was the repeat time
    /*
    * The previous implements all have no assumption on the charset of the string s.
    *
    * If we know that the charset is rather small, we can replace the Map with an integer array as direct access table.
    *
    * Commonly used tables are:
    *
    * int[26] for Letters 'a' - 'z' or 'A' - 'Z'
    * int[128] for ASCII
    * int[256] for Extended ASCII
    *
    */
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        let unicodes = s.unicodeScalars.map { Int($0.value) }
        if unicodes.count == 0 {
            return 0
        }
        var i = 0
        var answer = 0
        var vis = Array(repeating: -1, count: 128)

        for (j, unicode) in unicodes.enumerated() {
            let index = vis[unicode]
            if index != -1 {
                for x in i ..< index {
                    vis[unicodes[x]] = -1
                }
                i = index + 1
            }
            answer = max(answer, j - i + 1)
            vis[unicode] = j
        }
        return answer
    }
}


print(Solution().lengthOfLongestSubstring("abcabcbb"))
print(Solution().lengthOfLongestSubstring("bbbbbb"))
print(Solution().lengthOfLongestSubstring("pwwkew"))
print(Solution().lengthOfLongestSubstring("aab"))
print(Solution().lengthOfLongestSubstring("dvdf"))
print(Solution().lengthOfLongestSubstring("vaewogmglhxqbyqkdlaxuqyztrrksuenwkmkryrefqvions"))




