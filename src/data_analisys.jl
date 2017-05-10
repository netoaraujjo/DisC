

using Winston

function plot_attributes_graph(path::String, data::DataFrame)
    for col = 1:size(data, 2)
        p = plot(data[col])
        savefig(p, string(path, names(data)[col], ".png"))
    end
end