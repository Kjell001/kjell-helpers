function math.round(x, n)
    local f = 10^(n or 0)
    return math.floor(x * f + 0.5) / f
end

function math.sign(x)
   if x == 0 then return 0 end
   return 1 and x > 0 or -1
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

function math.circularMean(...)
   local args = {...}
   local sumSin, sumCos = 0, 0
   for _, angle in ipairs(args) do
      sumSin = sumSin + math.sin(angle)
      sumCos = sumCos + math.cos(angle) 
   end
   return math.atan(sumSin, sumCos)
end

function math.sum(...)
   local args = {...}
   local sum = args[1]
   for i = 2, #args do
      sum = sum + args[i]
   end
   return sum
end
