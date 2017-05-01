#=
=#

#
#

function clear_screen()
    run(is_unix()? `clear` : `cmd /c cls`)
end

function display_banner()
    clear_screen()

    banner = 
    """
        ___    _   ____    ___   
       |   \\  | | |   _|  / __|  | Discretization and Codification Tool
       | |\\ \\ | | |_ |_  | /     | Github: https://github.com/netoaraujjo/DisC
       | |/ / | |  _|  | | \\__   |
       |___/  |_| |____|  \\___|  | Version: 0.0.1

    """

    print(banner)
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


function discretization_menu()
    discretization_options = [:ewd, :efd, :auto]

    valid = true
    while true

        display_banner()

        discretization_menu =
        """
           -----------------------------
              Método de Discretização
           -----------------------------
           1 - Larguras Iguais (EWD)
           2 - Frequências iguais (EFD)
           3 - Automático
           4 - Ajuda
           5 - Sair

        """

        print(discretization_menu)

        if !valid
            println("   Opção inválida! Tente novamente.\n")
        end

        print("   Opção: ")

        # option = read(STDIN, 1)[1]; read(STDIN, Char)
        option = read(STDIN, Char)#; read(STDIN, Char)
        option = Int(option) - 48

        if 1 <= option <= 3
            return discretization_options[option]
        elseif option == 4
            # exibe ajuda
        elseif option == 5
            exit()
        else
            valid = false
        end

    end
end


function discretization_submenu()
    valid = true
    while true
        display_banner()

        

        bins_number = 0

    end
end


function codification_menu()
    codification_menu = 
    """
       ---------------------------
          Método de Codificação
       ---------------------------
       1 - Padrão
       2 - Sair
    """
    print(codification_menu)
    print("   Opção: ")

    opcao = read(STDIN, Char)
    return opcao
end