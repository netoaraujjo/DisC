

using Winston

function plot_attributes_graph(output_dir::String, file_name::String, data::DataFrame)
    for col = 1:size(data, 2)
        attr_name = string(names(data)[col])
        p = plot(data[col])
        title("$file_name - $(replace(attr_name, "_", " "))")
        xlabel("Index")
        ylabel(replace(attr_name, "_", " "))
        savefig(p, string(output_dir, "/", file_name, "_", attr_name, ".png"))
    end
end