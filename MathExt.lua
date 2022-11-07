function math.round(x, n)
    local f = 10^(n or 0)
    return math.floor(x * f + 0.5) / f
end

function math.vecFloor(v)
    return vecFunc(v, math.floor)
end

function math.vecCeil(v)
    return vecFunc(v, math.ceil)
end

function math.vecRound(v, n)
    return vecFunc(v, math.round, n)
end

function math.sum(...)
   local args = {...}
   local sum = args[1]
   for i = 2, #args do
      sum = sum + args[i]
   end
   return sum
end
