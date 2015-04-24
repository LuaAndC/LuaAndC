local function right(x, w, index)
    return x[index] + w[index]
end

local function left(x, w, index)
    return x[index] - w[index]
end

local function solveClique(x, w)
    assert(#x == #w)
    local n = #x
    -- numbers of points
    local numbers = {}
    for i = 1, n do
        table.insert(numbers, i)
    end
    -- sort indices of points by right boundary
    table.sort(numbers, function(i, j)
        return right(x, w, i) < right(x, w, j)
    end)
    -- greedy algorithm
    local ans = 1
    local index = 1
    for i = 2, n do
        if left(x, w, numbers[i]) >=
                right(x, w, numbers[index]) then
            index = i
            ans = ans + 1
        end
    end
    return ans
end

local n = io.read('*n')
local x = {}
local w = {}
for i = 1, n do
    local xi = io.read('*n')
    local wi = io.read('*n')
    table.insert(x, xi)
    table.insert(w, wi)
end
local result = solveClique(x, w)
print(result)
