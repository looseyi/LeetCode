class Solution {

    var totalCount = 0

    func solveNQueens(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        var cols = Array(repeating: false, count: n)
        var main_diag = Array(repeating: false, count: n * 2)
        var anti_diag = Array(repeating: false, count: n * 2)
        let emptyStr = Array(repeating: ".", count: n)

        let mapTrue = (true, true, true)
        let mapFalse = (false, false, false)

        func solveNQueensRecu(_ solution: [Int], _ row: Int, _ n: Int) {
            // 完整的一次遍历
            if row == n {
                totalCount += 1
            } else {
                for i in 0..<n {
                    if (cols[i], main_diag[row + i], anti_diag[row - i + n]) == mapFalse {
                        (cols[i], main_diag[row + i], anti_diag[row - i + n]) = mapTrue
                        solveNQueensRecu(solution + [i], row + 1, n)
                        (cols[i], main_diag[row + i], anti_diag[row - i + n]) = mapFalse
                    }
                }
            }
        }
        solveNQueensRecu([], 0, n)
        return totalCount
    }


    func solveNQueensDFS(_ n: Int) -> Int {
        guard n > 0 else {
            return 0
        }
        var loc = Array(repeating: 0, count: n)
        dfs(&loc, 0, n)
        return totalCount
    }

    func dfs(_ loc: inout [Int], _ row: Int, _ n: Int) {
        if row == n {
            totalCount += 1
            return
        }
        // try use 0 ~ n as column index
        for i in 0..<n {
            loc[row] = i
            if isValid(loc, row, i) {
                dfs(&loc, row + 1, n)
            }
        }
    }
    func isValid(_ loc: [Int], _ row: Int, _ col: Int) -> Bool {
        var c = -1
        for i in 0..<row {
            c = loc[i]
            // cannot have same column number
            if c == col {
                return false
            }
            // or cannot be on same diagonal
            if abs(c - col) == abs(i - row){
                return false
            }
        }
        return true
    }
}


//print(Solution().solveNQueens(3))
//print(Solution().solveNQueens(4))
//print(Solution().solveNQueens(5))

//print(Solution().solveNQueensDFS(3))
print(Solution().solveNQueensDFS(4))
//print(Solution().solveNQueensDFS(5))



