class Solution(object):
    def isValidSudoku(self, board):
        for i in range(9):
            row, col, dia = [0]*10, [0]*10, [0]*10
            for j in range(9):
                if board[i][j] != '.':
                    row[int(board[i][j])] += 1
                if board[j][i] != '.':
                    col[int(board[j][i])] += 1
                if board[(i//3)*3 + (j//3)][(i%3)*3 + (j%3)] != '.':
                    dia[int(board[(i//3)*3 + (j//3)][(i%3)*3 + (j%3)])] += 1
            for j in range(10):
                if row[j] > 1 or col[j] > 1 or dia[j] > 1:
                    return False

        return True
