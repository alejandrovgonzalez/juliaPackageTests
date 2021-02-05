println("Building package...")
arch = Sys.ARCH

if Sys.isunix() && Sys.islinux()
    println("cool!")
end

#git clone https://github.com/quest-kit/QuEST

if haskey(ENV, "MYTEST")
    precision = ENV["MYTEST"]
    run(`mkdir build1`)
    run(`cd build1`)
    run(`cmake -DQuEST_PREC=$precision ..`)
    run(`make`)
    run(`mkdir build2`)
    run(`cd build1`)
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