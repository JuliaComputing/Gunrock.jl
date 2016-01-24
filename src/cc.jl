"""
Computes number of connected components and the component ID for every node.

Input:
-----
* G::SparseMatrixCSC

Output:
------
* num_cc ::Int32
* conn_comp::Vector{Int32}

"""
function cc(G::SparseMatrixCSC)
	rows = G.colptr - 1
    cols = G.rowval - 1
    nodes = length(rows) - 1
    edges = length(cols)
    rows = map(Int32, rows)
    cols = map(Int32, cols)
    conn_comp = Array(Int32, nodes)
	num_cc = ccall((:cc, path_to_gunrock), Cint, (Ptr{Cint}, Int, Int, Ptr{Cint}, Ptr{Cint}), conn_comp, nodes, edges, rows, cols)
    conn_comp += 1
	num_cc, conn_comp
end
