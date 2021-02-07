println("Building package...")
arch = Sys.ARCH

function build(precision::Int, isWindows::Bool)::Nothing
    # Check if QuEST is already cloned
    if !ispath("./QuEST") && size(readdir("testt"))[0]
        run(`git clone git@github.com:QuEST-Kit/QuEST.git`)
        cd("QuEST")
        run(`mkdir build`)
        cd("build")
    end

    isWindows ? run(`cmake -DPRECISION=$precision .. -G "MinGW Makefiles"`) :
                run(`cmake -DPRECISION=$precision ..`)
    wait(run(`make`))
end


# Example of environment variable handling
# if haskey(ENV, "MYTEST")
#    println("Found env var")
#    precision = ENV["MYTEST"]
#    run(`mkdir build1`)
#    cd("build1")
#    run(`cmake -DQuEST_PREC=$precision ..`)
#    run(`make`)
#    cd(..)
#    run(`mkdir build2`)
#    cd(build2)
#    run(`cmake ..`)
#    run(`make`)
# else
#    println("Didn't find env var")
# end
run(`mkdir testt`)
fs = readdir("testt")
cd("testt")
run(`touch hola.txt`)
cd("..")
println(size(fs))


if Symbol("x86_64") == arch && Sys.isunix()
    println("Correct if!")
    # cd("/home/hopery/Documents/job/testing/QuEST/build")
    # build(2, false)
elseif Symbol("x86_64") == arch && Sys.iswindows()
    build(2, true)
elseif Symbol("x86_32") == arch && Sys.isunix()
    build(1, false)
elseif Symbol("x86_32") == arch && Sys.iswindows()
    build(1, true)
else
    error("Architecture/OS not supported")
end

println("Building process finished.")