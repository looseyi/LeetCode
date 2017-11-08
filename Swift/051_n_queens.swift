class Solution {

    var result: [[String]]
    init() {
        result = [[String]]()
    }

    func print(_ loc: [Int], _ n: Int) {
        var solution = [String]()
        for row in 0..<n {
            var r = [String]()
            for i in 0..<n {
                r.append(i == loc[row] ? "Q" : ".")
            }
            solution.append(r.joined(separator: ""))
        }
        result.append(solution)
    }

    func solveNQueens(_ n: Int) -> [[String]] {
        var cols = Array(repeating: false, count: n)
        var main_diag = Array(repeating: false, count: n * 2)
        var anti_diag = Array(repeating: false, count: n * 2)
        let emptyStr = Array(repeating: ".", count: n)

        let mapTrue = (true, true, true)
        let mapFalse = (false, false, false)

        func solveNQueensRecu(_ solution: [Int], _ row: Int, _ n: Int) {
            // 完整的一次遍历
            if row == n {
                print(solution, n)
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
        return result
    }


    func solveNQueensDFS(_ n: Int) -> [[String]] {
        var loc = Array(repeating: 0, count: n)
        dfs(&loc, 0, n)
        return result
    }
    func dfs(_ loc: inout [Int], _ row: Int, _ n: Int) {
        if (row == n) {
            print(loc, n)
            return
        }
        // try use 0 ~ n as column index
        for i in 0..<n {
            loc[row] = i;
            if isValid(loc, row) {
                dfs(&loc, row + 1, n);
            }
        }
    }
    func isValid(_ loc: [Int], _ row: Int) -> Bool {
        for i in 0..<row {
            // cannot have same column number
            // or cannot be on same diagonal
            if loc[i] == loc[row] || row - i == abs(loc[i] - loc[row]){
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


