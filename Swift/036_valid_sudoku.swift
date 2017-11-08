/*
 * Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
 *
 * The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 */





class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        if board.count != 9 {
            return false
        }
        if board[0].count != 9 {
            return false
        }
        var vset = Array(repeating: 0, count: 9)
        var hset = Array(repeating: 0, count: 9)
        var bckt = Array(repeating: 0, count: 9)
        var idx = 0
        for i in 0..<9 {
            for j in 0..<9 {
                if let pt = Int(String(board[i][j])) {
                    let cubeIdx = (i / 3) * 3 + j / 3
                    idx = 1 << pt
//                    print("index", i, j, cubeIdx, pt, idx)
//                    print("source", hset[i], vset[j], bckt[cubeIdx])
                    print("test", hset[i] & idx, vset[j] & idx, bckt[cubeIdx] & idx)
                    if ((hset[i] & idx) > 0 ||
                        (vset[j] & idx) > 0 ||
                        (bckt[cubeIdx] & idx) > 0) {
                        print(hset, vset, bckt)
                        return false
                    }
                    hset[i] |= idx
                    vset[j] |= idx
                    bckt[cubeIdx] |= idx
                }
            }
        }
        print(hset, vset, bckt)
        return true
    }
}

var test: [[Character]] = [
    ["1","8","7","6","5","4","3","2","1"],
    ["2",".",".",".",".",".",".",".","."],
    ["3",".",".",".",".",".",".",".","."],
    ["4",".",".",".",".",".",".",".","."],
    ["5",".",".",".",".",".",".",".","."],
    ["6",".",".",".",".",".",".",".","."],
    ["7",".",".",".",".",".",".",".","."],
    ["8",".",".",".",".",".",".",".","."],
    ["9",".",".",".",".",".",".",".","."]]
print(Solution().isValidSudoku(test))

//var test1: [[Character]] = [
//    [".",".",".",".",".",".",".",".","."],
//    ["5",".",".",".",".",".",".",".","."],
//    [".","7","1",".",".",".","4",".","."],
//    [".",".",".",".",".",".",".",".","5"],
//    ["8","5",".",".",".","3",".",".","."],
//    [".",".","4",".",".","7",".","5","6"],
//    [".",".",".",".",".",".","8",".","."],
//    [".",".",".","2",".",".",".",".","."],
//    [".",".",".",".",".","6",".",".","."]]
//print(Solution().isValidSudoku(test1))
//
//var test2: [[Character]] = [
//    [".",".",".",".",".",".",".",".","2"],
//    ["2",".",".","5",".",".",".",".","8"],
//    ["9",".",".","1","3",".",".",".","."],
//    [".",".",".",".",".",".","8",".","2"],
//    [".",".",".",".",".",".",".",".","."],
//    [".","2",".",".",".","9",".",".","."],
//    ["7","9",".",".",".",".","2",".","."],
//    [".",".",".",".",".",".",".",".","."],
//    [".",".",".",".",".","8","3",".","1"]]
//print(Solution().isValidSudoku(test2))
//

