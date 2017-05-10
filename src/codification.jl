
# 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'

# codify!
function data_encode!(data::DataFrame, encode_method::Symbol)
    if encode_method == :none
        return data
    else
        ## execute default method ##

        # criar a string com caracteres, constante
        const str_chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#\$%&()*+-./:<=>?@[\\]^_`{|}~"

        # criar o array de caracteres
        arr_chars = [ch for ch in str_chars]

        for col = 1:size(data, 2)
            if contains(string(eltype(data[col])), "Int")
                data[col] = DataArray(labeler(arr_chars, data[col]))
            end
        end

        return data
    end
end


function labeler(arr_chars::Array{Char}, data_col::DataArray{Int})
    label_dict = Dict{Int, String}()
    unique_values = Set{Int}(data_col)

    # constroi o dicionario de codigos
    for value in unique_values
        label_dict[value] = generate_code(arr_chars, rand(5:30))
    end

    codified_data_col = []

    for value in data_col
        push!(codified_data_col, label_dict[value])
    end

    return DataArray(codified_data_col)
end


function generate_code(arr_chars::Array, code_length::Int)
    code = ""
    for n = 1:code_length
        # shufle
        code = string(code, arr_chars[rand(1:size(arr_chars, 1))])
    end
    return join(code)
end