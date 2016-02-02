"""
Computes BFS tree of a Graph from a given source. It returns the levels of each node with respect to source starting from level 1. 

Input:
-----
* G::SparseMatrixCSC
* root::Int

Output:
------
* bfs_labels::Vector{Int32}

"""
function bfs(G::SparseMatrixCSC, root::Int)
	rows = G.colptr - 1
    cols = G.rowval - 1
    nodes = length(rows) - 1
    edges = length(cols)
    rows = map(Int32, rows)
    cols = map(Int32, cols)
    bfs_label = Array(Int32, nodes)
	ccall((:bfs, gunrock_lib), Void, (Ptr{Cint}, Int, Int, Ptr{Cint}, Ptr{Cint}, Int), bfs_label, nodes, edges, rows, cols, root - 1)
    bfs_label += 1
	bfs_label
end
