println("Second commit")
println("Building package")
arch = Sys.ARCH

if Sys.isunix() && Sys.islinux()
    println("cool!")
end

#git clone https://github.com/quest-kit/QuEST
run(`mkdir folder1`)
run(`mkdir folder2`)
if haskey(ENV, "MYTEST")
    println("Found environment variable")
    #precision = ENV["QuEST_PREC"]
    run(`touch test.txt`)
    run(`echo precision '>>' test.txt`)
    #cmake -DQuEST_PREC=$precision
else
    println("Didn't find env var")
    #cmake
end