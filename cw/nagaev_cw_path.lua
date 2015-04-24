local function findMaxDistance(v1, v2, t, d)
    local v_1 = math.min(v1, v2)
    local v_2 = math.max(v1, v2)
    if t == 2 then
        assert(v_2 - v_1 <= d)
        return v_1 + v_2
    else
        return v_1 + findMaxDistance(v_1 + d, v_2, t - 1, d)
    end
end

local v1 = io.read('*n')
local v2 = io.read('*n')
local t = io.read('*n')
local d = io.read('*n')

local result = findMaxDistance(v1, v2, t, d)
print(result)
