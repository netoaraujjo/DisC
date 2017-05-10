

module DisC

include("util.jl")
include("menu.jl")
include("file_manager.jl")
include("discretization.jl")
include("codification.jl")
include("data_analisys.jl")

function __init__()

    nbins = 0

    if length(ARGS) == 1 
        input_file = ARGS[1]
    else
        display_banner()
        println("   O data set deve ser informado!")
        exit()
    end

    input_file_dir = dirname(input_file)
    input_file_name = String(split(basename(input_file), '.')[1]) # nome do arquivo sem extensao

    separator = read_separator()
    header = has_header()

    data = read_file(input_file, separator, header)

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

    display_banner()
    it = time()

    # analise de dados
    println("   Renderizando análise dos dados...")
    plot_attributes_graph(input_file_dir, input_file_name, data)


    # discretização
    println("   Realizando Discretização dos dados...")
    data = discretize!(data, discretization_method, nbins)
    # println(data)


    # codificação
    println("   Realizando codificação dos dados...")
    data = data_encode!(data, codification_method)
    # println(data)


    # salva resultado
    println("   Salvando resultados...")
    output_file_name = split(basename(input_file), '.')[1]
    output_file = string(dirname(input_file), "/", output_file_name, "_result")

    write_file(data, output_file, separator, header)

    ft = time()

    println("   Processo concluído em $(ft-it) segundos.")

end

end