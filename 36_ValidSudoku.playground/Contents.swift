import UIKit

/*
 断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
 
 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 
 
 上图是一个部分填充的有效的数独。
 
 数独部分空格内已填入了数字，空白格用 '.' 表示。
 
 示例 1:
 
 输入:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 输出: true
 示例 2:
 
 输入:
 [
 ["8","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 输出: false
 解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
 但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
 说明:
 
 一个有效的数独（部分已被填充）不一定是可解的。
 只需要根据以上规则，验证已经填入的数字是否有效即可。
 给定数独序列只包含数字 1-9 和字符 '.' 。
 给定数独永远是 9x9 形式的。
 */

let image = UIImage(named: "250px-Sudoku-by-L2G-20050714.png")
let imageView = UIImageView(image: image)
imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

//my solution
func isValidSudoku(_ board: [[Character]]) -> Bool {
    //check row
    for i in 0..<board.count {
        let row = board[i]
        var nums = [Character]()
        
        for j in 0..<row.count {
            if row[j] != "." {
                if nums.contains(row[j]) == false {
                    nums.append(row[j])
                } else {
                    return false
                }
            }
        }
    }
    
    //check col
    for i in 0..<board.count {
        var cols = [Character]()
        let row = board[i]
        for j in 0..<row.count {
            if board[j][i] != "." {
                if cols.contains(board[j][i]) == false {
                    cols.append(board[j][i])
                } else {
                    return false
                }
            }
        }
    }
    
    //check sub board
    for i in stride(from: 0, to: board.count, by: 3) {
        for j in stride(from: 0, to: board.count, by: 3) {
            var subBoard = [Character]()
            for n in 0..<3 {
                for m in 0..<3 {
                    if board[i + n][j + m] != "." {
                        if subBoard.contains(board[i + n][j + m]) == false {
                            subBoard.append(board[i + n][j + m])
                        } else {
                            return false
                        }
                    }
                }
            }
        }
    }
    return true
}


//better solution

func isValidSudoku_better(_ board: [[Character]]) -> Bool {
    func isValid(_ board: [[Character]],_ row: Int,_ col: Int,_ c: Character) -> Bool {
        func isExistInRow(_ board: [[Character]],_ row: Int,_ col: Int, _ c: Character) -> Bool {
            for i in 0..<board.count {
                if board[row][i] == c && i != col{
                    return true
                }
            }
            return false
        }
        func isExistInCol(_ board: [[Character]],_ row: Int,_ col: Int, _ c: Character) -> Bool {
            for i in 0..<board.count {
                if board[i][col] == c && i != row{
                    return true
                }
            }
            return false
        }
        func isExistInSmallGird(_ board: [[Character]],_ startRow: Int, _ startCol: Int,_ row: Int,_ col: Int,_ c: Character) -> Bool {
            for i in 0..<3 {
                for j in 0..<3 {
                    if board[i + startRow][j + startCol] == c && i + startRow != row && j + startCol != col {
                        return true
                    }
                }
            }
            return false
        }
        let startRow = row - row % 3
        let startCol = col - col % 3
        return !isExistInCol(board, row, col, c) && !isExistInRow(board, row, col, c) && !isExistInSmallGird(board, startRow, startCol, row, col, c)
    }
    for i in 0..<9 {
        for j in 0..<9 {
            if board[i][j] != Character.init(".") {
                if isValid(board, i, j, board[i][j]) == false {
                    return false
                }
            }
        }
    }
    return true
}
