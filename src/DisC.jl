

module DisC

include("menu.jl")

function __init__()
    # discretization_method::Symbol   # Método de discretização
    # discretization_bins::Int        # Número de faixas da discretização
    # codification_method::Symbol     # Método de codificação

    discretization_menu()
end

end