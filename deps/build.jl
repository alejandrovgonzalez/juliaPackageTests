println("Second commit")
println("Building package")
arch = Sys.ARCH
if Symbol(x86_64) == arch
    error("64")
else
    error("Not 64")
end

if Sys.isunix() && Sys.islinux()
    println("cool!")
end

git clone https://github.com/quest-kit/QuEST
mkdir folder1
mkdir folder2
if haskey(ENV, "MYTEST")
    println("Found environment variable")
    precision = ENV["QuEST_PREC"]
    touch test.txt
    echo precision >> test.txt
    #cmake -DQuEST_PREC=$precision
else
    println("Didn't find env var")
    #cmake
end