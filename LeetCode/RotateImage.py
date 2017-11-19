class Solution(object):
    def rotate(self,matrix):
        self.flip_up_and_down(matrix)
        self.flip_diagonal(matrix)

    def flip_up_and_down(self, matrix):
        n = len(matrix)
        for i in range(n/2):
            for j in range(n):
                matrix[i][j] = matrix[i][j] + matrix[n-1-i][j];
                matrix[n-1-i][j] = matrix[i][j] - matrix[n-1-i][j];
                matrix[i][j] = matrix[i][j] - matrix[n-1-i][j];

    def flip_diagonal(self, matrix):
        n = len(matrix)
        for i in range(n):
            for j in range(i):
                matrix[i][j] = matrix[j][i] + matrix[i][j];
                matrix[j][i] = matrix[i][j] - matrix[j][i];
                matrix[i][j] = matrix[i][j] - matrix[j][i];

s = Solution()
a = [[1,2,3],[4,5,6],[7,8,9]]
s.rotate(a)
print a
