module SharpArithmetic

export CompSum

export
    comp_sorted_add,
    comp_add,
    comp_sorted_sum,
    comp_sum,
    naive_sum,
    naive_sum2,
    value

struct CompSum{T}
    main::T
    err::T
end

value(x::CompSum) = x.main + x.err

@inline function comp_sorted_add(x::Number, y::Number)
    # @assert abs(x) >= abs(y)
    s = x + y
    e = (x - s) + y
    CompSum(s, e)
end

@inline function comp_add(x::Number, y::Number)
    if abs(x) < abs(y)
        x, y = y, x
    end
    comp_sorted_add(x, y)
end

@inline function comp_sorted_add(x::CompSum{<:Number}, y::Number)
    cs = comp_sorted_add(x.main, y)
    CompSum(cs.main, x.err + cs.err)
end

@inline function comp_add(x::CompSum{<:Number}, y::Number)
    cs = comp_add(x.main, y)
    CompSum(cs.main, x.err + cs.err)
end

function comp_sorted_sum(xs)
    cs = CompSum(zero(eltype(xs)), zero(eltype(xs)))
    for x in xs
        cs = comp_sorted_add(cs, x)
    end
    cs
end

function comp_sum(xs)
    cs = CompSum(zero(eltype(xs)), zero(eltype(xs)))
    for x in xs
        cs = comp_add(cs, x)
    end
    cs
end

function naive_sum(xs)
    s = zero(eltype(xs))
    for x in xs
        s += x
    end
    s
end

function naive_sum2(xs)
    sum(x for x in xs)
end

end
