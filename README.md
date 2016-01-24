# Gunrock.jl

This is a Julia wrapper around Gunrock, an open source library for graph computations on the GPU. The original library is [here](https://github.com/gunrock/gunrock).

There are currently five algorithms that Gunrock.jl supports:
* Breadth-first Search
* Betweenness Centrality
* Connected Components
* Pagerank
* Single-source Shortest Path

## Basic Usage
First, clone the package by doing:
```
Pkg.clone("https://github.com/JuliaComputing/Gunrock.jl.git")
```
Gunrock interacts with graphs via sparse matrices.
```
using Gunrock

a = sprand(100,100,0.1) 
a = a + a' #to make it symmetric

bfs(a,1)
bc(a,1)
cc(a)
pagerank(a)
sssp(a)
```
