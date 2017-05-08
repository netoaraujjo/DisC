

using DataFrames

function read_file(path::String, separator::Char, header::Bool)
    display_banner()
    if isfile(path)
        println("   Carregando data set...")
        data = readtable(path, separator = separator, header = header)
        return data
    else
        println("Arquivo inválido!")
        exit()
    end
end

function write_file(data::DataFrame, path::String, separator::Char, header::Bool)
    writetable(path, data, separator = separator, header = false)
    if header
        out_file_handler = open(string(path, "_attrs"), "w")
        write(out_file_handler, join(names(data), separator))
        close(out_file_handler)
    end
end