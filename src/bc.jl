function bc(G::SparseMatrixCSC, root::Int)
	rows = G.colptr - 1
    cols = G.rowval - 1
    nodes = length(rows) - 1
    edges = length(cols)
    rows = map(Int32, rows)
    cols = map(Int32, cols)
    bc_scores = Array(Cfloat, nodes)
	ccall((:bc, path_to_gunrock), Void, (Ptr{Cfloat}, Int, Int, Ptr{Cint}, Ptr{Cint}, Int), bc_scores, nodes, edges, rows, cols, root - 1)
	bc_scores
end
