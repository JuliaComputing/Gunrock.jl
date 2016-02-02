#Set Gunrock path
let
    global gunrock_lib
    succeeded = false
    if !isdefined(:gunrock_lib)
        @linux_only lib = "libgunrock.so"
        Libdl.dlopen(lib)
        succeeded = true
        succeeded || error("Gunrock library not found")
        @eval const gunrock_lib = $lib
    end
end
        
