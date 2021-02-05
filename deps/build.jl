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