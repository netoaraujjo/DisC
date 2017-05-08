

module DisC

include("util.jl")
include("menu.jl")
include("file_manager.jl")
include("discretization.jl")

function __init__()

    nbins = 0

    if length(ARGS) == 1 
        data_set = ARGS[1]
    else
        display_banner()
        println("   O data set deve ser informado!")
        exit()
    end

    separator = read_separator()
    header = has_header()

    data = read_file(data_set, separator, header)

    discretization_method = discretization_menu()

    if discretization_method != :none
        if discretization_method == :ewd
            uniform_nbins_method = select_uniform_nbins()
            if uniform_nbins_method == :manual
                nbins = read_nbins()
            else
                nbins = uniform_nbins_method
            end
        elseif discretization_method == :efd
            nbins = read_nbins()
        end
    end

    codification_method = codification_menu()

    # descrição dos dados

    # discretização
    data = discretize!(data, discretization_method, nbins)
    println(data)

    # codificação

    # salva resultado
    write_file(data, "iris_result", separator, false)

end

end