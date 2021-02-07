println("Building package...")

# Check if QuEST is already cloned
if !ispath("./QuEST")
    run(`git clone git@github.com:QuEST-Kit/QuEST.git`)
end

# Example of environment variable handling
if haskey(ENV, "MYTEST")
    println("Found env var")
    precision = ENV["MYTEST"]
    run(`mkdir build1`)
    cd("build1")
    run(`cmake -DQuEST_PREC=$precision ..`)
    run(`make`)
    cd(..)
    run(`mkdir build2`)
    cd(build2)
    run(`cmake ..`)
    run(`make`)
else
    println("Didn't find env var")
end

println("Building process finished.")