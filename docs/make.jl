using SharpArithmetic
using Documenter

DocMeta.setdocmeta!(SharpArithmetic, :DocTestSetup, :(using SharpArithmetic); recursive=true)

makedocs(;
    modules=[SharpArithmetic],
    authors="Federico Stra <stra.federico@gmail.com> and contributors",
    repo="https://github.com/FedericoStra/SharpArithmetic.jl/blob/{commit}{path}#{line}",
    sitename="SharpArithmetic.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://FedericoStra.github.io/SharpArithmetic.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/FedericoStra/SharpArithmetic.jl",
)
