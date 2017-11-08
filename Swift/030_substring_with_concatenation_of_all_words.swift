class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let chars = Array(s.characters)
        let wordLen = words.first!.characters.count
        let wordCount = words.count
        var wordDict = [String : Int]()
        for word in words {
            if let value = wordDict[word] {
                wordDict[word] = value + 1
            } else {
                wordDict[word] = 1
            }
        }
        var result = [Int](), i = 0
        while i < chars.count - wordLen * wordCount + 1 {
            var j = 0
            var cur = [String : Int]()
            while j < wordCount {
                let startIdx = i + j * wordLen
                let word = String(chars[startIdx..<startIdx + wordLen])
//                print(i, j, word, startIdx, startIdx + wordLen)
                if !wordDict.keys.contains(word) {
                    break
                }
                if let value = cur[word] {
                    cur[word] = value + 1
                    if value + 1 > wordDict[word]! {
                        break
                    }
                } else {
                    cur[word] = 1
                }
                j += 1
                if j == wordCount {
                    result.append(i)
                }
            }
            i += 1
        }
        return result
    }
}

//let s = "barfoothefoobarman"
//let words = ["foo", "bar"]
let s = "wordgoodgoodgoodbestword"
let words = ["word","good","best","good"]
print(Solution().findSubstring(s, words))



