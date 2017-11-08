
/*
 * n = 3
 * 0   4
 * 1 3 5
 * 2   6
 *
 * n = 4
 * 0     6
 * 1   5 7
 * 2 4   8
 * 3     9
 *
 * n = 5
 * 0       8
 * 1     7 9
 * 2   6   10
 * 3 5     11
 * 4       12
 */

class Solution {

    /* zigzag's number count is numRows - 2 in each group, seporate one line and one zigzag */
    /* each column value */
    /* n = 3   0, 4, 8 */
    /* n = 4   0, 6, 12 */
    /* n = 5   0, 8, 16 */
    /* m = n   0, 2(n - 1) * k; k = 1, 2, 3  ... */

    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        let characters = s.characters.map { String($0) }
        var result: [[String]] = Array(repeating: [String](), count: numRows)
        var line = 0, k = 1
        for (i, character) in characters.enumerated() {
            let column = 2 * k * (numRows - 1)
            let middleValues = numRows - 2
            /* print(i, line, column, column - numRows, k) */
            result[line].append(character)
            if i < column && i >= column - middleValues - 1 {
                line -= 1
            } else {
                line += 1
            }
            if i > column {
                k += 1
            }
        }
        return result.map { $0.joined(separator:"") }.joined(separator: "")
    }
}

print(Solution().convert("PAYPALISHIRING", 3))
print(Solution().convert("AB", 1))
print(Solution().convert("ABC", 2))
print(Solution().convert("PAYPALISHIRING", 4))

