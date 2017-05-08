
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
        edges = binedges(discretization_algorithm, data[col])
        disc = LinearDiscretizer(edges)
        disc_array = encode(disc, data[col])
        data[col] = DataArray(disc_array)
        println(edges, " nbins: ", length(edges)-1)
        println(disc_array)
    end

    return data

end