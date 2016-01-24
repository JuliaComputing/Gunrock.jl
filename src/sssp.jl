"""
Computes shortest distance of every node from a given source.

Input:
-----
* G::SparseMatrixCSC
* root::Int

Output:
------
* sssp_dist::Vector{Int32}

"""
function sssp(G::SparseMatrixCSC, root::Int)
	rows = G.colptr - 1
    cols = G.rowval - 1
    nodes = length(rows) - 1
    edges = length(cols)
    rows = map(Int32, rows)
    cols = map(Int32, cols)
	vals = ones(Cint, edges)
    sssp_dist = Array(Cuint, nodes)
	ccall((:sssp, path_to_gunrock), Void, (Ptr{Cuint}, Int, Int, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Int), sssp_dist, nodes, edges, rows, cols, vals, root - 1)
	sssp_dist
end
