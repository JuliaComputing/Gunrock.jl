rows = [0, 3, 6, 11, 15, 19, 23, 26]
cols = [1, 2, 3, 0, 2, 4, 0, 1, 3, 4, 5, 0, 2, 5, 6, 1, 2, 5, 6, 2, 3, 4, 6, 3, 4, 5]
vals = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
rows = map(x-> Int32(x), rows)
cols = map(x-> Int32(x), cols)
nodes = length(rows) - 1
edges = length(cols)
colptr = rows + 1
rowval = cols + 1
nzval = vals 
m = nodes
SparseMatrixCSC(m, m, colptr, rowval, nzval)
