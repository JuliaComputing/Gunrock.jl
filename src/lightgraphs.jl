@require LightGraphs begin 

using LightGraphs

bfs(g::Graph, r::Integer) = bfs(adjacency_matrix(g), r)
cc(g::Graph) = cc(adjacency_matrix(g))
sssp(g::Graph, r::Integer) = sssp(adjacency_matrix(g), r)
pagerank(g::Graph) = pagerank(adjacency_matrix(g))
bc(g::Graph, r::Integer) = bc(adjacency_matrix(g), r)

end
