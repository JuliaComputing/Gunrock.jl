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

Add the location of `libgunrock.so` to your `LD_LIBRARY_PATH`. 

Next, install the package by doing:
```
Pkg.add("Gunrock")
```

## Basic Usage
Gunrock interacts with graphs via sparse matrices.
```julia
using Gunrock

a = sprand(100,100,0.1) 
a = a + a' #to make it symmetric

bfs(a,1)
bc(a,1)
cc(a)
pagerank(a)
sssp(a)
```

## Performance
Let's generate a 2D square 5-point mesh, using [Meshpart](https://github.com/JuliaSparse/Meshpart.jl) with 1 million nodes.
```julia
using Meshpart
a = Meshpart.grid5(1000,1000)
```
We shall now perform a comparison with the [LightGraphs](https://github.com/JuliaGraphs/LightGraphs.jl) package for graph algorithms, which is a purely single-threaded CPU implementation. 
```julia
using LightGraphs
g1 = Graph(a)
g2 = DiGraph(a)
```
The following chart compares the performance of Gunrock with LightGraphs:

![perf](https://cloud.githubusercontent.com/assets/9101377/12712098/a53bd896-c8eb-11e5-9219-bb0f15b7e757.png)

### Note
This release currently works only on Linux. Future releases will support Mac OSX and Windows. 
