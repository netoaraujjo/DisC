
using Discretizers

function discretize!(data::DataFrame, discretization_method::Symbol, nbins)

    discretization_algorithm = nothing

    if discretization_method == :none
        return data
    elseif discretization_method == :ewd
        discretization_algorithm = DiscretizeUniformWidth(nbins)
    elseif discretization_method == :efd
        discretization_algorithm = DiscretizeUniformCount(nbins)
    else
        discretization_algorithm = DiscretizeBayesianBlocks()
    end

    cols = size(data, 2) # columns number

    for col = 1:cols
        # data_col_type = eltype(data[col])
        # if data_col_type == Float32 || data_col_type == Float64
        if contains(string(eltype(data[col])), "Float")
            edges = binedges(discretization_algorithm, data[col])
            disc = LinearDiscretizer(edges)
            disc_array = encode(disc, data[col])
            data[col] = DataArray(disc_array)
            println("   Atributo $col", " nbins: ", length(edges)-1)
        end
    end

    return data

end