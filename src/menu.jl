#=
=#

#
#

function read_separator()
    display_banner()
    print("   Informe o caractere separador: ")
    separator = read(STDIN, Char);read(STDIN, Char)
    return separator
end


function has_header()
    display_banner()
    print("   O arquivo possui cabeçalho? (y/n): ")
    answer = read(STDIN, Char);read(STDIN, Char)

    if answer == 'Y' || answer == 'y'
        return true
    else
        return false
    end
end


function main_menu()
    main_menu = 
    """
       --------------------
          Menu Principal
       --------------------
       1 - Selecionar método de discretização
       2 - Selecionar método de codificação
       3 - Executar
       4 - Sair

    """
    print(main_menu)
    print("   Opção: ")

    opcao = read(STDIN, Char)
    return opcao
end

# Show menu to select the discretization method
function discretization_menu()
    discretization_options = [:none, :ewd, :efd, :bayesian]
    option = 0
    valid = true

    while true

        display_banner()

        discretization_menu =
        """
           -----------------------------
              Método de Discretização
           -----------------------------
           1 - Nenhum
           2 - Larguras Iguais (EWD)
           3 - Frequências iguais (EFD)
           4 - Bayesian Blocks
           5 - Ajuda
           6 - Sair

        """

        print(discretization_menu)

        if !valid
            println("   Opção inválida! Tente novamente.\n")
        end

        print("   Opção: ")

        try
            option = parse(Int, readline())
        catch
            valid = false
            continue
        end

        if 1 <= option <= 4
            return discretization_options[option]
        elseif option == 5
            # exibe ajuda
        elseif option == 6
            exit()
        else
            valid = false
        end
    end
end


function select_uniform_nbins()
    nbins_methods = [:manual, :sqrt, :sturges, :rice, :doane, :scott, :fd, :auto]

    option = 0
    valid = true

    while true
        display_banner()

        nbins_selection =
        """
           -----------------------------------------------
              Método de seleção do número de intervalos
           -----------------------------------------------
           1  - Manual
           2  - sqrt
           3  - sturges
           4  - rice
           5  - doane
           6  - scott
           7  - fd
           8  - auto
           9  - Ajuda
           10 - Sair

        """

        print(nbins_selection)

        if !valid
            println("   Opção inválida! Tente novamente.\n")
        end

        print("   Opção: ")

        try
            option = parse(Int, readline())
        catch
            valid = false
            continue
        end

        if 1 <= option <= 8
            return nbins_methods[option]
        elseif option == 9
            # exibe ajuda
        elseif option == 10
            exit()
        else
            valid = false
        end

    end
end

# read the bins number to be used for the discretization method
function read_nbins()
    valid_nbin = true
    while true
        display_banner()

        if !valid_nbin
            println("   Você deve fornecer um número inteiro!\n")
        end

        print("   Informe o número de intervalos para discretização: ")
        try
            nbins = parse(Int, readline())
            return nbins
        catch
            valid_nbin = false
        end
    end
end

# Show discretization help
function discretization_help()
    # exibir ajuda para discretização
end

# Show menu to select the codification method
function codification_menu()
    codification_options = [:none, :default]
    option = 0
    valid = true

    while true
        display_banner()

        codification_menu = 
        """
           ---------------------------
              Método de Codificação
           ---------------------------
           1 - Nenhum
           2 - Padrão
           3 - Ajuda
           4 - Sair

        """
        print(codification_menu)

        if !valid
            println("   Opção inválida! Tente novamente.\n")
        end

        print("   Opção: ")

        try
            option = parse(Int, readline())
        catch
            valid = false
            continue
        end

        if 1 <= option <= 2
            return codification_options[option]
        elseif option == 3
            # exibe ajuda
        elseif option == 4
            exit()
        else
            valid = false
        end
    end
end

# Show codification method
function codification_help()
    # exibe ajuda para codificação
end