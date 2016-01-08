function pagerank(G::SparseMatrixCSC)
	rows = G.colptr - 1
    cols = G.rowval - 1
    nodes = length(rows) - 1
    edges = length(cols)
    rows = map(Int32, rows)
    cols = map(Int32, cols)
    top_nodes = Array(Int32, nodes)
    top_ranks = Array(Cfloat, nodes)
	ccall((:pagerank, "/home/ubuntu/gunrock2/build/lib/libgunrock"), Void, (Ptr{Cint}, Ptr{Cfloat}, Int, Int, Ptr{Cint}, Ptr{Cint}), top_nodes, top_ranks, nodes, edges, rows, cols)
    top_nodes += 1
	top_nodes, top_ranks
end
