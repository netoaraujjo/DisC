

module DisC

include("util.jl")
include("menu.jl")
include("file_manager.jl")

function __init__()

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
    codification_method = codification_menu()

    describe(data)
end

end