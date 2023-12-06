
function delta(a, b, c)   
    return b^2 - 4*a*c
end

function bhaskara(a, b, c)
    local d = delta(a, b, c)
    if d < 0 then
        error("Não há raízes reais para delta negativo")
    elseif d == 0 then
        local x = -b / (2*a)
        return x
    else
        local x1 = (-b + math.sqrt(d)) / (2*a)
        local x2 = (-b - math.sqrt(d)) / (2*a)
        return x1, x2
    end
end

function main()
    local a = 1
    local b = 2
    local c = -3

    local result = bhaskara(a, b, c)
    print("Resultado:", result)
end

main()

