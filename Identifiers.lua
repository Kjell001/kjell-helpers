function isTable(x)
    return type(x) == "table"
end

function isNumber(x)
    return type(x) == "number"
end

MT_VEC2 = getmetatable(vec2())
function isVec2(x)
    return getmetatable(x) == MT_VEC2
end

MT_VEC3 = getmetatable(vec3())
function isVec3(x)
    return getmetatable(x) == MT_VEC3
end

MT_VEC4 = getmetatable(vec4())
function isVec4(x)
    return getmetatable(x) == MT_VEC4
end
