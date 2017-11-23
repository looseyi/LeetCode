import Foundation
/*
 * https://www.hrwhisper.me/leetcode-remove-duplicate-letters/
 *
 * Given a string which contains only lowercase letters, remove duplicate letters so that every letter appear once and only once. You must make sure your result is the smallest in lexicographical order among all possible results.
 *
 * Example:
 * Given "  bcabc"
 * Return "abc"
 *
 * Given "cbacdcbc"
 * Return "acdb"
 *
 * Credits:
 * Special thanks to @dietpepsi for adding this problem and creating all test cases.
 */


class Solution {

    func removeDuplicateLetter2(_ s: String) -> String {
        var cnt = Array(repeating: 0, count: 26)
        let codes = Array(s.utf8).map { Int($0 - 97) }
        var pos = 0, i = 0 // the position for the smallest s[i]
        while i < codes.count {
            cnt[codes[i]] += 1
            i += 1
        }
        i = 0
        while i < codes.count {
            if codes[i] < codes[pos] {
                pos = i
            }
            cnt[codes[i]] -= 1
            if cnt[codes[i]] == 0 {
                break
            }
            i += 1
        }
        if codes.count == 0 {
            return ""
        } else {
            let a = String(s[s.index(s.startIndex, offsetBy: pos)])
            var b = String(s[s.index(s.startIndex, offsetBy: pos + 1)..<s.endIndex])
            b = b.replacingOccurrences(of: a, with: "")
            return a + removeDuplicateLetters(b)
        }
    }

    func removeDuplicateLetters(_ s: String) -> String {
        var cnt = Array(repeating: 0, count: 26)
        var codes = Array(s.utf8).map { Int($0 - 97) }
        var i = 0 // the position for the smallest s[i]
        while i < codes.count {
            cnt[codes[i]] += 1
            i += 1
        }
        return removeDuplicateLetter(&codes, &cnt, 0)
    }

    func removeDuplicateLetter(_ codes: inout [Int], _ cnt: inout [Int], _ start: Int) -> String {
        guard start < codes.count else {
            return ""
        }
        var i = start, start = start
        while i < codes.count {
            if codes[i] < codes[start] {
                start = i
            }
            if cnt[codes[i]] == 0 {
                break
            }
            i += 1
        }
        if codes.count == 0 {
            return ""
        } else {
            let value = codes[start]
            let a = String(data: Data(bytes: [UInt8(value) + 97]), encoding: .utf8)!
            codes = Array(codes[start..<codes.count])
            codes = codes.filter { $0 != value }
            return a + removeDuplicateLetter(&codes, &cnt, 0)
        }
    }
}

//print(Solution().removeDuplicateLetters("bcabc"))
//print(Solution().removeDuplicateLetters("bddbccd"))
print(Solution().removeDuplicateLetters("cbacdcbc"))
//print(Solution().removeDuplicateLetters("thesqtitxyetpxloeevdeqifkz"))



