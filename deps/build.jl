println("Building package...")
arch = Sys.ARCH

if Sys.isunix() && Sys.islinux()
    println("cool!")
end

run(`git clone git@github.com:QuEST-Kit/QuEST.git`)

if haskey(ENV, "MYTEST")
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
    #println("Found environment variable")
    #run(`touch test.txt`)
    #println(precision)
    #run(pipeline(`echo precision`,`test.txt`))
    #cmake -DQuEST_PREC=$precision
else
    println("Didn't find env var")
end