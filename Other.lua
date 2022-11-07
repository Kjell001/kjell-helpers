function log(...)
    if DEBUG then
        print(...)
    end
end

function logFormat(...)
   log(string.format(...))
end

-- Returns new instance of the same class, same aruments as init
function newInstance(source, ...)
    local instance = {}
    setmetatable(instance, getmetatable(source))
    instance:init(...)
    return instance
end

function vecFunc(v, func, ...)
    local x = func(v.x, ...)
    local y = func(v.y, ...)
    if not v.z then
        return vec2(x, y)
    end
    local z = func(v.z, ...)
    if not v.w then
        return vec3(x, y, z)
    end
    local w = func(v.w, ...)
    return vec4(x, y, z, w)
end

function hex2color(x)
   local correctLength = Set{2, 6, 8}:contains(x:len())
   assert(correctLength, "Wrong length hex string (" .. x:len() .. ")")
   local values = {}
   for n in x:gmatch("..") do
      local value = tonumber(n, 16)
      assert(value, "Invalid hex value '" .. n .. "'")
      table.insert(values, value)
   end
   return color(table.unpack(values))
end
