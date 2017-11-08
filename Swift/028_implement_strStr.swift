class Solution {
    //优化过后的next 数组求法
    func getNextval(p: String, next: inout [Int]) {
        next[0] = -1
        let chars = Array(p.characters)
        let pLen = chars.count
        var k = -1, j = 0

        while j < pLen - 1 {
            //p[k]表示前缀，p[j]表示后缀
            if k == -1 || chars[j] == chars[k] {
                j += 1
                k += 1
                //较之前next数组求法，改动在下面4行
                if chars[j] != chars[k] {
                    next[j] = k   //之前只有这一行
                } else {
                    //因为不能出现p[j] = p[ next[j ]]，所以当出现时需要继续递归，k = next[k] = next[next[k]]
                    next[j] = next[k]
                }
            } else {
                k = next[k]
            }
        }
    }

    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle == haystack || needle.isEmpty {
            return 0
        }
        if haystack.isEmpty {
            return -1
        }
        var next = Array(repeating: -1, count: needle.characters.count)
        getNextval(p: needle, next: &next)

        var i = 0, j = 0
        let sArray = Array(haystack.characters)
        let pArray = Array(needle.characters)
        let sLen = sArray.count
        let pLen = pArray.count
        while i < sLen && j < pLen {
            if (j == -1 || sArray[i] == pArray[j]) {
                i += 1
                j += 1
            } else {
                //next[j]即为j所对应的next值
                j = next[j]
            }
        }
        if j == pLen {
            return i - j
        } else {
            return -1
        }
    }
}


let s = "a"
let p = ""
/* let s = "BBC ABCDAB ABCDABCDABDE" */
/* let p = "ABCDABD" */
print(Solution().strStr(s, p))
