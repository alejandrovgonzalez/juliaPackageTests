arch = Sys.ARCH
expert = haskey(ENV, "QUEST_EXPERT2") ? ENV["QUEST_EXPERT2"] : false

if expert || expert == "1"
    @info "expert"
else
    @info "not expert"
end
function build(precision::Int, isWindows::Bool)::Nothing
    run(`git clone https://github.com/QuEST-Kit/QuEST.git`)
    cd("QuEST")
    mkdir("build")
    cd("build")

    isWindows ? wait(run(`cmake -DPRECISION=$precision .. -G "MinGW Makefiles"`)) :
                wait(run(`cmake -DPRECISION=$precision ..`))
    wait(run(`make`))
end

if false
    @info "QUEST_EXPERT environment variable not found."
    if !ispath("./QuEST") || isempty(readdir("./QuEST"))
        if Symbol("x86_64") == arch && Sys.isunix()
            build(2, false)
        elseif Symbol("x86_64") == arch && Sys.iswindows()
            build(2, true)
        elseif Symbol("x86_32") == arch && Sys.isunix()
            build(1, false)
        elseif Symbol("x86_32") == arch && Sys.iswindows()
            build(1, true)
        else
            error("Architecture/OS not supported.")
        end
    end
else
    @info "QUEST_EXPERT environment variable found."
end 
