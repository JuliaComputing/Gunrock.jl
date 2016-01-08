function cc(G::SparseMatrixCSC, root::Int)
	rows = G.colptr - 1
    cols = G.rowval - 1
    nodes = length(rows) - 1
    edges = length(cols)
    rows = map(Int32, rows)
    cols = map(Int32, cols)
    conn_comp = Array(Int32, nodes)
	num_cc = ccall((:bfs, path_to_gunrock), Cint, (Ptr{Cint}, Int, Int, Ptr{Cint}, Ptr{Cint}, Int), conn_comp, nodes, edges, rows, cols, root - 1)
    conn_comp += 1
	num_cc, conn_comp
end
