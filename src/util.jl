

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
       |___/  |_| |____|  \\___|  | Version: 0.0.5 (alpha)

    """

    print(banner)
end