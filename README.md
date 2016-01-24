# Gunrock.jl

This is a Julia wrapper around Gunrock, an open source library for graph computations on the GPU. The original library is [here](https://github.com/gunrock/gunrock).

There are currently five algorithms that Gunrock.jl supports:
* Breadth-first Search
* Betweenness Centrality
* Connected Components
* Pagerank
* Single-source Shortest Path

## Setting up
First, clone the Gunrock library and follow the instructions on how to build it [here](https://github.com/gunrock/gunrock/blob/master/doc/building_gunrock.md). This should have built a `libgunrock.so` file in the path `"path_to_gunrock/build/lib/"`

Next, clone the package by doing:
```
Pkg.clone("https://github.com/JuliaComputing/Gunrock.jl.git")
```

Finally, go to your `.julia` folder "~/.julia/version/Gunrock/src/" and edit a file named `consts.jl`. Modify the `path_to_gunrock` variable to `"path_to_gunrock/build/lib/libgunrock.so`"

## Basic Usage
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
