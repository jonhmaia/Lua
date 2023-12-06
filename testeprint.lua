--a = print
--print = nil
--a("Hello World!")
function apply (f,v)
    return f(v)
end
print(apply(math.sin, 12))