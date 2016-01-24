using Base.Test
using Gunrock

a = include("init.jl")

#BFS
@test bfs(a,1) == [1, 2, 2, 2, 3, 3, 3]

#Node betweenness centrality 
@test bc(a,1) == [0.0, 0.25, 0.5, 0.75, 0.0, 0.0, 0.0]

#Connected components 
num_cc, ids = cc(a)
@test num_cc == 1
@test ids == [1, 1, 1, 1, 1, 1, 1]

#Single source shortest paths
@test sssp(a,1) == [0, 1, 1, 1, 2, 2, 2]

#Pagerank
nodes, ranks = pagerank(a)
@test nodes == [3, 4, 5, 6, 1, 2, 7]
@test_approx_eq ranks [1.2522, 1.0280, 1.0280, 1.0201, 0.8048, 0.8048, 0.7991]
