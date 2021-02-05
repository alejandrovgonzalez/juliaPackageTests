println("Update test...")
println("Building package")
x = Sys.ARCH
if string(x) == "x86_64"
    println("64")
else
    error("Not 64")
end

if Sys.isunix() && Sys.islinux()
    println("cool!")
end
