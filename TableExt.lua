function table.copy(t)
    assert(type(t) == "table", "Expected table, got " .. type(t))
    local new = {}
    for k,v in pairs(t) do
        new[k] = v
    end
    return new
end

function table.show(t)
    print(t)
    for k,v in pairs(t) do
        local format = isNumber(k) and "%3.0f: %s" or "%s: %s"
        print(string.format(format, k, tostring(v)))
    end
end

function table.contains(t, x)
   for k,v in pairs(t) do
      if x == v then
         return k
      end
   end
   return false
end

function table.sortAlong(t, ref)
    local n = #t
    assert(#ref == n, "Tables must be of equal length")
    -- Get permutation indices
    local index = {}
    for i = 1, n do
        index[i] = i
    end
    -- Determine new order of values
    table.sort(index, function(a, b) return ref[a] < ref[b] end)
    -- Re-order elements in new table
    local newOrder = {}
    for i = 1, n do
        newOrder[i] = t[index[i]]
    end
    -- Change table in place
    for i = 1, n do
        t[i] = newOrder[i]
    end
end

function table.equal(t1, t2)
    for k, v in pairs(t1) do
        if type(v) == "table" then
            if not table.equal(v, t2[k]) then
                return false
            end
        else
            if t2[k] ~= v then
                return false
            end
        end
    end
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if not table.equal(v, t1[k]) then
                return false
            end
        else
            if t1[k] ~= v then
                return false
            end
        end
    end
    return true
end
